<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_complex_property.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_complex_property" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="3" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="MyText" SortField="MyText" HeaderText="姓名" />
                <f:RenderField DataField="Year" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="MyCheckBox" HeaderText="是否在校" />
                <f:RenderField HeaderText="是否在校" DataField="MyCheckBox" RendererFunction="renderSchool1" />
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="Info.UserName" HeaderText="老师（二级属性）" />
            </Columns>
        </f:Grid>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        function renderSchool1(value, params) {
            return value === 'True' || value === true ? '是' : '否';
        }

    </script>
</body>
</html>
