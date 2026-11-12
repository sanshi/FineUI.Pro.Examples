<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_multiactions_column.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_multiactions_column" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_iframe_window.aspx" />
    <style>
        .f-grid-cell-Actions .action {
            display: inline-block;
            vertical-align: middle;
        }

    </style>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" PageSize="3" runat="server"
            EnableCheckBoxSelect="true" DataIDField="Id" DataTextField="Name">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField Width="180px" ColumnID="Actions" RendererFunction="renderActions1" />
            </Columns>
            <Listeners>
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="重新绑定表格" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />

        <f:Window ID="Window1" Title="审批" Hidden="true" EnableIFrame="true" runat="server" EnableMaximize="true" EnableResize="true" Target="Top"
            OnClose="Window1_Close" IsModal="true" Width="850px" Height="500px">
        </f:Window>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function renderActions1(value, params) {
            return $('<span>')
                .append($('<a>').addClass('action editit').attr('href', '#').append($('<img>').addClass('f-grid-imagefield').attr('src', F.resolveUrl(
                    '/res/icon/pencil.png'))))
                .append(document.createTextNode('  '))
                .append($('<a>').addClass('action deleteit').attr('href', '#').append($('<img>').addClass('f-grid-imagefield').attr('src', F.resolveUrl(
                    '/res/icon/delete.png'))))
                .append($('<div>').addClass('action btncontainer'));
        }

    </script>
    <script>
        var basePath = '<%= PageContext.ResolveUrl("~/grid/") %>';
        var gridClientID = '<%= Grid1.ClientID %>';
        var windowClientID = '<%= Window1.ClientID %>';


        // 表格数据加载完毕
        function onGridDataLoad(event) {
            var grid = this;

            grid.bodyEl.find('.f-grid-cell-Actions .btncontainer').each(function() {
                var btncontainer = $(this);
                F.create({
                    type: 'Button',
                    renderTo: btncontainer,
                    iconFont: 'user',
                    text: '动态按钮'
                });
            });

            // 动态创建的按钮会导致表格内内容错位，需要重新布局
            grid.doLayout();
        }

        F.ready(function() {

            var grid = F(gridClientID);
            var wnd = F(windowClientID);

            grid.el.on('click', '.f-grid-cell-Actions .action.editit', function(event) {
                event.preventDefault();
                var targetEl = $(this);
                var rowEl = targetEl.parents('.f-grid-row');
                var rowData = grid.getRowData(rowEl);
                var rowId = rowData.id;
                var rowText = rowData.text;

                // grid_iframe_window.aspx?id=104&name=刘国
                var iframeUrl = basePath + 'grid_iframe_window.aspx?id=' + rowId + '&name=' + encodeURIComponent(rowText);
                // 显示窗体
                wnd.show(iframeUrl, '审批 - ' + rowText);
            });


            grid.el.on('click', '.f-grid-cell-Actions .action.deleteit', function(event) {
                event.preventDefault();
                var targetEl = $(this);
                var rowEl = targetEl.parents('.f-grid-row');
                var rowData = grid.getRowData(rowEl);

                F.confirm({
                    message: '删除选中行？',
                    messageIcon: 'warning',
                    target: '_top',
                    ok: function() {
                        F.customEvent('Grid1_CustomDelete', {
                            rowIndex: rowEl.index(),
                            rowId: rowData.id,
                            rowText: rowData.text
                        });
                    }
                });

            });


            grid.el.on('click', '.f-grid-cell-Actions .action.btncontainer', function(event) {
                event.preventDefault();
                var targetEl = $(this);
                var rowEl = targetEl.parents('.f-grid-row');
                var rowData = grid.getRowData(rowEl);

                F.customEvent('Grid1_CustomEdit', {
                    rowIndex: rowEl.index(),
                    rowId: rowData.id,
                    rowText: rowData.text
                });
            });

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在同一操作列中放入多个动作入口，分别打开当前行窗口或提交该行的命令。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>识别每个动作所属的行</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>操作列中的编辑图标。<br />结果：浏览器读取图标所在行的数据并打开审批窗口，窗口地址及标题对应当前记录。</li>
                <li>关闭窗口，再点击某行的删除图标并确认。<br />结果：本页提交该行标识，后台提示点击的删除命令及对应记录；示例用提示说明命令处理，不代表已经删除数据库记录。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RendererFunction</code>（<strong>操作列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：在一个单元格中生成多个操作入口，事件委托按入口类型分别处理。</li>
                <li><code>getRowData</code>（<strong>页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：按当前点击元素所在的行读取业务主键与文字。</li>
            </ul>
        </section>
    </template>
</body>
</html>
