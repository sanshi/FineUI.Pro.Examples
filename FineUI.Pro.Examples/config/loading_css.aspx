<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loading_css.aspx.cs" Inherits="FineUI.Pro.Examples.config.loading_css" %>

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
    </form>
</body>
</html>
