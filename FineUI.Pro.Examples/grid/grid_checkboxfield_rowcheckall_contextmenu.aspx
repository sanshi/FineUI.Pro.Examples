<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkboxfield_rowcheckall_contextmenu.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkboxfield_rowcheckall_contextmenu" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校1" />
                <f:RenderCheckField ColumnID="CheckBoxField1" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校1" />
                <f:RenderCheckField ColumnID="CheckBoxField2" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校2" />
                <f:RenderCheckField ColumnID="CheckBoxField3" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校3" />
            </Columns>
            <Listeners>
                <f:Listener Event="beforerowcontextmenu" Handler="onRowContextMenu" />
            </Listeners>
        </f:Grid>
        <f:Menu ID="Menu1" runat="server">
            <f:MenuButton ID="btnSelectRows" runat="server" Text="全选行" ClickHandler="onSelectRows"></f:MenuButton>
            <f:MenuButton ID="btnUnselectRows" runat="server" Text="取消行" ClickHandler="onUnselectRows"></f:MenuButton>
        </f:Menu>
        <br /><br />
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行复选框的状态" ClickHandler="onReadCheckStatesClick">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        function onReadCheckStatesClick(event) {
            var grid = F('<%= Grid1.ClientID %>');
            F.customEvent('CheckSelectedRows', {
                rows: getGridCheckRows(grid, ["CheckBoxField1", "CheckBoxField2", "CheckBoxField3"], true)
            });
            return false;
        }

        var menuID = '<%= Menu1.ClientID %>';

        // 返回false，来阻止浏览器右键菜单
        function onRowContextMenu(event, rowId) {
            F(menuID).show(); //showAt(event.pageX, event.pageY);
            return false;
        }

        var gridClientID = '<%= Grid1.ClientID %>';

        function onSelectRows(event) {
            setSelectedCheckColumns(gridClientID, ['CheckBoxField1', 'CheckBoxField2', 'CheckBoxField3'], true);
        }

        function onUnselectRows(event) {
            setSelectedCheckColumns(gridClientID, ['CheckBoxField1', 'CheckBoxField2', 'CheckBoxField3'], false);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>通过表格右键菜单统一勾选或取消已选记录的多个正文复选框列。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>从右键菜单批量设置正文列</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>选中一行或多行，在已选行上右键，再选择<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSelectRows").ClientID %>'
                        title="全选行">全选行</strong>。<br />结果：当前已选记录的可修改复选框列一起变为勾选，原来的行选择保留。</li>
                <li>再次打开右键菜单，选择<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnUnselectRows").ClientID %>'
                        title="取消行">取消行</strong>。<br />结果：这些记录的正文复选框一起清空；只读对照列不跟随修改。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>选中一些行，然后点击鼠标右键。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>updateCellValue</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：以列标识到布尔值的对象批量更新正文列，操作范围来自表格当前的选中行。</li>
            </ul>
        </section>
    </template>
</body>
</html>
