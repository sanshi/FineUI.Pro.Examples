<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="FineUI.Pro.Examples.mobile._default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="fineui-example-frame" content="#myiframe" />
    <title></title>
    <style>
        .phonebg {
            position: absolute;
            top: 30px;
            left: 30px;
        }

        .myiframe {
            border-width: 10px;
            border-style: solid;
            border-radius: 10px;
            width: 320px;
            height: 568px;
            box-shadow: 0px 0px 8px #ccc;
            margin-bottom: 20px;
        }

        body.f-theme-darkbg .myiframe {
            box-shadow: 0px 0px 8px #333;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />

        <div class="phonebg">
            <asp:Literal ID="litIFrame" runat="server"></asp:Literal>
        </div>

    </form>
</body>
</html>
