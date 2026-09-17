<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_iconfont.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_iconfont" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="btnIcon1" Text="图标在左侧" IconFont="_Home" runat="server" CssClass="marginr" />
        <f:Button ID="btnIcon2" Text="图标在右侧" IconAlign="Right" IconFont="_Car" runat="server" />
        <br />
        <br />
        <f:Button ID="btnIcon3" Text="图标在上面" IconAlign="Top" IconFont="_Camera" runat="server"
            CssClass="marginr" />
        <f:Button ID="btnIcon4" Text="图标在下面" IconAlign="Bottom" IconFont="_Phone" runat="server" />
        <br />
        <br />
        <f:Button ID="btnCustomIcon" Text="点击修改图标（在三个图标之前切换）" OnClick="btnCustomIcon_Click"
            IconFont="_VolumeUp" runat="server" />
        <br />
        <br />
        只有图片的按钮：
        <br />
        <br />
        <f:Button ID="Button1" Size="Small" IconFont="_Android" CssClass="marginr" runat="server" />
        <f:Button ID="Button2" Size="Normal" IconFont="_Apple" CssClass="marginr" runat="server" />
        <f:Button ID="Button7" Size="Medium" IconFont="_Car" CssClass="marginr" runat="server" />
        <f:Button ID="Button8" Size="Large" IconFont="_Card" CssClass="marginr" runat="server" />
        <br />
        <br />
        大按钮：
        <br />
        <br />
        <f:Button ID="Button3" Size="Large" Text="图标在左侧" IconFont="_Home" runat="server" CssClass="marginr" />
        <f:Button ID="Button4" Size="Large" Text="图标在右侧" IconAlign="Right" IconFont="_Car" runat="server" />
        <br />
        <br />
        <f:Button ID="Button5" Size="Large" Text="图标在上面" IconAlign="Top" IconFont="_Camera" runat="server"
            CssClass="marginr" />
        <f:Button ID="Button6" Size="Large" Text="图标在下面" IconAlign="Bottom" IconFont="_Phone" runat="server" />
        <br />
        <br />
    </form>
</body>
</html>
