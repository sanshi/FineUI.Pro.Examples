<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageloading.aspx.cs" Inherits="FineUI.Pro.Examples.other.pageloading" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" EnablePageLoading="true" LoadingCSSNumber="3" runat="server" />
        <p>打开页面时显示第 3 种 CSS 加载动画。可将 LoadingCSSNumber 设为 1～6 选择其他样式。</p>
    </form>
</body>
</html>
