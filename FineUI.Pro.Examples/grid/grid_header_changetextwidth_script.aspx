<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_header_changetextwidth_script.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_header_changetextwidth_script" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true" AllowPaging="true"
            IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField Width="150px" ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" CssClass="marginr" runat="server" Text="修改[入学年份]的标题文本和宽度" OnClick="Button1_Click">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="还原[入学年份]" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        注：后台通过注册 JavaScript 代码来改变列的宽度和标题文本。
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var grid1ClientID = '<%= Grid1.ClientID %>';

        // 改变列的标题文本和宽度
        function changeColumnTitleAndWidth(title, width) {
            var grid1 = F(grid1ClientID);

            var entranceYearColumn = grid1.getColumn('EntranceYear');
            entranceYearColumn.text = title;
            entranceYearColumn.width = width;

            grid1.loadData();
        }

    </script>
</body>
</html>
