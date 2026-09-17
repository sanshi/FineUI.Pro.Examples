<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_iframe_addtab.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_iframe_addtab" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="500px" ShowBorder="true" ActiveTabIndex="0"
            runat="server">
            <Tabs>
                <f:Tab Title="FineUI官网" EnableIFrame="true" IFrameUrl="https://fineui.com/" runat="server">
                </f:Tab>
            </Tabs>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="Button1" runat="server" Text="打开DeepSeek官网（tab1_iframe）" OnClick="Button1_Click"></f:Button>
                        <f:Button ID="Button2" runat="server" Text="打开ASP.NET官网（tab1_iframe）" OnClick="Button2_Click"></f:Button>
                        <f:Button ID="Button3" runat="server" Text="打开FineUI官网（tab2_iframe）" OnClick="Button3_Click"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:TabStrip>
        <br />
        <br />
        注：由于设置了相同的tabID，FineUI.Pro示例和FineUI示例在同一个选项卡中打开。
    </form>
</body>
</html>
