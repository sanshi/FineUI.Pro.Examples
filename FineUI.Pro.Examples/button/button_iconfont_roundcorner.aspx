<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_iconfont_roundcorner.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_iconfont_roundcorner" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="btnIcon1" EnableRoundCorner="true" Text="图标在左侧" IconFont="_Home" runat="server" CssClass="marginr" />
        <f:Button ID="btnIcon2" EnableRoundCorner="true" Text="图标在右侧" IconAlign="Right" IconFont="_Car" runat="server" />
        <br />
        <br />
        <f:Button ID="btnIcon3" EnableRoundCorner="true" Text="图标在上面" IconAlign="Top" IconFont="_Camera" runat="server"
            CssClass="marginr" />
        <f:Button ID="btnIcon4" EnableRoundCorner="true" Text="图标在下面" IconAlign="Bottom" IconFont="_Phone" runat="server" />
        <br />
        <br />
        <f:Button ID="btnCustomIcon" EnableRoundCorner="true" Text="点击修改图标（在三个图标之前切换）" OnClick="btnCustomIcon_Click"
            IconFont="_VolumeUp" runat="server" />
        <br />
        <br />
        只有图片的按钮：
        <br />
        <br />
        <f:Button ID="Button1" Size="Small" EnableRoundCorner="true" IconFont="_Android" CssClass="marginr" runat="server" />
        <f:Button ID="Button2" Size="Normal" EnableRoundCorner="true" IconFont="_Apple" CssClass="marginr" runat="server" />
        <f:Button ID="Button7" Size="Medium" EnableRoundCorner="true" IconFont="_Car" CssClass="marginr" runat="server" />
        <f:Button ID="Button8" Size="Large" EnableRoundCorner="true" IconFont="_Card" CssClass="marginr" runat="server" />
        <br />
        <br />

    </form>
</body>
</html>
