<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_icon.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_icon" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="btnIcon1" Text="图标在左侧" Icon="Email" runat="server" CssClass="marginr" />
        <f:Button ID="btnIcon2" Text="图标在右侧" IconAlign="Right" Icon="Star" runat="server" />
        <br />
        <br />
        <f:Button ID="btnIcon3" Text="图标在上面" IconAlign="Top" Icon="Email" runat="server"
            CssClass="marginr" />
        <f:Button ID="btnIcon4" Text="图标在下面" IconAlign="Bottom" Icon="Star" runat="server" />
        <br />
        <br />
        <f:Button ID="btnCustomIcon" Text="自定义图标（点击修改图标）" OnClick="btnCustomIcon_Click"
            IconUrl="~/res/images/16/1.png" runat="server" />
        <br />
        <br />
        只有图片的按钮：
            <br />
        <br />
        <f:Button ID="Button1" IconUrl="~/res/images/16/1.png" CssClass="marginr" runat="server" />
        <f:Button ID="Button2" IconUrl="~/res/images/16/8.png" runat="server" />
        <br />
        <br />
        大按钮：
            <br />
        <br />
        <f:Button ID="Button3" Size="Large" Text="图标在左侧" Icon="Email" runat="server" CssClass="marginr" />
        <f:Button ID="Button4" Size="Large" Text="图标在右侧" IconAlign="Right" Icon="Star" runat="server" />
        <br />
        <br />
        <f:Button ID="Button5" Size="Large" Text="图标在上面" IconAlign="Top" Icon="Email" runat="server"
            CssClass="marginr" />
        <f:Button ID="Button6" Size="Large" Text="图标在下面" IconAlign="Bottom" Icon="Email" runat="server" />
        <br />
        <br />
    </form>
</body>
</html>
