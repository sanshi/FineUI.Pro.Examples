<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="source_file.aspx.cs" Inherits="FineUI.Pro.Examples.source_file" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <%-- head 还会追加公共资源，这里使用静态相对地址，避免内嵌代码块使追加失败。 --%>
    <script src="../res/js/source-code-filter.js"></script>
    <%--<link href="<%= PageContext.ResolveUrl("~/res/google-code-prettify/prettify.css") %>" rel="stylesheet" />--%>
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

        li.L0,
        li.L1,
        li.L2,
        li.L3,
        li.L4,
        li.L5,
        li.L6,
        li.L7,
        li.L8,
        li.L9 {
            /* 使用主题背景色 */
            background-color: transparent;
        }

    </style>
</head>
<body>
    <f:PageManager ID="PageManager1" runat="server"></f:PageManager>
    <form id="form1" runat="server">
        <asp:Literal runat="server" ID="desc"></asp:Literal>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/google-code-prettify/prettify.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/google-code-prettify/lang-basic.js") %>"></script>
    <script nonce="<%= PageManager.Instance.CspScriptsNonceValue %>">
        F.ready(function () {
            FineUISourceCodeFilter.filterDocument();
            prettyPrint();
        });
    </script>
</body>
</html>
