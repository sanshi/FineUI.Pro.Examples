<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bigdata_5000.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridbigdata.bigdata_5000" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（5000行）" EnableCollapse="false" Height="500px" EnableCheckBoxSelect="true"
            runat="server" DataIDField="Id" 
            EnableBigData="true" FixedRowHeight="true" EnableBigDataRowTip="true" PagingToolbarVisible="false">
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
        
    </form>
    <script src="../res/js/grid.js"></script>
</body>
</html>
