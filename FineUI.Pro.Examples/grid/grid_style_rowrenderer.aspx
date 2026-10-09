<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_style_rowrenderer.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_style_rowrenderer" %>

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
            EnableCheckBoxSelect="true" RowRendererFunction="grid1RowRenderer">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="bfName" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="tfGender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="bfEntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
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
    <script>
        // 在 RowRenderer 中改变行CSS类
        function grid1RowRenderer(params) {
            var entranceYear = params.rowData.values['bfEntranceYear'];

            // 注意：[入学年份]列的类型是RenderField（而不是BoundField），同时我们设置了FieldType="Int"，这样 entranceYear 变量才是整型（而不是字符串）

            if (entranceYear >= 2000 && entranceYear <= 2004) {
                params.rowCls = "color1";
            } else if (entranceYear == 2008) {
                params.rowCls = "color3";
            }
        }

    </script>
</body>
</html>
