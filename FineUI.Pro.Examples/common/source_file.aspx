<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="source_file.aspx.cs" Inherits="FineUI.Pro.Examples.source_file" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <%--<link href="../res/google-code-prettify/prettify.css" rel="stylesheet" />--%>
    <link type="text/css" rel="stylesheet" id="linkPrettifyTheme" runat="server" />
    <style type="text/css">
        body.f-body {
            padding: 10px;
        }

        body {
            margin: 0;
            font-size: 13px;
        }

        pre.prettyprint {
            border: none;
            margin: 0;
            color: #666;
            font-family: Consolas, Courier New, monospace;
            -webkit-font-smoothing: subpixel-antialiased;
            /* 使用主题背景色 */
            background-color: transparent;
        }

        li.L0, li.L1, li.L2, li.L3, li.L4, li.L5, li.L6, li.L7, li.L8, li.L9 {
            /* 使用主题背景色 */
            background-color: transparent;
        }
    </style>
</head>
<body onload="prettyPrint();">
    <f:PageManager ID="PageManager1" runat="server"></f:PageManager>
    <form id="form1" runat="server">
        <asp:Literal runat="server" ID="desc"></asp:Literal>
    </form>
    <script src="../res/google-code-prettify/prettify.js"></script>
    <script src="../res/google-code-prettify/lang-basic.js"></script>
</body>
</html>
