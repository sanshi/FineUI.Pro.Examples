<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowexpander_expandall_js.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowexpander_expandall_js" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" Height="500px" runat="server">
            <Columns>
                <f:RenderField RenderAsRowExpander="true" DataField="Desc" RendererFunction="renderExpander" />
                <f:RowNumberField Width="60px" ColumnID="Number" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
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
        注：请注意如何在重新绑定数据后，保持所有扩展列的展开状态。
        <br />
        这个示例演示了如何通过编写JavaScript脚本来处理不常见的逻辑，如果你对JavaScript不熟悉请参考下一个完成相同功能的示例（一个属性搞定）。
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script type="text/javascript">
        var gridClientID = '<%= Grid1.ClientID %>';

        function onGridDataLoad(event) {
            F(gridClientID).expandRowExpanders();
        }

    </script>
</body>
</html>
