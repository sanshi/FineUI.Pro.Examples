<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_summary_multiline_client.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_summary_multiline_client" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-row-summary .f-grid-cell-Major .f-grid-cell-text {
            text-align: right;
        }

        .f-grid-row-summary .f-grid-cell-text {
            font-weight: bold;
        }

        .f-grid-row-summary:first-child .f-grid-cell-text,
        .f-grid-row-summary:nth-child(2) .f-grid-cell-text {
            font-weight: normal;
            font-style: italic;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" Height="450px"
            PageSize="15" ShowBorder="true"
            ShowHeader="true" AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true"
            OnPageIndexChanged="Grid1_PageIndexChanged"
            EnableSummary="true" SummaryPosition="Bottom" SummaryRowCount="3">
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
                    ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业" SummaryRendererFunction="majorSummaryRenderer">
                </f:RenderField>
                <f:RenderField DataField="Fee" FieldType="Int" ColumnID="Fee" HeaderText="学费" SummaryRendererFunction="feeSummaryRenderer" />
                <f:RenderField DataField="ExtraFee" FieldType="Int" ColumnID="ExtraFee" HeaderText="学杂费" SummaryRendererFunction="donateSummaryRenderer" />
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

        function feeSummaryRenderer(summaryRowIndex) {
            var grid1 = this;

            if (summaryRowIndex == 0) {
                return grid1.calcSummaryValue('Fee', 'min');
            } else if (summaryRowIndex == 1) {
                return grid1.calcSummaryValue('Fee', 'max');
            } else if (summaryRowIndex == 2) {
                return grid1.calcSummaryValue('Fee', 'avg', 'N2');
            }
        }

        function donateSummaryRenderer(summaryRowIndex) {
            var grid1 = this;

            if (summaryRowIndex == 0) {
                return grid1.calcSummaryValue('ExtraFee', 'min');
            } else if (summaryRowIndex == 1) {
                return grid1.calcSummaryValue('ExtraFee', 'max');
            } else if (summaryRowIndex == 2) {
                return grid1.calcSummaryValue('ExtraFee', 'avg', 'N2');
            }
        }

    </script>
</body>
</html>
