<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_image_resize.aspx.cs" Inherits="FineUI.Pro.Examples.window.window_image_resize" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        #mylogo {
            position: absolute;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window2" Width="650px" Height="300px" Icon="TagBlue" Title="窗体（观察图片随着窗体大小的变化）" EnableClose="false"
            EnableMaximize="true" EnableCollapse="false" runat="server" EnableResize="true"
            IsModal="false" AutoScroll="true" BodyPadding="10px">
            <Content>
                <img id="mylogo" src="../res/images/newlogo/fineui_500.png" alt="Logo" />
            </Content>
            <Listeners>
                <f:Listener Event="resize" Handler="onWindowResize" />
                <f:Listener Event="render" Handler="onWindowResize" />
            </Listeners>
        </f:Window>
    </form>
    <script>

        // 保持图片的长宽比
        var LOGO_WIDTH = 500, LOGO_HEIGHT = 500;

        // resize，render
        function onWindowResize(event) {
            var bodyWidth = this.bodyEl.width();
            var bodyHeight = this.bodyEl.height();

            var logoWidth = bodyWidth;
            var logoHeight = Math.floor(bodyWidth * LOGO_HEIGHT / LOGO_WIDTH);
            if (logoHeight > bodyHeight) {
                logoHeight = bodyHeight;
                logoWidth = Math.floor(bodyHeight * LOGO_WIDTH / LOGO_HEIGHT);
            }

            $('#mylogo').css({
                top: Math.floor((bodyHeight - logoHeight) / 2),
                left: Math.floor((bodyWidth - logoWidth) / 2),
                width: logoWidth,
                height: logoHeight
            });

        }

    </script>
</body>
</html>
