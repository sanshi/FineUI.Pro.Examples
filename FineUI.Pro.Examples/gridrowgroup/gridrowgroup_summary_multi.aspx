<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridrowgroup_summary_multi.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridrowgroup.gridrowgroup_summary_multi" %>

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

        .f-grid-row-summary .f-grid-cell-Major .f-grid-cell-text {
            text-align: right;
        }

        .f-grid-row-summary .f-grid-cell-text {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" 
            EnableSummary="true" SummaryPosition="Bottom" SummaryRowCount="3"
            DataIDField="Id" DataTextField="Name" EnableRowGroup="true" DataRowGroupField="EntranceYear" RowGroupSummary="true" RowGroupSummaryRowCount="3">
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
                    ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业" SummaryRendererFunction="majorSummaryRenderer" RowGroupSummaryRendererFunction="majorRowGroupSummaryRenderer">
                </f:RenderField>
                <f:RenderField DataField="ChineseScore" FieldType="Int" ColumnID="ChineseScore" HeaderText="语文成绩" SummaryRendererFunction="chineseScoreSummaryRenderer" RowGroupSummaryRendererFunction="chineseScoreRowGroupSummaryRenderer" />
                <f:RenderField DataField="MathScore" FieldType="Int" ColumnID="MathScore" HeaderText="数学成绩" SummaryRendererFunction="mathScoreSummaryRenderer" RowGroupSummaryRendererFunction="mathScoreRowGroupSummaryRenderer" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="../res/js/grid.js"></script>
    <script>

        function majorSummaryRenderer(summaryRowIndex) {
            if (summaryRowIndex == 0) {
                return "最小值：";
            } else if (summaryRowIndex == 1) {
                return "最大值：";
            } else if (summaryRowIndex == 2) {
                return "平均值：";
            }
        }

        function chineseScoreSummaryRenderer(summaryRowIndex) {
            var grid1 = this, result;

            if (summaryRowIndex == 0) {
                result = grid1.calcSummaryValue('ChineseScore', 'min');
            } else if (summaryRowIndex == 1) {
                result = grid1.calcSummaryValue('ChineseScore', 'max');
            } else if (summaryRowIndex == 2) {
                result = grid1.calcSummaryValue('ChineseScore', 'avg');
            }
            return result;
        }

        function mathScoreSummaryRenderer(summaryRowIndex) {
            var grid1 = this, result;

            if (summaryRowIndex == 0) {
                result = grid1.calcSummaryValue('MathScore', 'min');
            } else if (summaryRowIndex == 1) {
                result = grid1.calcSummaryValue('MathScore', 'max');
            } else if (summaryRowIndex == 2) {
                result = grid1.calcSummaryValue('MathScore', 'avg');
            }
            return result;
        }






        function majorRowGroupSummaryRenderer(summaryRowIndex) {
            if (summaryRowIndex == 0) {
                return "最小值：";
            } else if (summaryRowIndex == 1) {
                return "最大值：";
            } else if (summaryRowIndex == 2) {
                return "平均值：";
            }
        }

        function chineseScoreRowGroupSummaryRenderer(summaryRowIndex, cellValue, params) {
            var grid1 = this, result;

            if (summaryRowIndex == 0) {
                result = grid1.calcSummaryValue('ChineseScore', 'min', params.rowGroupData);
            } else if (summaryRowIndex == 1) {
                result = grid1.calcSummaryValue('ChineseScore', 'max', params.rowGroupData);
            } else if (summaryRowIndex == 2) {
                result = grid1.calcSummaryValue('ChineseScore', 'avg', params.rowGroupData);
            }
            return result;
        }

        function mathScoreRowGroupSummaryRenderer(summaryRowIndex, cellValue, params) {
            var grid1 = this, result;

            if (summaryRowIndex == 0) {
                result = grid1.calcSummaryValue('MathScore', 'min', params.rowGroupData);
            } else if (summaryRowIndex == 1) {
                result = grid1.calcSummaryValue('MathScore', 'max', params.rowGroupData);
            } else if (summaryRowIndex == 2) {
                result = grid1.calcSummaryValue('MathScore', 'avg', params.rowGroupData);
            }
            return result;
        }

    </script>
</body>
</html>
