<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window3.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.window3" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/window3_iframe.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <br />
        <f:Button ID="Button1" Text="弹出窗体" runat="server" ClickHandler="onOpenWindow1Click">
        </f:Button>
        <f:Window ID="Window1" Hidden="true" EnableIFrame="true" runat="server"
            EnableMaximize="true" EnableResize="true" Height="500px" Width="800px" Title="窗体一（数字输入框会自动获取焦点）">
        </f:Window>
        <br />
        <f:Label ID="labResult" CssStyle="font-weight:bold;" runat="server">
        </f:Label>
    </form>
    <script>

        var Window1ClientID = '<%= Window1.ClientID %>';

        function onOpenWindow1Click(event) {
            F(Window1ClientID).show('<%= ResolveUrl("~/iframe/window3_iframe.aspx") %>');
        }

    </script>
</body>
</html>
