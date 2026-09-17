<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_badge_custom.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_badge_custom" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .marginr {
            margin-right: 20px;
        }

        .mybadge:after {
            position: absolute;
            z-index: 1;
            right: -4px;
            top: -4px;
            content: '';
            width: 8px;
            height: 8px;
            border-radius: 4px;
            background-color: #999;
        }

        .mybadge-text:after {
            position: absolute;
            z-index: 1;
            right: 0;
            top: -10px;
            content: '';
            width: auto;
            height: 20px;
            min-width: 20px;
            line-height: 20px;
            font-size: 12px;
            background-color: #999;
            color: #fff;
            border-radius: 10px;
            padding: 0 5px;
            -webkit-transform: translateX(50%);
            -webkit-transform-origin: 100%;
            transform: translateX(50%);
            transform-origin: 100%;
        }

        .mybadge-type-warning:after {
            background-color: #faad14;
        }

        .mybadge-type-success:after {
            background-color: #52c41a;
        }

        .mybadge-type-error:after {
            background-color: #f5222d;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="btnIcon1" Text="图标在左侧" Icon="Email" runat="server"
            CssClass="marginr mybadge" />
        <f:Button ID="btnIcon2" Text="图标在右侧" IconAlign="Right" Icon="Star" runat="server"
            CssClass="marginr mybadge mybadge-type-error" />
        <br />
        <br />
        <f:Button ID="btnIcon3" Text="图标在上面" IconAlign="Top" Icon="Email" runat="server"
            CssClass="marginr mybadge mybadge-type-warning" />
        <f:Button ID="btnIcon4" Text="图标在下面" IconAlign="Bottom" Icon="Star" runat="server"
            CssClass="marginr mybadge mybadge-type-success" />
        <br />
        <br />
        <f:Button ID="btnCustomIcon" Text="自定义图标（点击修改图标）" OnClick="btnCustomIcon_Click"
            IconUrl="~/res/images/16/1.png" runat="server"
            CssClass="marginr mybadge" />
        <br />
        <br />
        只有图片的按钮：
        <br />
        <br />
        <f:Button ID="Button1" IconUrl="~/res/images/16/1.png" runat="server"
            CssClass="marginr mybadge-text" AttributeDataTag="3" />
        <f:Button ID="Button2" IconUrl="~/res/images/16/8.png" runat="server"
            CssClass="marginr mybadge-text mybadge-type-success" AttributeDataTag="10" />
        <br />
        <br />
        大按钮：
            <br />
        <br />
        <f:Button ID="Button3" Size="Large" Text="图标在左侧" Icon="Email" runat="server"
            CssClass="marginr mybadge-text" AttributeDataTag="new" />
        <f:Button ID="Button4" Size="Large" Text="图标在右侧" IconAlign="Right" Icon="Star" runat="server"
            CssClass="marginr mybadge-text mybadge-type-error" AttributeDataTag="hot" />
        <br />
        <br />
        <f:Button ID="Button5" Size="Large" Text="图标在上面" IconAlign="Top" Icon="Email" runat="server"
            CssClass="marginr mybadge-text mybadge-type-warning" AttributeDataTag="88+" />
        <f:Button ID="Button6" Size="Large" Text="图标在下面" IconAlign="Bottom" Icon="Email" runat="server"
            CssClass="marginr mybadge-text mybadge-type-success" AttributeDataTag="999+" />
        <br />
        <br />
    </form>
    <script>

        F.ready(function () {

            $('.mybadge-text').each(function () {
                var el = $(this);
                if (el.hasClass('mybadge-text')) {
                    var badgeText = el.attr('data-tag');

                    // 动态添加CSS样式
                    var badgeClassName = 'mybadge-text-' + badgeText.replace(/\+/ig, '_');
                    el.addClass(badgeClassName);
                    F.addCSS(badgeClassName, '.' + badgeClassName + ':after{content:\'' + badgeText + '\';}');
                }
            });

        });

    </script>
</body>
</html>
