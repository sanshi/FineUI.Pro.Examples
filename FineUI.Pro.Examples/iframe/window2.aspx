<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window2.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.window2" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/window2_iframe.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <br />
        <f:Button ID="Button1" Text="弹出窗体" runat="server" ClickHandler="onOpenWindow1Click">
        </f:Button>
        <f:Window ID="Window1" Hidden="true" EnableIFrame="true" runat="server" Target="Top"
            EnableMaximize="true" EnableResize="true" Height="500px" Width="800px" Title="窗体一">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" Position="Bottom" ToolbarAlign="Right">
                    <Items>
                        <f:Button ID="btnClosePostBack" Text="保存" Icon="SystemSave"
                            runat="server" ClickHandler="onClosePostBackClick">
                        </f:Button>
                        <f:Button ID="btnClose" Text="关闭" Icon="SystemClose" runat="server" ClickHandler="onCloseClick">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>
        <br />
        <f:Label ID="labResult" CssStyle="font-weight:bold;" runat="server">
        </f:Label>
    </form>
    <script>

        var Window1ClientID = '<%= Window1.ClientID %>';

        function onOpenWindow1Click(event) {
            F(Window1ClientID).show('<%= ResolveUrl("~/iframe/window2_iframe.aspx") %>');
        }

        function onClosePostBackClick(event) {
            F(Window1ClientID).getIFrameWindow().saveWindow();
        }

        function onCloseClick(event) {
            F(Window1ClientID).hide();
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示把保存、关闭按钮放在 <code>iframe</code> 窗体工具栏，由外层按钮调用子页保存逻辑。</p>
    <h3><i class="f-iconfont f-iconfont-window" aria-hidden="true"></i>从外层工具栏保存</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="弹出窗体">弹出窗体</strong>。<br />结果：窗体显示子页表单，底部工具栏提供保存和关闭入口。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnClosePostBack").ClientID %>' title="保存">保存</strong>。<br />结果：外层通过 <code>getIFrameWindow()</code> 调用子页 <code>saveWindow()</code>，由子页验证及执行本例保存处理。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnClose").ClientID %>' title="关闭">关闭</strong>。<br />结果：直接隐藏窗体，不自动执行保存处理。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Position</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Toolbar1").ClientID %>' title="工具栏">工具栏</strong>）：保存工具栏放在窗体底部。 本页使用<code>Bottom</code>。</li>
        <li><code>getIFrameWindow()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗体一">窗体一</strong>）：取得子页窗口对象，调用子页公开的保存函数。</li>
    </ul>
</section>
</template>
</body>
</html>
