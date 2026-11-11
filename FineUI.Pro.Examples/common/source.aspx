<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="source.aspx.cs" Inherits="FineUI.Pro.Examples.source" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>页面描述和源代码</title>
    <style type="text/css">
        iframe {
            padding: 0px;
            margin: 0px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="TabStrip1" runat="server"></f:PageManager>
        <f:TabStrip ID="TabStrip1" CssClass="centerregion" EnableTabWheelScroll="true" ShowBorder="false" TabPosition="Top" runat="server" ShowInkBar="true"
            InkBarPosition="Bottom" EnableDefaultCorner="false">
        </f:TabStrip>
    </form>
</body>
</html>
