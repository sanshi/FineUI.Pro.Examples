<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loading.aspx.cs" Inherits="FineUI.Pro.Examples.config.loading" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        ul.loading {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

            ul.loading li {
                display: inline-block;
                margin: 0 10px 10px 0;
                text-align: center;
                border-style: solid;
                border-width: 1px;
                width: 150px;
                padding: 10px;
            }

                ul.loading li .title {
                    margin-top: 15px;
                    font-size: 1.2em;
                }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server"></f:PageManager>
        <br />
        <asp:Literal EnableViewState="false" runat="server" ID="litIcons"></asp:Literal>
        <br />
        <br />
        <p>这些 GIF 供维护旧页面时查阅。新页面使用 <code>LoadingCSSNumber</code> 选择 1～6 号 CSS 加载动画。</p>
    </form>
</body>
</html>
