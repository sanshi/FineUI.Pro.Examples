<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridrowgroup_database_sorting_summary_currentpage.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridrowgroup.gridrowgroup_database_sorting_summary_currentpage" %>

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
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Height="500px" Title="表格" runat="server" EnableCollapse="false" PageSize="10" ShowBorder="true" ShowHeader="true" EnableCheckBoxSelect="false"
            AllowPaging="true" IsDatabasePaging="true" OnPageIndexChanged="Grid1_PageIndexChanged"
            AllowSorting="true" SortField="Name" SortDirection="ASC" OnSort="Grid1_Sort"
            EnableRowGroup="true" DataRowGroupField="EntranceYear" RowGroupSummary="true"
            EnableSummary="true" SummaryPosition="Bottom">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" SortField="Name" DataFormatString="{0}"
                    HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" SortField="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor"
                    ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业" RowGroupSummaryText="平均（分组）：" SummaryText="平均（汇总）：">
                </f:RenderField>
                <f:RenderField DataField="ChineseScore" FieldType="Int" ColumnID="ChineseScore" HeaderText="语文成绩" RowGroupSummaryType="Avg" SummaryType="Avg" />
                <f:RenderField DataField="MathScore" FieldType="Int" ColumnID="MathScore" HeaderText="数学成绩" RowGroupSummaryType="Avg" SummaryType="Avg" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="../res/js/grid.js"></script>
</body>
</html>
