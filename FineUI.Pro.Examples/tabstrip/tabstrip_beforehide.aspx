<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_beforehide.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_beforehide" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="350px" EnableTabCloseMenu="true" ShowBorder="true" ActiveTabIndex="2" runat="server">
            <Tabs>
                <f:Tab ID="Tab1" Title="标签一" EnableClose="false" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label5" Text="标签一中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab2" Title="标签二" BodyPadding="10px" EnableClose="true" runat="server">
                    <Items>
                        <f:Label ID="Label4" Text="标签二中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab3" Title="标签三（关闭前弹出确认框）" BodyPadding="10px" EnableClose="true" runat="server">
                    <Items>
                        <f:Label ID="Label3" Text="标签三中的文本" runat="server" />
                    </Items>
                    <Listeners>
                        <f:Listener Event="beforehide" Handler="onTab3Beforehide" />
                    </Listeners>
                </f:Tab>
            </Tabs>
        </f:TabStrip>

    </form>

    <script>
        function onTab3Beforehide(event) {
            if (!window.confirm('关闭标签三？')) {
                // 需要显式的返回 false，来阻止执行返回的脚本
                return false;
            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示关闭标签前显示原生确认框，取消时保留原标签。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>确认后再关闭</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>'
                        title="选项卡">选项卡</strong>点击<code>标签三</code>的关闭图标，先取消确认。<br />结果：标签三及它的内容仍然保留。</li>
                <li>再次关闭并选择确定。<br />结果：只有确认后才关闭标签；确认本身不清空其它标签的数据。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>beforehide</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>'
                        title="选项卡">选项卡</strong>）：先阻止默认隐藏流程，根据确认结果决定是否继续关闭。</li>
                <li><code>confirm()</code>（<strong>关闭确认处理</strong>）：同步返回是否确认，取消则中止隐藏。</li>
            </ul>
        </section>
    </template>
</body>
</html>
