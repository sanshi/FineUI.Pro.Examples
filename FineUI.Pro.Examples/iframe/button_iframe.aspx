<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_iframe.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.button_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_iframe_window.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="Button1" runat="server" Text="在本页面弹出IFrame窗体" ClickHandler="onOpenWindow1Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button2" runat="server" Text="在父页面弹出IFrame窗体" ClickHandler="onOpenWindow2Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" CssStyle="font-weight:bold;" runat="server">
        </f:Label>
		<br>
		<br>

		
        <f:Window ID="Window1" IconUrl="~/res/images/16/10.png" runat="server" Hidden="true"
            WindowPosition="Center" IsModal="true" Title="窗体一" EnableMaximize="true"
            EnableResize="true" Target="Self" EnableIFrame="true"
            Height="550px" Width="850px" OnClose="Window1_Close">
        </f:Window>
        <f:Window ID="Window2" IconUrl="~/res/images/16/11.png" runat="server" Hidden="true"
            IsModal="true" Target="Parent" EnableMaximize="true" EnableResize="true" OnClose="Window2_Close"
            Title="窗体二" CloseAction="HidePostBack"
            EnableIFrame="true" Height="550px" Width="850px">
        </f:Window>
    </form>
    <script>

        var Window1ClientID = '<%= Window1.ClientID %>';
        var Window2ClientID = '<%= Window2.ClientID %>';

        function onOpenWindow1Click(event) {
            F(Window1ClientID).show('<%= ResolveUrl("~/grid/grid_iframe_window.aspx") %>', '弹出窗口一');
        }

        function onOpenWindow2Click(event) {
            F(Window2ClientID).show('<%= ResolveUrl("~/grid/grid_iframe_window.aspx") %>', '弹出窗口二');
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示在当前页面或父页面弹出 <code>iframe</code> 窗体，并区分普通隐藏与回发关闭。</p>
    <h3><i class="f-iconfont f-iconfont-window" aria-hidden="true"></i>比较两种承载位置和关闭动作</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="在本页面弹出IFrame窗体">在本页面弹出IFrame窗体</strong>。<br />结果：当前示例文档显示第一个 <code>iframe</code> 窗体；点击它的关闭图标按本页普通隐藏配置关闭。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="在父页面弹出IFrame窗体">在父页面弹出IFrame窗体</strong>。<br />结果：父页面显示第二个 <code>iframe</code> 窗体；关闭时按本页回发关闭配置通知原页面。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗体一">窗体一</strong>的右上角关闭图标时，只是简单的隐藏窗体；</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="窗体二">窗体二</strong>的右上角关闭图标时，会触发 <code>OnClose</code> 事件（<code>CloseAction</code>=<code>HidePostBack</code>）。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Target</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗体一">窗体一</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="窗体二">窗体二</strong>）：各组分别设为<code>Self</code>、<code>Parent</code>，各窗体分别指向当前页面或父页面。</li>
        <li><code>EnableIFrame</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗体一">窗体一</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="窗体二">窗体二</strong>）：设为<code>true</code>，窗体内容由独立页面提供。</li>
        <li><code>CloseAction</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="窗体二">窗体二</strong>）：设为<code>HidePostBack</code>，需要关闭后回发的窗体使用对应动作，单纯隐藏不会自动调用后台关闭事件。</li>
    </ul>
</section>
</template>
</body>
</html>
