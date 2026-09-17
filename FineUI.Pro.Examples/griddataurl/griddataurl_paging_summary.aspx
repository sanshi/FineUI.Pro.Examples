<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_paging_summary.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_paging_summary" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/griddataurl/griddataurl_paging_summary.ashx" />
    <style>
        .f-grid-row-summary .f-grid-cell-text {
            font-weight: bold;
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" Height="350px" EnableCheckBoxSelect="true"
            runat="server" DataIDField="Id" DataUrl="~/griddataurl/griddataurl_paging_summary.ashx"
            AllowPaging="true" IsDatabasePaging="false" PageSize="5"
            EnableSummary="true" SummaryPosition="Bottom">
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
                <f:RenderField ColumnID="Fee" DataField="Fee" HeaderText="学费">
                </f:RenderField>
                <f:RenderField ColumnID="ExtraFee" DataField="ExtraFee" HeaderText="学杂费">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <br />

    </form>
    <script src="../res/js/grid.js"></script>
</body>
</html>
