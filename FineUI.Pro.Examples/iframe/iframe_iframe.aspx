<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="iframe_iframe.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.iframe_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/iframe_iframe_window1.aspx;~/iframe/iframe_iframe_window2.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <br />
        <f:Button ID="Button1" Text="在本页面弹出窗体" runat="server" ClickHandler="onOpenWindow1Click">
        </f:Button>
        <f:Window ID="Window1" Hidden="true" EnableIFrame="true" runat="server"
            EnableMaximize="true" EnableResize="true" Height="500px" Width="900px" Title="窗体一">
        </f:Window>
        <br />
        <br />
        <f:Button ID="Button2" Text="在父页面弹出窗体" runat="server" ClickHandler="onOpenWindow2Click">
        </f:Button>
        <f:Window ID="Window2" Hidden="true" EnableIFrame="true" EnableMaximize="true"
            EnableResize="true" Target="Parent" runat="server" Height="500px" Width="900px"
            Title="窗体二">
        </f:Window>
        <br />
        <br />
        <f:Label ID="labResult" CssStyle="font-weight:bold;" runat="server">
        </f:Label>
        <br />
    </form>
    <script>

        var Window1ClientID = '<%= Window1.ClientID %>';
        var Window2ClientID = '<%= Window2.ClientID %>';

        function onOpenWindow1Click(event) {
            F(Window1ClientID).show('<%= ResolveUrl("~/iframe/iframe_iframe_window1.aspx") %>');
        }

        function onOpenWindow2Click(event) {
            F(Window2ClientID).show('<%= ResolveUrl("~/iframe/iframe_iframe_window1.aspx") %>');
        }

    </script>
</body>
</html>
