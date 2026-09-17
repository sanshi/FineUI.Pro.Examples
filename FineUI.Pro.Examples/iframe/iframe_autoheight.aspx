<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="iframe_autoheight.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.iframe_autoheight" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/parent_postback2.aspx;~/iframe/parent_postback3.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="Button1" runat="server" CssClass="marginr" AttributeDataTag="../button/button.aspx" Text="按钮页面" ClickHandler="onButtonClick"></f:Button>
        <f:Button ID="Button2" runat="server" CssClass="marginr" AttributeDataTag="../button/button_buttongroup.aspx" Text="分组按钮页面" ClickHandler="onButtonClick"></f:Button>
        <f:Button ID="Button6" runat="server" CssClass="marginr" AttributeDataTag="../button/button_buttongroup_vertical.aspx" Text="垂直分组按钮页面" ClickHandler="onButtonClick"></f:Button>
        <br />
        <br />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" ShowBorder="true"
            EnableIFrame="true" IFrameUrl="~/button/button.aspx"
            ShowHeader="true" Title="面板一（面板高度随IFrame的高度自适应）">
            <Listeners>
                <f:Listener Event="iframeload" Handler="onIFrameLoad" />
            </Listeners>
        </f:Panel>
        <br />
        <br />
        注：本示例不适合加载外部页面！
        <br />
        由于存在<a href="https://en.wikipedia.org/wiki/Same_origin_policy">跨域限制（Same-origin policy）</a>，在IFrame中加载外部页面时，无法访问到IFrame页面的document属性！
    </form>
    <script>

        var panel1ClientID = '<%= Panel1.ClientID %>';

        function onButtonClick(event) {
            var me = this;

            var panel1 = F(panel1ClientID);

            // 重置面板一的高度
            panel1.setHeight('auto');

            // 设置面板一的IFrameUrl
            panel1.setIFrameUrl(me.getAttr('data-tag'));
        }


        function onIFrameLoad(event) {
            var me = this;

            // 面板一的标题栏高度
            var panelHeaderHeight = me.el.outerHeight() - me.bodyEl.outerHeight();

            // IFrame页面的实际高度
            var iframeDoc = $(me.getIFrameWindow().document);
            var iframePageHeight = iframeDoc.height();

            // 如果页面控件高度自适应（IsViewPort=true）
            if (iframeDoc.find('body.f-viewport').length) {
                var panelBodyEl = iframeDoc.find('.f-panel-viewport .f-panel-body');
                iframePageHeight += panelBodyEl[0].scrollHeight - panelBodyEl.outerHeight();
            }

            var newHeight = iframePageHeight + panelHeaderHeight + 5;

            // 设置面板一的新高度
            me.setHeight(newHeight);
        }

    </script>
</body>
</html>
