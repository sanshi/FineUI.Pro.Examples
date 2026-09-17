<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_fieldtype_float_double.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_fieldtype_float_double" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（显示错误）" EnableCollapse="false"
            runat="server">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField DataField="Name" HeaderText="标题"></f:RenderField>
                <f:RenderField Width="220px" ExpandUnusedSpace="true" MinWidth="150px" DataField="Desc" FieldType="Float" HeaderText="小数（FieldType=Float）">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Grid ID="Grid2" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（显示正确）" EnableCollapse="false" 
            runat="server" AllowCellEditing="true" ClicksToEdit="1">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField DataField="Name" HeaderText="标题"></f:RenderField>
                <f:RenderField Width="220px" ExpandUnusedSpace="true" MinWidth="150px" DataField="Desc" FieldType="Double" HeaderText="小数（FieldType=Double）">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <br />
        注：
        <ul>
            <li>第一个表格显示数据错误：后台数据：101217.760000，但是前台显示：101217.758。</li>
            <li>需要将FieldType="Float"改为FieldType="Double"，这个因为两者的精度不同：Double精度为15~16，Float的精度为6~7。</li>
        </ul>
        
    </form>
</body>
</html>
