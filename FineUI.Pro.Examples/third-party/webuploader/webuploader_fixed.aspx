<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="webuploader_fixed.aspx.cs" Inherits="FineUI.Pro.Examples.thirdparty.webuploader_fixed" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/third-party/webuploader/fileupload.ashx;~/common/Download.ashx" />
    <style>
        
        .webuploader-element-invisible {
            position: absolute !important;
            clip: rect(1px,1px,1px,1px);
        }

        .webuploader-pick-disable {
            opacity: 0.6;
            pointer-events: none;
        }

        .theuploadbutton {
            display: inline-block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" runat="server" ShowHeader="true" ShowBorder="true" Title="论文分段上传"
            Height="350px" EnableCollapse="false" EnableCheckBoxSelect="false" EmptyText="尚未上传文件"
            DataIDField="id">
            <Columns>
                <f:RenderField ColumnID="SectionName" DataField="sectionname" HeaderText="章节" />
                <f:RenderField ColumnID="FileName" DataField="name" HeaderText="文件名" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:RenderField ColumnID="FileType" DataField="type" HeaderText="类型" />
                <f:RenderField ColumnID="FileSize" DataField="size" HeaderText="大小" Renderer="FileSize" />
                <f:RenderField ColumnID='FileStatus' DataField="status" HeaderText="状态" RendererFunction="renderStatus" />
                <f:RenderField ColumnID='FileActions' Width="150px" EnableColumnHide="false" RendererFunction="renderActions" />
                <f:RenderField ColumnID="FileSavedName" Hidden="true" EnableColumnHide="false" DataField="savedName"></f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        注：由于第三方组件WebUploader限制，本示例支持的浏览器版本为：Chrome、Firefox、Safari、IE10+ 。
    </form>
    <script src="../../res/third-party/webuploader/webuploader.nolog.js" type="text/javascript"></script>
    <script type="text/javascript">

        var BASE_URL = '<%= PageContext.ResolveUrl("~/") %>';
        var SERVER_URL = BASE_URL + 'third-party/webuploader/fileupload.ashx?handler=Process';

        function renderStatus(value, params) {
            if (!value) {
                return '尚未上传';
            }
            if (value === 'uploaded') {
                return '上传成功';
            }
        }

        function renderActions(value, params) {
            // 如果正在上传，则删除所有的动作按钮
            if (value === 'uploading') {
                return '';
            }


            var html = '<a href="javascript:;" class="theuploadbutton">上传</a>';

            // 状态、保存到服务器的文件名、
            var status = params.rowValue['FileStatus'];
            var savedName = params.rowValue['FileSavedName'];

            // 如果已经上传成功，则显示下载按钮
            if (status === 'uploaded') {
                var downloadUrl = BASE_URL + 'common/Download.ashx?file=' + encodeURIComponent(savedName);
                html += '&nbsp;&nbsp;<a href="' + downloadUrl + '" target="_blank" class="thedownloadbutton">下载</a>';

                html += '&nbsp;&nbsp;<a href="javascript:;" class="thedeletebutton">删除</a>';
            }

            return html;
        }

        // sizeLimit： 单个文件大小限制，单位为MB
        function initUploader(gridId, rowId, ownerId, accept, sizeLimit, success) {
            var grid1 = F(gridId);

            var uploaderOptions = {

                // swf文件路径
                runtimeOrder: 'html5',

                // 文件接收服务端。
                server: SERVER_URL,

                // 选择文件的按钮。可选。
                // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                pick: {
                    id: '#' + gridId + ' tr[data-rowid=' + rowId + '] a.theuploadbutton',
                    multiple: false
                },

                // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
                resize: false,

                // 自动上传
                auto: true,

                // 文件上传参数表，用来标记文件的所有者（如果是一篇文章的附件，就是文章的ID）
                formData: {
                    owner: ownerId + '#' + rowId
                },

                // 单个文件大小限制（单位：byte）
                fileSingleSizeLimit: sizeLimit * 1024 * 1024,

                // 验证文件总数量, 超出则不允许加入队列
                fileNumLimit: 1

            };

            if (accept) {
                $.extend(uploaderOptions, {
                    accept: accept
                });
            }


            var uploader = WebUploader.create(uploaderOptions);

            // 添加到上传队列
            uploader.on('fileQueued', function (file) {
                // 将文件所属的表格行ID保存到 WebUploader 内部的 file 对象上
                file.gridRowId = rowId;

                // 更新当前行的数据（最后一个参数是强制更新，不显示左上角红色标记）
                grid1.updateCellValue(rowId, {
                    'FileName': file.name,
                    'FileType': file.ext,
                    'FileSize': file.size,
                    'FileStatus': '等待上传',
                    'FileActions': 'uploading'
                }, true);
            });


            uploader.on('uploadProgress', function (file, percentage) {
                var cellEl = grid1.getCellEl(file.gridRowId, 'FileStatus').find('.f-grid-cell-text');

                var barEl = cellEl.find('.f-progressbar-value');

                // 避免重复创建
                if (!barEl.length) {
                    cellEl.html('<div class="f-progressbar f-widget-content" style="height:12px;">' +
                      '<div class="f-progressbar-value f-widget-header" style="width:0%">' +
                      '</div></div>');
                    barEl = cellEl.find('.f-progressbar-value');
                }

                barEl.css('width', percentage * 100 + '%');
            });

            uploader.on('uploadSuccess', function (file) {
                grid1.updateCellValue(file.gridRowId, 'FileStatus', '上传成功', true);
            });

            uploader.on('uploadError', function (file) {
                grid1.updateCellValue(file.gridRowId, 'FileStatus', '上传出错', true);
            });

            // 不管上传成功还是失败，都会触发 uploadComplete 事件
            uploader.on('uploadComplete', function (file) {
                uploader.removeFile(file, true);

                if (success) {
                    success.call(uploader);
                }
            });

            uploader.on('error', function (type, arg, file) {
                if (type === 'F_EXCEED_SIZE') {
                    F.alert('文件[' + file.name + ']大小超出限制值（' + F.format.fileSize(arg) + '）');
                } else if (type === 'Q_TYPE_DENIED') {
                    // 这个类型有两种成因：空文件、扩展名不在 accept 白名单里。
                    // 注意它派发时第二个参数就是 file 本身（不是大小上限），别照上面那条的签名去取。
                    F.alert(arg.size
                        ? '文件[' + arg.name + ']的类型不允许上传。'
                        : '文件[' + arg.name + ']是空文件，无法上传。');
                }
            });

        }

        var gridClientID = '<%= Grid1.ClientID %>';

        function onGridDataLoad(event) {
            var grid1 = this;

            grid1.el.find('a.theuploadbutton').each(function () {
                var targetEl = $(this);
                var rowEl = targetEl.parents('.f-grid-row');
                var rowData = grid1.getRowData(rowEl);

                initUploader(gridClientID, rowData.id, 'webuploader.webuploader_fixed', {
                    mimeTypes: '.doc,.docx'
                }, 10, function () {
                    F.customEvent('Grid1_Rebind');
                });
            });
        }

        F.ready(function() {
            var grid1 = F(gridClientID);
            grid1.el.on('click', 'a.thedeletebutton', function(event) {
                event.preventDefault();
                var targetEl = $(this);
                var rowData = grid1.getRowData(targetEl.closest('.f-grid-row'));
                F.customEvent('Grid1_DeleteRow', rowData.id);
            });
        });
        
    </script>
</body>
</html>
