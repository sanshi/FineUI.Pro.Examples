<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_badge.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_badge" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .marginr {
            margin-right: 20px;
        }

        .custom-badge-color .f-badge {
            background-color: #2d8cf0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="btnIcon1" Text="图标在左侧" Icon="Email" runat="server"
            CssClass="marginr" Badge="true" BadgeType="Primary" />
        <f:Button ID="btnIcon2" Text="图标在右侧" IconAlign="Right" Icon="Star" runat="server"
            CssClass="marginr" Badge="true" BadgeType="Error" BadgeAnimationType="Processing" />
        <br />
        <br />
        <f:Button ID="btnIcon3" Text="图标在上面" IconAlign="Top" Icon="Email" runat="server"
            CssClass="marginr" Badge="true" BadgeType="Warning" />
        <f:Button ID="btnIcon4" Text="图标在下面" IconAlign="Bottom" Icon="Star" runat="server"
            CssClass="marginr" Badge="true" BadgeType="Success" BadgeAnimationType="Fade" />
        <br />
        <br />
        <f:Button ID="btnCustomIcon" Text="自定义图标（点击修改图标）" OnClick="btnCustomIcon_Click"
            IconUrl="~/res/images/16/1.png" runat="server"
            CssClass="marginr" Badge="true" />
        <br />
        <br />
        只有图片的按钮：
        <br />
        <br />
        <f:Button ID="Button1" IconUrl="~/res/images/16/1.png" runat="server"
            CssClass="marginr" Badge="true" BadgeText="3" />
        <f:Button ID="btnBadgeNumber" IconUrl="~/res/images/16/8.png" runat="server"
            CssClass="marginr" Badge="true" BadgeText="10" BadgeType="Success" />
        <br />
        <br />
        <f:Button ID="btnChangeBadge" Text="徽标数字加一" OnClick="btnChangeBadge_Click" runat="server" />
        <br />
        <br />
        大按钮：
            <br />
        <br />
        <f:Button ID="Button3" Size="Large" Text="图标在左侧" Icon="Email" runat="server"
            CssClass="marginr custom-badge-color" Badge="true" BadgeText="new" />
        <f:Button ID="Button4" Size="Large" Text="图标在右侧" IconAlign="Right" Icon="Star" runat="server"
            CssClass="marginr" Badge="true" BadgeText="hot" BadgeType="Error" BadgeAnimationType="Move" />
        <br />
        <br />
        <f:Button ID="Button5" Size="Large" Text="图标在上面" IconAlign="Top" Icon="Email" runat="server"
            CssClass="marginr" Badge="true" BadgeText="88+" BadgeType="Warning" BadgeAnimationType="Processing" />
        <f:Button ID="Button6" Size="Large" Text="图标在下面" IconAlign="Bottom" Icon="Email" runat="server"
            CssClass="marginr" Badge="true" BadgeText="999+" BadgeType="Success" BadgeAnimationType="Shake" />
        <br />
        <br />
    </form>
</body>
</html>
