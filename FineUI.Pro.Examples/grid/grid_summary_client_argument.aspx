<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_summary_client_argument.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_summary_client_argument" %>

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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" Height="450px"
            PageSize="14" ShowBorder="true"
            ShowHeader="true" AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true"
            OnPageIndexChanged="Grid1_PageIndexChanged"
            EnableSummary="true" SummaryPosition="Bottom">
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
                    ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业" SummaryText="平均值：">
                </f:RenderField>
                <f:RenderField DataField="Fee" FieldType="Float" ColumnID="Fee" HeaderText="学费" SummaryType="Avg" SummaryTypeArgument="N2" />
                <f:RenderField DataField="GPA" FieldType="Float" ColumnID="GPA" HeaderText="GPA" SummaryType="Avg" SummaryTypeArgument="F3" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="../res/js/grid.js"></script>
</body>
</html>
