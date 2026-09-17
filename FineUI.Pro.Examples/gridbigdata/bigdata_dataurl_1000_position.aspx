<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bigdata_dataurl_1000_position.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridbigdata.bigdata_dataurl_1000_position" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/gridbigdata/data.ashx" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（网址数据源，1000行）" EnableCollapse="false" Height="500px" EnableCheckBoxSelect="true"
            runat="server" DataIDField="Id" DataUrl="~/gridbigdata/data.ashx?total=1000&type=simple"
            EnableBigData="true" FixedRowHeight="true" EnableBigDataRowTip="true" BigDataRowTipPosition="PagingToolbar" PagingToolbarVisible="true">
            <Columns>
                <f:RowNumberField Width="50px"></f:RowNumberField>
                <f:RenderField Width="150px" ColumnID="Name" DataField="Name" HeaderText="姓名">
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
        </f:Grid>
        <br />
        <br />
        注：行数提示显式在分页工具栏中（需启用EnableBigDataRowTip和PagingToolbarVisible，并设置BigDataRowTipPosition=PagingToolbar）。
        <br />
        <br />
    </form>

    <script src="../res/js/grid.js"></script>
</body>
</html>
