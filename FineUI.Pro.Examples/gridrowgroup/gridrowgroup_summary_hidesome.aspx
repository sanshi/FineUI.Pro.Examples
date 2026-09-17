<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridrowgroup_summary_hidesome.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridrowgroup.gridrowgroup_summary_hidesome" %>

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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            DataIDField="Id" DataTextField="Name" EnableRowGroup="true" DataRowGroupField="EntranceYear" RowGroupSummary="true" RowRendererFunction="grid1RowRenderer">
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
                <f:RenderField DataField="ChineseScore" FieldType="Int" ColumnID="ChineseScore" HeaderText="语文成绩" RowGroupSummaryType="Avg" />
                <f:RenderField DataField="MathScore" FieldType="Int" ColumnID="MathScore" HeaderText="数学成绩" RowGroupSummaryType="Avg" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>

        <br />
        <br />
        注：如果分组中只有一行数据，则隐藏分组合计。
    </form>

    <script src="../res/js/grid.js"></script>

    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';

        // 计算分组中的行数（排除分组合计）
        function linesInRowGroup(rowGroup) {
            var lines = 0;
            $.each(F(Grid1ClientID).data, function (index, rowData) {
                if (rowData.isRowGroup && rowData.rowGroup === rowGroup) {
                    // 最后一行是分组合计
                    lines = rowData.children.length - 1;
                    return false; // break
                }
            });
            return lines;
        }

        // 在 RowRenderer 中改变行CSS类
        function grid1RowRenderer(params) {
            // 当前行是否分组合计
            var isRowGroupSummary = params.rowData.isRowGroupSummary;
            if (isRowGroupSummary) {
                var rowGroup = params.rowData.rowGroup;

                // 如果分组中只有一行数组，则隐藏分组合计
                if (linesInRowGroup(rowGroup) === 1) {
                    params.rowCls = 'f-hidden';
                }
            }
        }


    </script>
</body>
</html>
