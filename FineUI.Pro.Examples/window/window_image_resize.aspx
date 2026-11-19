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
        <f:Window ID="Window2" Width="650px" Height="300px" Icon="TagBlue" Title="窗体（观察图片随着窗体大小的变化）" EnableClose="false" EnableMaximize="true"
            EnableCollapse="false" runat="server" EnableResize="true" IsModal="false" AutoScroll="true" BodyPadding="10px">
            <Content>
                <img id="mylogo" src="<%= PageContext.ResolveUrl("~/res/images/logo/fineui-500.png") %>" alt="Logo" />
            </Content>
            <Listeners>
                <f:Listener Event="resize" Handler="onWindowResize" />
                <f:Listener Event="render" Handler="onWindowResize" />
            </Listeners>
        </f:Window>
    </form>
    <script>
        // 保持图片的长宽比
        var LOGO_WIDTH = 500,
            LOGO_HEIGHT = 500;

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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>让窗体里的图片随窗体可用区域调整显示大小。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>对照本页窗体效果</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>'
                        title="窗体（观察图片随着窗体大小的变化）">窗体（观察图片随着窗体大小的变化）</strong>。拖动窗体边缘或切换最大化、还原。<br />结果：图片随内容区域调整大小，不要求用户重新加载图片。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableResize</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>'
                        title="窗体（观察图片随着窗体大小的变化）">窗体（观察图片随着窗体大小的变化）</strong>）：初始为 <code>true</code>，控制是否允许拖动窗体边缘调整大小。</li>
                <li><code>EnableMaximize</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>'
                        title="窗体（观察图片随着窗体大小的变化）">窗体（观察图片随着窗体大小的变化）</strong>）：初始为 <code>true</code>，控制标题栏是否显示最大化与还原入口。</li>
                <li><code>render / resize</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>'
                        title="窗体（观察图片随着窗体大小的变化）">窗体（观察图片随着窗体大小的变化）</strong>）：在首次显示和尺寸变化时，根据内容区宽高等比例缩放图片并居中。</li>
            </ul>
        </section>
    </template>
</body>
</html>
