<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window2.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.window2" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/window2_iframe.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <br />
        <f:Button ID="Button1" Text="弹出窗体" runat="server" ClickHandler="onOpenWindow1Click">
        </f:Button>
        <f:Window ID="Window1" Hidden="true" EnableIFrame="true" runat="server" Target="Top"
            EnableMaximize="true" EnableResize="true" Height="500px" Width="800px" Title="窗体一">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" Position="Bottom" ToolbarAlign="Right">
                    <Items>
                        <f:Button ID="btnClosePostBack" Text="保存" Icon="SystemSave"
                            runat="server" ClickHandler="onClosePostBackClick">
                        </f:Button>
                        <f:Button ID="btnClose" Text="关闭" Icon="SystemClose" runat="server" ClickHandler="onCloseClick">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>
        <br />
        <f:Label ID="labResult" CssStyle="font-weight:bold;" runat="server">
        </f:Label>
    </form>
    <script>

        var Window1ClientID = '<%= Window1.ClientID %>';

        function onOpenWindow1Click(event) {
            F(Window1ClientID).show('<%= ResolveUrl("~/iframe/window2_iframe.aspx") %>');
        }

        function onClosePostBackClick(event) {
            F(Window1ClientID).getIFrameWindow().saveWindow();
        }

        function onCloseClick(event) {
            F(Window1ClientID).hide();
        }

    </script>
</body>
</html>
