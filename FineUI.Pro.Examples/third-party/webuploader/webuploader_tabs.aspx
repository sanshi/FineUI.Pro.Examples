<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="webuploader_tabs.aspx.cs" Inherits="FineUI.Pro.Examples.thirdparty.webuploader_tabs" %>

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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="350px" ShowBorder="true" TabPosition="Top"
            EnableTabCloseMenu="false" ActiveTabIndex="0"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab1" Title="上传压缩文档" BodyPadding="10px" Layout="Fit"
                    runat="server">
                    <Items>
                        <f:Grid ID="Grid1" runat="server" ShowHeader="false" ShowBorder="true"
                            EnableCollapse="false" EnableCheckBoxSelect="false" EmptyText="尚未上传文件"
                            DataIDField="id" OnRowCommand="Grid1_RowCommand">
                            <Toolbars>
                                <f:Toolbar ID="Toolbar1" runat="server">
                                    <Items>
                                        <f:Button runat="server" ID="btnSelectFiles" IconFont="_Plus" Text="选择文件上传"></f:Button>
                                    </Items>
                                </f:Toolbar>
                            </Toolbars>
                            <Columns>
                                <f:BoundField ColumnID="FileName" DataField="name" HeaderText="文件名" ExpandUnusedSpace="true" MinWidth="150px" />
                                <f:RenderField ColumnID="FileSize" DataField="size" HeaderText="大小" Renderer="FileSize" />
                                <f:BoundField ColumnID='FileStatus' DataField="status" NullDisplayText="已完成" HeaderText="状态" />
                                <f:LinkButtonField ColumnID="Delete" Width="60px" ConfirmText="你确定要删除这个文件吗？" ConfirmTarget="Top"
                                    CommandName="Delete" IconUrl="~/res/icon/delete.png" />
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab2" Title="上传图片文档" BodyPadding="10px" Layout="Fit"
                    runat="server">
                    <Items>
                        <f:Grid ID="Grid2" runat="server" ShowHeader="false" ShowBorder="true"
                            EnableCollapse="false" EnableCheckBoxSelect="false" EmptyText="尚未上传图片"
                            DataIDField="id" OnRowCommand="Grid2_RowCommand">
                            <Toolbars>
                                <f:Toolbar runat="server">
                                    <Items>
                                        <f:Button runat="server" ID="btnSelectFiles2" IconFont="_Plus" Text="选择图片上传"></f:Button>
                                    </Items>
                                </f:Toolbar>
                            </Toolbars>
                            <Columns>
                                <f:BoundField ColumnID="FileName" DataField="name" HeaderText="文件名" ExpandUnusedSpace="true" MinWidth="150px" />
                                <f:RenderField ColumnID="FileSize" DataField="size" HeaderText="大小" Renderer="FileSize" />
                                <f:BoundField ColumnID='FileStatus' DataField="status" NullDisplayText="已完成" HeaderText="状态" />
                                <f:LinkButtonField ColumnID="Delete" Width="60px" ConfirmText="你确定要删除这个图片吗？" ConfirmTarget="Top"
                                    CommandName="Delete" IconUrl="~/res/icon/delete.png" />
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Tab>
            </Tabs>
            <Listeners>
                <f:Listener Event="tabchange" Handler="onTabStripChange" />
            </Listeners>
        </f:TabStrip>
        <br />
        <br />
        注：由于第三方组件WebUploader限制，本示例支持的浏览器版本为：Chrome、Firefox、Safari、IE10+ 。
    </form>
    <script src="../../res/third-party/webuploader/webuploader.nolog.js" type="text/javascript"></script>
    <script type="text/javascript">

        var BASE_URL = '<%= PageContext.ResolveUrl("~/") %>';
        var SERVER_URL = BASE_URL + 'third-party/webuploader/fileupload.ashx?handler=Process';

        // sizeLimit： 单个文件大小限制，单位为MB
        function initUploader(gridId, pickerId, ownerId, accept, sizeLimit, success) {
            var grid1 = F(gridId);

            var uploaderOptions = {

                // swf文件路径
                runtimeOrder: 'html5',

                // 文件接收服务端。
                server: SERVER_URL,

                // 选择文件的按钮。可选。
                // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                pick: '#' + pickerId,

                // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
                resize: false,

                // 自动上传
                auto: true,

                // 文件上传参数表，用来标记文件的所有者（如果是一篇文章的附件，就是文章的ID）
                formData: {
                    owner: ownerId
                },

                // 单个文件大小限制（单位：byte），这里限制为 10M
                fileSingleSizeLimit: sizeLimit * 1024 * 1024

            };

            if (accept) {
                $.extend(uploaderOptions, {
                    accept: accept
                });
            }


            var uploader = WebUploader.create(uploaderOptions);

            //// 添加到上传队列
            //uploader.on('fileQueued', function (file) {
            //    grid1.addNewRecord(file.id, {
            //        'FileName': file.name,
            //        'FileSize': file.size,
            //        'FileStatus': '等待上传'
            //    }, true);
            //});

            // 当一批文件添加进队列以后触发
            uploader.on('filesQueued', function (files) {
                var records = [];
                $.each(files, function (index, file) {
                    records.push({
                        id: file.id,
                        values: {
                            'FileName': file.name,
                            'FileSize': file.size,
                            'FileStatus': '等待上传'
                        }
                    });
                });
                grid1.addNewRecords(records, true);
            });

            uploader.on('uploadProgress', function (file, percentage) {
                var cellEl = grid1.getCellEl(file.id, 'FileStatus').find('.f-grid-cell-text');

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
                var cellEl = grid1.getCellEl(file.id, 'FileStatus').find('.f-grid-cell-text');
                cellEl.text('上传成功');
            });

            uploader.on('uploadError', function (file) {
                var cellEl = grid1.getCellEl(file.id, 'FileStatus').find('.f-grid-cell-text');
                cellEl.text('上传出错');
            });

            // 不管上传成功还是失败，都会触发 uploadComplete 事件
            uploader.on('uploadComplete', function (file) {
                uploader.removeFile(file, true);
            });


            // 所有文件上传成功
            uploader.on('uploadFinished', function () {
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


        // 如果初始化 WebUploader 时按钮处于隐藏状态，则点击上传按钮无效。这里是做了一个补救措施
        function onTabStripChange(event, tab) {
            var container = tab.el.find('.webuploader-container');
            var pick = container.find('.webuploader-pick');
            var file = pick.next();

            var pickPos = pick.position();

            file.css({
                width: pick.width(),
                height: pick.height(),
                top: pickPos.top,
                left: pickPos.left
            });
        }


        var btnSelectFiles1ClientID = '<%= btnSelectFiles.ClientID %>';
        var grid1ClientID = '<%= Grid1.ClientID %>';

        var btnSelectFiles2ClientID = '<%= btnSelectFiles2.ClientID %>';
        var grid2ClientID = '<%= Grid2.ClientID %>';

        F.ready(function () {

            initUploader(grid1ClientID, btnSelectFiles1ClientID, 'webuploader.webuploader_tabs.1', undefined, 10, function () {
                F.customEvent('Grid1_Rebind');
            });


            initUploader(grid2ClientID, btnSelectFiles2ClientID, 'webuploader.webuploader_tabs.2', {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            }, 1, function () {
                F.customEvent('Grid2_Rebind');
            });

        });



    </script>
</body>
</html>
