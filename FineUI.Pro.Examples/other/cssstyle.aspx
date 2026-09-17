<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cssstyle.aspx.cs" Inherits="FineUI.Pro.Examples.other.cssstyle" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        .red {
            font-weight: bold;
            color: Red;
        }

        .green {
            font-weight: bold;
            font-style: italic;
            font-size: 1.5em;
            color: Green;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />

        <br />
        <f:Label ID="Label1" runat="server" Text="文本一，注意观察文本的样式">
        </f:Label>
        <br />
        <f:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="通过 CssStyle 修改文本的样式">
        </f:Button>
        <f:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="清空 CssStyle 设置的样式">
        </f:Button>

        <br />
        <br />
        <br />
        <br />
        <f:Label ID="Label2" runat="server" Text="文本二，注意观察文本的样式">
        </f:Label>
        <br />
        <f:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="通过 CssClass 修改文本的样式">
        </f:Button>
        <f:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="清空 CssClass 设置的样式">
        </f:Button>
        <br />
        <br />
    </form>
</body>
</html>
