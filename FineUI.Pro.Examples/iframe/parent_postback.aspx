<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="parent_postback.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.parent_postback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/parent_postback2.aspx;~/iframe/parent_postback3.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        页面一：parent_postback.aspx
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
        <br />
        <f:Button ID="Button1" CssClass="marginr" runat="server" Text="页面一中的按钮">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="刷新面板一中的IFrame" ClickHandler="onRefreshIFrameClick">
        </f:Button>
        <br />
        <br />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="false"
            Height="500px" EnableIFrame="true" IFrameUrl="parent_postback2.aspx"
            ShowHeader="true" Title="面板一">
        </f:Panel>
    </form>
    <script>

        var Panel1ClientID = '<%= Panel1.ClientID %>';

        function onRefreshIFrameClick(event) {
            F(Panel1ClientID).refreshIFrame();
        }

    </script>
</body>
</html>
