<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_iframe_script_multi.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_iframe_script_multi" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_iframe_window.aspx" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" PageSize="3" runat="server"
            EnableCheckBoxSelect="true" DataIDField="Id" DataTextField="Name">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnApprove" Text="审批数据" Icon="ApplicationEdit" runat="server" ClickHandler="onApproveClick"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="Approve" Width="50px">
                    <Commands>
                        <f:Command RendererFunction="renderClientAction" Icon="Pencil" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Window ID="Window1" Title="审批" Hidden="true" EnableIFrame="true" runat="server" EnableMaximize="true" EnableResize="true" Target="Top"
            OnClose="Window1_Close" IsModal="true" Width="850px" Height="500px">
        </f:Window>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        var basePath = '<%= PageContext.ResolveUrl("~/grid/") %>';
        var gridClientID = '<%= Grid1.ClientID %>';
        var windowClientID = '<%= Window1.ClientID %>';

        function onApproveClick(event) {
            var grid = F(gridClientID);
            var wnd = F(windowClientID);

            if (!grid.hasSelection()) {
                F.alert('请至少选择一项！');
                return;
            }

            var selectedRows = grid.getSelectedRows(true);

            // DataIDField
            var selectedRowIds = $.map(selectedRows, function(item, index) {
                return item.id;
            }).join(',');

            // DataTextField
            var selectedRowTexts = $.map(selectedRows, function(item, index) {
                return item.text;
            }).join(',');

            // 编码后：grid_iframe_window.aspx?id=104,107,109&name=%E5%88%98%E5%9B%BD%2C%E9%BB%84%E5%A9%B7%E5%A9%B7%2C%E6%9D%A8%E5%A9%B7%E5%A9%B7
            // 解码后：grid_iframe_window.aspx?id=104,107,109&name=刘国,黄婷婷,杨婷婷
            var iframeUrl = basePath + 'grid_iframe_window.aspx?id=' + selectedRowIds + '&name=' + encodeURIComponent(selectedRowTexts);
            // 显示窗体
            wnd.show(iframeUrl, '审批 - ' + selectedRowTexts);
        }


        F.ready(function() {

            var grid = F(gridClientID);
            var wnd = F(windowClientID);

            grid.el.on('click', '.f-grid-cell-Approve a', function(event) {
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

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把选中多行的标识和姓名交给审批窗体，一次查看本次选择的记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>由表格记录打开审批窗体</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>勾选两行，点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnApprove").ClientID %>'
                        title="审批数据">审批数据</strong>。<br />结果：脚本用本次选中行集合生成网址参数和窗体标题，IFrame 内显示相应资料；<strong>姓名</strong>通过编码传入，不能直接拼接未编码文字。</li>
                <li>取消全部选择后再次点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnApprove").ClientID %>'
                        title="审批数据">审批数据</strong>。<br />结果：本页提示先选择记录，不打开一个没有对象的审批窗体。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：选择多行数据，然后点击[审批数据]按钮。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableIFrame</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="审批">审批</strong>）：初始为
                    <code>true</code>，在独立页面中呈现选中记录资料。
                </li>
                <li><code>getSelectedRows / show</code>（<strong>打开窗体的页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：从当前记录或选择集合取得稳定主键与显示文字，作为窗体地址及标题；本页不执行真实审批业务。</li>
            </ul>
        </section>
    </template>
</body>
</html>
