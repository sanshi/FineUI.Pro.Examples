<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridrowgroup_summary_renderer.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridrowgroup.gridrowgroup_summary_renderer" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-rowgroup-summary .f-grid-cell-Major .f-grid-cell-text {
            text-align: right;
        }

        .f-grid-rowgroup-summary .f-grid-cell-text {
            font-style: italic;
        }

        .f-grid-rowgroup-summary .f-grid-cell.color1 .f-grid-cell-text {
            font-weight: bold;
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            DataIDField="Id" DataTextField="Name" EnableRowGroup="true" DataRowGroupField="EntranceYear" RowGroupSummary="true">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}"
                    HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor"
                    ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业" RowGroupSummaryText="平均（分组）：">
                </f:RenderField>
                <f:RenderField DataField="ChineseScore" FieldType="Int" ColumnID="ChineseScore" HeaderText="语文成绩" RowGroupSummaryType="Avg" RowGroupSummaryRendererFunction="chineseScoreRowGroupSummaryRenderer" />
                <f:RenderField DataField="MathScore" FieldType="Int" ColumnID="MathScore" HeaderText="数学成绩" RowGroupSummaryType="Avg" RowGroupSummaryRendererFunction="mathScoreRowGroupSummaryRenderer" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="../res/js/grid.js"></script>

    <script>

        function chineseScoreRowGroupSummaryRenderer(summaryRowIndex, cellValue, params) {

            if (parseInt(cellValue, 10) >= 90) {
                params.cellCls = 'color1';
            }

            return cellValue;
        }

        function mathScoreRowGroupSummaryRenderer(summaryRowIndex, cellValue, params) {

            if (parseInt(cellValue, 10) >= 90) {
                params.cellCls = 'color1';
            }

            return cellValue;
        }

    </script>

</body>
</html>
