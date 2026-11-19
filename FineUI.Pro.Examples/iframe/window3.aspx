<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window3.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.window3" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/window3_iframe.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <br />
        <f:Button ID="Button1" Text="弹出窗体" runat="server" ClickHandler="onOpenWindow1Click">
        </f:Button>
        <f:Window ID="Window1" Hidden="true" EnableIFrame="true" runat="server" EnableMaximize="true" EnableResize="true" Height="500px" Width="800px"
            Title="窗体一（数字输入框会自动获取焦点）">
        </f:Window>
        <br />
        <f:Label ID="labResult" CssStyle="font-weight:bold;" runat="server">
        </f:Label>
    </form>
    <script>
        var Window1ClientID = '<%= Window1.ClientID %>';

        function onOpenWindow1Click(event) {
            F(Window1ClientID).show('<%= ResolveUrl("~/iframe/window3_iframe.aspx") %>');
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示 <code>iframe</code> 窗体打开后，子页数字输入框自动取得输入焦点。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>打开后直接输入</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="弹出窗体">弹出窗体</strong>。<br />结果：子页加载后数字输入框取得焦点，可以直接使用键盘输入，无需先点击字段。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableIFrame</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>'
                        title="窗体一（数字输入框会自动获取焦点）">窗体一（数字输入框会自动获取焦点）</strong>）：初始为<code>true</code>，窗体加载独立的数字输入页。</li>
            </ul>
        </section>
    </template>
</body>
</html>
