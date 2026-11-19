<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_iframe_reloadfirst.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_iframe_reloadfirst" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/tabstrip/emptypage.aspx" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="500px" ShowBorder="true" ActiveTabIndex="1" runat="server">
            <Tabs>
                <f:Tab ID="Tab1" EnableIFrame="true" BodyPadding="10px" IFrameUrl="../tabstrip/emptypage.aspx" Title="标签一（每次切换到此选项卡都重新加载IFrame）" runat="server">
                </f:Tab>
                <f:Tab ID="Tab2" EnableIFrame="true" BodyPadding="10px" IFrameUrl="../tabstrip/emptypage.aspx" Title="标签二" runat="server">
                </f:Tab>
                <f:Tab ID="Tab3" EnableIFrame="true" BodyPadding="10px" IFrameUrl="../tabstrip/emptypage.aspx" Title="标签三" runat="server">
                </f:Tab>
            </Tabs>
            <Listeners>
                <f:Listener Event="tabchange" Handler="onTabChange" />
            </Listeners>
        </f:TabStrip>
        <br />
        <br />

    </form>
    <script>
        var tab1ClientID = '<%= Tab1.ClientID %>';

        function onTabChange(event, tab) {
            // 如果激活的是第一个选项卡，则重新加载其中的IFrame
            if (tab.id === tab1ClientID) {
                tab.refreshIFrame();
            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示每次激活第一个标签时重新加载它的 <code>iframe</code>，其它标签继续保留已加载内容。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>比较再次激活后的加载时间</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>'
                        title="选项卡">选项卡</strong>切到第一个标签，记下子页显示的加载时间。<br />结果：第一个 <code>iframe</code> 按切换事件重新加载，显示本次时间。</li>
                <li>切回第二个标签，稍后再次切到第一个标签。<br />结果：第一个子页时间更新；第二、第三个标签没有配置这项重新加载动作。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>只有第一个选项卡在每次激活时都重新加载其中的<code>IFrame</code>。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>tabchange</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>）：仅在激活目标为第一个标签时执行刷新。</li>
                <li><code>refreshIFrame()</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab1").ClientID %>'
                        title="标签一（每次切换到此选项卡都重新加载IFrame）">标签一（每次切换到此选项卡都重新加载IFrame）</strong>）：重新导航该标签的 <code>iframe</code>，不刷新其它标签。</li>
            </ul>
        </section>
    </template>
</body>
</html>
