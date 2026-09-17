<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_iframe_reloadfirst.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_iframe_reloadfirst" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/tabstrip/emptypage.aspx" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="500px" ShowBorder="true" ActiveTabIndex="1"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab1" EnableIFrame="true" BodyPadding="10px" IFrameUrl="../tabstrip/emptypage.aspx"
                    Title="标签一（每次切换到此选项卡都重新加载IFrame）" runat="server">
                </f:Tab>
                <f:Tab ID="Tab2" EnableIFrame="true" BodyPadding="10px" IFrameUrl="../tabstrip/emptypage.aspx"
                    Title="标签二" runat="server">
                </f:Tab>
                <f:Tab ID="Tab3" EnableIFrame="true" BodyPadding="10px" IFrameUrl="../tabstrip/emptypage.aspx"
                    Title="标签三" runat="server">
                </f:Tab>
            </Tabs>
            <Listeners>
                <f:Listener Event="tabchange" Handler="onTabChange" />
            </Listeners>
        </f:TabStrip>
        <br />
        <br />
        注：只有第一个选项卡在每次激活时都重新加载其中的IFrame。
    </form>
    <script>

        var tab1ClientID = '<%= Tab1.ClientID %>';

        function onTabChange(event, tab) {
            // 如果激活的是第一个选项卡，则重新加载其中的IFrame
            if (tab.id === tab1ClientID) {
                tab.refreshIFrame();
            }
        }


    </script>
</body>
</html>
