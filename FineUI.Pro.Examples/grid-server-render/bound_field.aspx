<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bound_field.aspx.cs" Inherits="FineUI.Pro.Examples.grid_server_render.bound_field" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>绑定列：格式化与空值</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" DataIDField="Id" DataKeyNames="Id,Name" IsFluid="true" ShowHeader="true" Title="绑定列：格式化与空值"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField ColumnID="Number" />
                <f:BoundField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:BoundField ColumnID="LogTime" DataField="LogTime" HeaderText="日期格式化" DataFormatString="{0:yyyy-MM-dd}" />
                <f:BoundField ColumnID="Major" DataField="Major" HeaderText="空值提示" NullDisplayText="未填写" />
            </Columns>
        </f:Grid>
        <p>BoundField 在服务端格式化字段，并生成显示文本；新项目优先使用 RenderField 的字段类型和渲染函数。</p>
        <f:Label ID="labResult" runat="server" />
    </form>
</body>
</html>
