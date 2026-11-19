<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_enableclose.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_enableclose" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="350px" EnableTabCloseMenu="true" ShowBorder="true" ActiveTabIndex="1" runat="server">
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
                <f:Tab ID="Tab3" Title="标签三" Hidden="true" BodyPadding="10px" EnableClose="true" runat="server">
                    <Items>
                        <f:Label ID="Label3" Text="标签三中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab4" Title="标签四" BodyPadding="10px" EnableClose="true" runat="server">
                    <Items>
                        <f:Label ID="Label2" Text="标签四中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab5" EnableClose="true" Title="标签五" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label1" Text="标签五中的文本" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <br />
        <f:Button ID="btnShowInClient" Text="显示标签三（客户端代码）" CssClass="marginr" runat="server" ClickHandler="onShowInClientClick">
        </f:Button>
        <f:Button ID="btnShowActiveInClient" Text="显示并激活标签三（客户端代码）" CssClass="marginr" runat="server" ClickHandler="onShowActiveInClientClick">
        </f:Button>
        <f:Button ID="btnHideInClient" Text="隐藏标签三（客户端代码）" runat="server" ClickHandler="onHideInClientClick">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnShowInServer" Text="显示标签三（服务端代码）" CssClass="marginr" runat="server" OnClick="btnShowInServer_Click">
        </f:Button>
        <f:Button ID="btnShowActiveInServer" Text="显示并激活标签三（服务端代码）" CssClass="marginr" runat="server" OnClick="btnShowActiveInServer_Click">
        </f:Button>
        <f:Button ID="btnHideInServer" Text="隐藏标签三（服务端代码）" runat="server" OnClick="btnHideInServer_Click">
        </f:Button>
        <br />
        <br />
        <br />
        <f:Button ID="btnShowMoveToEnd" Text="显示标签三（客户端代码，移动到尾部）" CssClass="marginr" runat="server" ClickHandler="onShowMoveToEndClick">
        </f:Button>
        <f:Button ID="btnShowActiveMoveToEnd" Text="显示并激活标签三（客户端代码，移动到尾部）" CssClass="marginr" runat="server" ClickHandler="onShowActiveMoveToEndClick">
        </f:Button>
        <br />
    </form>
    <script>
        var Tab3ClientID = '<%= Tab3.ClientID %>';

        function onShowInClientClick(event) {
            F(Tab3ClientID).show();
        }

        function onShowActiveInClientClick(event) {
            F(Tab3ClientID).activate();
        }

        function onHideInClientClick(event) {
            F(Tab3ClientID).hide();
        }

        function onShowMoveToEndClick(event) {
            F(Tab3ClientID).show(true);
        }

        function onShowActiveMoveToEndClick(event) {
            F(Tab3ClientID).activate(true);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示各标签是否允许关闭，以及显示、激活、隐藏和移到末尾的差别。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-close" aria-hidden="true"></i>关闭与恢复标签</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>'
                        title="选项卡">选项卡</strong>关闭<code>标签二</code>，对照<code>标签一</code>。<br />结果：可关闭标签从标题栏消失；标签一不显示关闭图标，关闭其它标签时仍保留。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnShowInClient").ClientID %>'
                        title="显示标签三（客户端代码）">显示标签三（客户端代码）</strong>。<br />结果：浏览器显示标签三，但不强制把它切为当前项。</li>
                <li>点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnShowActiveInClient").ClientID %>'
                        title="显示并激活标签三（客户端代码）">显示并激活标签三（客户端代码）</strong>。<br />结果：浏览器显示标签三并立即切换到它的内容。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>后台显示和隐藏</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnShowInServer").ClientID %>'
                        title="显示标签三（服务端代码）">显示标签三（服务端代码）</strong>。<br />结果：回发后由后台显示标签三，原有其它标签继续保留。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnHideInServer").ClientID %>'
                        title="隐藏标签三（服务端代码）">隐藏标签三（服务端代码）</strong>。<br />结果：回发后从标题栏隐藏标签三。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-sort" aria-hidden="true"></i>改变显示位置</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnShowMoveToEnd").ClientID %>'
                        title="显示标签三（客户端代码，移动到尾部）">显示标签三（客户端代码，移动到尾部）</strong>。<br />结果：显示标签三时，同时把它移到现有标签的末尾。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableClose</code>（本页各选项卡页，如<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab1").ClientID %>'
                        title="标签一">标签一</strong>）：各组分别设为<code>false</code>、<code>true</code>，按标签设置是否允许关闭；标签一为 <code>false</code>，其它演示标签可关闭。</li>
                <li><code>Hidden</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab3").ClientID %>'
                        title="标签三">标签三</strong>）：初始为<code>true</code>，标签三初始隐藏，显示并不等于激活。</li>
                <li><code>show()</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>'
                        title="选项卡">选项卡</strong>）：显示已有标签；需要同时切页时使用本页带激活参数的写法。</li>
            </ul>
        </section>
    </template>
</body>
</html>
