<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="parent_postback_top.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.parent_postback_top" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/parent_postback_top2.aspx;~/iframe/parent_postback_top3.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        页面一：parent_postback_top.aspx
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
        <br />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="false"
            Height="500px" EnableIFrame="true" IFrameUrl="parent_postback_top2.aspx"
            ShowHeader="true" Title="面板一">
        </f:Panel>
    </form>
</body>
</html>
