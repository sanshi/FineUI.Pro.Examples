<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_custom.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_custom" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">
        <style type="text/css">
            .bgbtn {
                background-image: url('<%= PageContext.ResolveUrl("~/res/images/login.png") %>') !important;
                width: 320px;
                height: 50px;
                border-width: 0 !important;
                background-color: transparent !important;
            }

        </style>
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="Button1" Text="普通按钮" runat="server" Size="Large" OnClick="Button1_Click" />
        <br />
        <br />

        <f:Button ID="Button2" Text="" CssClass="bgbtn" runat="server" OnClick="Button2_Click" />

    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示用自定义 CSS 和背景图片改变按钮外观，同时保留点击处理。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>点击两种外观的按钮</h3>
            <ul>
                <li>
                    点击“普通按钮”。<br />
                    结果：回发后，后台显示“点击了普通按钮”。
                </li>
                <li>
                    关闭提示后点击旁边的图片按钮。<br />
                    结果：回发后，后台显示“点击了自定义按钮”，说明自定义外观仍使用按钮事件。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CssClass</code>：bgbtn 样式类提供自定义按钮背景和尺寸。</li>
            </ul>
        </section>
    </template>
</body>
</html>
