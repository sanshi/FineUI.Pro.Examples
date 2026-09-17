<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_rowdoubleclick_custompostback.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_rowdoubleclick_custompostback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/griddataurl/griddataurl.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" EnableCheckBoxSelect="true"
            runat="server" DataIDField="Id" DataTextField="Name" DataUrl="~/griddataurl/griddataurl.ashx">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int"
                    RendererFunction="renderGender" HeaderText="性别">
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor"
                    ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                </f:RenderField>
                <f:RenderField ColumnID="Group" DataField="Group" RendererFunction="renderGroup" HeaderText="分组">
                </f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="rowdblclick" Handler="onRowDblClick" />
            </Listeners>
        </f:Grid>
        <br />
    </form>
	<script src="../res/js/grid.js"></script>
    <script>

        function onRowDblClick(event, rowId) {
            var grid1 = this;

            var rowData = grid1.getRowData(rowId);

            // 第几行
            var rowIndex = grid1.getRowEl(rowId).index();

            F.customEvent('Grid1_RowDblClick', {
                rowIndex: rowIndex,
                rowId: rowData.id,
                rowText: rowData.text
            });
        }


    </script>
</body>
</html>
