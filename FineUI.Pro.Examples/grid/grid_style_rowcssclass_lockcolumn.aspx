<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_style_rowcssclass_lockcolumn.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_style_rowcssclass_lockcolumn" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        .f-grid-row.color1 .f-grid-cell-bfName,
        .f-grid-row.color1 .f-grid-cell-tfGender,
        .f-grid-row.color1 .f-grid-cell-bfEntranceYear {
            color: red;
            font-weight: bold;
        }

        .f-grid-row.color3 .f-grid-cell-bfName,
        .f-grid-row.color3 .f-grid-cell-tfGender,
        .f-grid-row.color3 .f-grid-cell-bfEntranceYear {
            color: green;
            font-weight: bold;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" AllowColumnLocking="true" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:RowNumberField />
                <f:RenderField EnableLock="true" Locked="true" ColumnID="bfName" DataField="Name" HeaderText="姓名" />
                <f:RenderField EnableLock="true" ColumnID="tfGender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField EnableLock="true" ColumnID="bfEntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField EnableLock="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" EnableLock="true" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
                    RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" EnableLock="true" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <br />
        <f:Button ID="Button2" runat="server" CssClass="marginr" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <f:Button ID="Button1" runat="server" Text="重新绑定表格" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
