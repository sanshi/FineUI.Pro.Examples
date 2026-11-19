<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="parent_postback_top.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.parent_postback_top" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/parent_postback_top2.aspx;~/iframe/parent_postback_top3.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        页面一：parent_postback_top.aspx
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
        <br />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="false" Height="500px" EnableIFrame="true"
            IFrameUrl="parent_postback_top2.aspx" ShowHeader="true" Title="面板一">
        </f:Panel>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示多层 <code>iframe</code> 中的窗体显示位置与回发目标：窗体显示在顶层，关闭后回发最初打开它的第二层页面。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>顶层显示与关闭回发</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>'
                        title="面板一">面板一</strong>打开第二层页面中的任一弹窗入口，再在弹出的第三层页面点击<strong>关闭本窗体，回发父页面</strong>。<br />结果：窗体关闭，第二层页面回发并更新页面加载时间；最外层页面保持不变。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableIFrame</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>'
                        title="面板一">面板一</strong>）：初始为<code>true</code>，面板承载下一层独立页面。</li>
                <li><code>IFrameUrl</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>'
                        title="面板一">面板一</strong>）：初始为<code>parent_postback_top2.aspx</code>，指定下一层页面地址。</li>
                <li><code>ActiveWindow.GetHidePostBackReference()</code>（<strong>第三层页面的关闭按钮</strong>）：关闭当前窗体并回发最初打开它的第二层页面；窗体显示在顶层，不改变回发目标。</li>
            </ul>
        </section>
    </template>
</body>
</html>
