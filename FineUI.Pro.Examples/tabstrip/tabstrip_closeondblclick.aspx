<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_closeondblclick.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_closeondblclick" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="500px" EnableTabCloseMenu="true" ShowBorder="true" ActiveTabIndex="1" runat="server"
            CloseOnDblclick="true">
            <Tabs>
                <f:Tab ID="Tab1" Title="标签一" EnableClose="true" BodyPadding="10px" runat="server">
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
                <f:Tab ID="Tab5" EnableClose="true" Title="标签五（不支持双击关闭）" CloseOnDblclick="false" BodyPadding="10px" runat="server">
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

    </form>
    <script>
        var Tab3ClientID = '<%= Tab3.ClientID %>';

        function onShowInClientClick(event) {
            F(Tab3ClientID).show();
        }

        function onShowActiveInClientClick(event) {
            F(Tab3ClientID).show();
            F(Tab3ClientID).activate();
        }

        function onHideInClientClick(event) {
            F(Tab3ClientID).hide();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示双击关闭标签，并对比整体开关、不可关闭标签和单个标签的覆盖设置。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-close" aria-hidden="true"></i>双击不同标签</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>'
                        title="选项卡">选项卡</strong>双击<code>标签二</code>标题。<br />结果：标签二关闭，效果与点击关闭图标相同。</li>
                <li>分别双击<code>标签一</code>和<code>标签五</code>标题。<br />结果：不可关闭的标签一继续保留；标签五关闭了双击功能，双击也不会关闭它。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li><code>Tab</code>定义的<code>CloseOnDblclick</code>属性会覆盖 <code>TabStrip</code> 的同名属性。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CloseOnDblclick</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>'
                        title="选项卡">选项卡</strong>）：初始为<code>true</code>，整体开启双击关闭；单个标签可以另外设为 <code>false</code>。</li>
                <li><code>EnableClose</code>（本页各选项卡页，如<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab1").ClientID %>' title="标签一">标签一</strong>）：初始为<code>true</code>，为
                    <code>false</code> 时，无论关闭图标还是双击都不能关闭该标签。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
