<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="toolbar_iframe.aspx.cs"
    Inherits="FineUI.Pro.Examples.toolbar.toolbar_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel runat="server" ID="Panel1" IsFluid="true" Title="面板" Height="500px"
            EnableIFrame="true" IFrameName="main" EnableCollapse="false">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:Button runat="server" ID="Button1" Text="打开页面一"
                            ClickHandler="onOpenPage1Click">
                        </f:Button>
                        <f:Button runat="server" ID="Button2" Text="打开页面二"
                            ClickHandler="onOpenPage2Click">
                        </f:Button>
                        <f:Button runat="server" ID="Button3" Text="打开页面三（服务器端）" OnClick="Button3_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
    </form>
    <script>
        var panel1ClientID = '<%= Panel1.ClientID %>';

        function updateIFrameUrl(url) {
            F(panel1ClientID).setIFrameUrl(url);
        }

        // updateIFrameUrl 和 updateIFrameUrl2 效果一样
        function updateIFrameUrl2(url) {
            window.open(url, 'main');
        }

        function onOpenPage1Click(event) {
            updateIFrameUrl2('../basic/hello.aspx');
        }

        function onOpenPage2Click(event) {
            updateIFrameUrl2('../basic/hello_aspnet.aspx');
        }

    </script>
</body>
</html>
