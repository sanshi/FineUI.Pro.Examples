<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageloading.aspx.cs" Inherits="FineUI.Pro.Examples.other.pageloading" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" LoadingCSSNumber="-1" PageLoadingImageUrl="~/res/images/loading/loading_bar.gif" runat="server" />
        <br />
        GIF制作工具：http://ajaxload.info/  http://loadinfo.net/
        <br />
        <br />
        注：制作 GIF 图片时需要指定前台色和背景色，必须保证背景色和页面的背景色一致。
        <br />
        <br />
    </form>
</body>
</html>
