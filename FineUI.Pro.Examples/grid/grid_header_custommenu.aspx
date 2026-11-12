<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_header_custommenu.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_header_custommenu" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

    <style>
        .f-grid-allcolumns-hidden-message {
            display: none !important;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            EnableHeaderMenu="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
            </Columns>
            <Tools>
                <f:Tool runat="server" ID="toolColumns" IconFont="_ColumnsAlt" Text="管理列" ToolTip="显示隐藏列" TabIndex="0" ClickHandler="onToolColumnsClick">
                </f:Tool>
            </Tools>
        </f:Grid>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';
        var toolColumnsClientID = '<%= toolColumns.ClientID %>';

        function onToolColumnsClick(event) {
            var toolEl = this.el; // 当前工具图标元素

            F(Grid1ClientID).showColumnsMenu(toolEl);
        }

        //function createMenuItems() {
        //    var grid1 = F(Grid1ClientID);

        //    var columns = grid1.columns;
        //    var columnsMenuItems = [];
        //    $.each(columns, function (index, column) {
        //        if (column.hideable) {
        //            var menuCheckBox = F.create({
        //                type: 'MenuCheckBox',
        //                text: column.text,
        //                checked: !column.hidden,
        //                handler: function (event) {
        //                    var checked = this.isChecked();
        //                    grid1.hideColumn(event, column, !checked);
        //                }
        //            });
        //            columnsMenuItems.push(menuCheckBox);
        //        }
        //    });

        //    return F.create({
        //        type: 'Menu',
        //        items: columnsMenuItems
        //    });
        //}

        //F.ready(function () {
        //    // 为工具图标设置菜单
        //    F(toolColumnsClientID).setMenu(createMenuItems());
        //});

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>关闭表头自带菜单入口，改用标题栏的管理列工具打开列选择菜单。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>使用自定义入口切换列显示</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("toolColumns").ClientID %>'
                        title="管理列">管理列</strong>，取消<strong><strong>入学年份</strong></strong>的勾选，再重新勾选。<br />结果：菜单控制对应列的显示与隐藏，数据不被删除；列全部隐藏时采用本页配置的提示样式。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableHeaderMenu</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>false</code>，初始关闭内置表头菜单入口。
                </li>
                <li><code>showColumnsMenu</code>（<strong>页面脚本</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：在管理列工具旁打开表格自己的列选择菜单，无需重新创建数据列。</li>
            </ul>
        </section>
    </template>
</body>
</html>
