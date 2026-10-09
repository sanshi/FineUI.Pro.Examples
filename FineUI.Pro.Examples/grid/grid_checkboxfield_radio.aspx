<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkboxfield_radio.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkboxfield_radio" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-field-body-checkboxlabel {
            white-space: nowrap;
        }

    </style>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid AllowCellEditing="true" DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            runat="server">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校1" />
                <f:RenderCheckField ColumnID="CheckBoxField1" RenderAsStaticField="false" HeaderText="是否在校1" />
                <f:RenderCheckField ColumnID="CheckBoxField2" RenderAsStaticField="false" HeaderText="是否在校2" DisplayType="Switch" />
                <f:RenderCheckField PreciseClick="true" ColumnID="CheckBoxField3" RenderAsStaticField="false" HeaderText="是否在校3" DisplayType="Radio" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行复选框的状态" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-pro.js") %>"></script>
    <script>
        var grid1ClientID = '<%= Grid1.ClientID %>';

        F.ready(function() {
            var grid = F(grid1ClientID);
            // 等框架写入新布尔值后再处理互斥；点击时读取图标可能仍是修改前的状态。
            grid.on('afteredit', function(event, value, params) {
                var checkColumns = ['CheckBoxField1', 'CheckBoxField2', 'CheckBoxField3'];
                if (value !== true || checkColumns.indexOf(params.columnId) < 0) {
                    return;
                }
                grid.resolveRow(function(rowData) {
                    if (rowData.id !== params.rowId) {
                        grid.updateCellValue(rowData.id, params.columnId, false);
                    }
                });
            });
        });

    </script>
</body>
</html>
