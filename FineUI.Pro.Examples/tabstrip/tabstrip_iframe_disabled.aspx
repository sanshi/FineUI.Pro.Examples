<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_iframe_disabled.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_iframe_disabled" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/tabstrip/tabstrip_iframe_disabled_tab1.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="500px" ShowBorder="true" ActiveTabIndex="0"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab1" Title="标签一" runat="server" EnableIFrame="true" IFrameUrl="./tabstrip_iframe_disabled_tab1.aspx">
                </f:Tab>
                <f:Tab ID="Tab2" EnableIFrame="true" BodyPadding="10px" Enabled="false" IFrameUrl="../panel/panel_group.aspx"
                    Title="标签二" runat="server">
                </f:Tab>
                <f:Tab ID="Tab3" EnableIFrame="true" BodyPadding="10px" Enabled="false" IFrameUrl="../panel/panel.aspx"
                    Title="标签三" runat="server">
                </f:Tab>
            </Tabs>
        </f:TabStrip>
    </form>
</body>
</html>
