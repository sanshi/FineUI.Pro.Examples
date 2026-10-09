<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hyperlink_field.aspx.cs" Inherits="FineUI.Pro.Examples.grid_server_render.hyperlink_field" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>超链接列：绑定与参数编码</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" DataIDField="Id" DataKeyNames="Id,Name" IsFluid="true" ShowHeader="true" Title="超链接列：绑定与参数编码"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField ColumnID="Number" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataTextField="Major" DataToolTipField="Major" DataNavigateUrlFields="Major"
                    DataNavigateUrlFormatString="https://gsa.ustc.edu.cn/search?q={0}" UrlEncode="true" Target="_blank" Width="300px" />
            </Columns>
        </f:Grid>
        <p>HyperLinkField 在服务端生成链接，UrlEncode 将专业名称编码为地址参数；新项目优先使用 RenderField 的渲染函数。</p>
        <f:Label ID="labResult" runat="server" />
    </form>
</body>
</html>
