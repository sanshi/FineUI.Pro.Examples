<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_header_wrap.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_header_wrap" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-colheader-Major .f-grid-colheader-text {
            white-space: normal;
            word-break: break-all;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" Height="300px" runat="server"
            AllowSorting="true" SortField="Gender" SortDirection="ASC" OnSort="Grid1_Sort">
            <Columns>
                <f:RowNumberField />
                <f:RenderField SortField="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" SortField="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" SortField="Major" HeaderText="所学专业（这是很长很长很长很长很长很长很长很长很长的标题文本，可以自动换行）" Width="150px" DataField="Major"
                    RendererFunction="renderMajor" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
