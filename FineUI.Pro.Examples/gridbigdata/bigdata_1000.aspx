<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bigdata_1000.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridbigdata.bigdata_1000" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（1000行）" EnableCollapse="false" Height="500px" EnableCheckBoxSelect="true"
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
        注：
        <ul>
            <li>启用大数据表格需满足如下条件：
                <ul>
                    <li>每行的行高相同（FixedRowHeight=true）。</li>
                    <li>表格高度固定或者位于布局中。</li>
                </ul>
            </li>
            <li>大数据表格一般仅用于数据展示。
                <ul>
                    <li>不支持树表格、行分组。</li>
                    <li>不支持复杂的特性（比如单元格编辑、列锁定、单元格合并...）。</li>
                    <li>不支持模板列中放置输入字段（比如文本输入框、下拉列表、复选框列表...）。</li>
                </ul>
            </li>
        </ul>
        <br />
        <br />
    </form>
    <script src="../res/js/grid.js"></script>
</body>
</html>
