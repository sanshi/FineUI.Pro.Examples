<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_window_details.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_window_details" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>客户详情</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <p>当前客户标识：<strong id="customerSlug"><%: Request.QueryString["slug"] ?? string.Empty %></strong></p>
        <p>本示例展示行命令传入的网址参数。实际业务中应查询客户记录并校验访问权限。</p>
    </form>
</body>
</html>
