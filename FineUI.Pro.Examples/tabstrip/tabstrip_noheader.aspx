<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_noheader.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_noheader" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="350px" EnableTabCloseMenu="true" ShowBorder="true" ShowTabHeader="false" runat="server"
            ActiveTabIndex="1">
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
                <f:Tab ID="Tab3" Title="标签三" BodyPadding="10px" EnableClose="true" runat="server" Layout="VBox">
                    <Items>
                        <f:Label ID="Label3" Text="标签三中的文本" runat="server" />
                        <f:TabStrip ID="TabStrip2" BoxFlex="1" EnableTabCloseMenu="true" ShowBorder="true" runat="server" ActiveTabIndex="1">
                            <Tabs>
                                <f:Tab ID="Tab4" Title="标签四" EnableClose="false" BodyPadding="10px" runat="server">
                                    <Items>
                                        <f:Label ID="Label1" Text="标签四中的文本" runat="server" />
                                    </Items>
                                </f:Tab>
                                <f:Tab ID="Tab5" Title="标签五" EnableClose="false" BodyPadding="10px" runat="server">
                                    <Items>
                                        <f:Label ID="Label2" Text="标签五中的文本" runat="server" />
                                    </Items>
                                </f:Tab>
                            </Tabs>
                        </f:TabStrip>
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:Button ID="btnShowActiveTab1" Text="激活标签一" CssClass="marginr" runat="server" ClickHandler="onShowActiveTab1Click">
        </f:Button>
        <f:Button ID="btnShowActiveTab2" Text="激活标签二" CssClass="marginr" runat="server" ClickHandler="onShowActiveTab2Click">
        </f:Button>
        <f:Button ID="btnShowActiveTab3" Text="激活标签三" CssClass="marginr" runat="server" ClickHandler="onShowActiveTab3Click">
        </f:Button>
        <br />
        <br />
        <br />
    </form>
    <script>
        var Tab1ClientID = '<%= Tab1.ClientID %>';
        var Tab2ClientID = '<%= Tab2.ClientID %>';
        var Tab3ClientID = '<%= Tab3.ClientID %>';

        function onShowActiveTab1Click(event) {
            F(Tab1ClientID).show();
            F(Tab1ClientID).activate();
        }

        function onShowActiveTab2Click(event) {
            F(Tab2ClientID).show();
            F(Tab2ClientID).activate();
        }

        function onShowActiveTab3Click(event) {
            F(Tab3ClientID).show();
            F(Tab3ClientID).activate();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示隐藏整个标签标题栏，通过按钮切换内容。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>使用本页切换入口</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnShowActiveTab1").ClientID %>'
                        title="激活标签一">激活标签一</strong>。<br />结果：按按钮配置显示、激活或切换指定标签，标题栏的隐藏规则保持不变。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnShowActiveTab2").ClientID %>'
                        title="激活标签二">激活标签二</strong>。<br />结果：按按钮配置显示、激活或切换指定标签，标题栏的隐藏规则保持不变。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnShowActiveTab3").ClientID %>'
                        title="激活标签三">激活标签三</strong>。<br />结果：按按钮配置显示、激活或切换指定标签，标题栏的隐藏规则保持不变。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ShowTabHeader</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="第 1 个选项卡">第 1
                        个选项卡</strong>）：初始为<code>false</code>，隐藏标题栏，内容由本页按钮切换。</li>
            </ul>
        </section>
    </template>
</body>
</html>
