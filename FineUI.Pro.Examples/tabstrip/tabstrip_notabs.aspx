<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_notabs.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_notabs" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="250px" EnableTabCloseMenu="true"
            ShowBorder="true" runat="server">
            <Tabs>
                <f:Tab ID="Tab1" Title="标签一" EnableClose="false" Hidden="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label5" Text="标签一中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab2" Title="标签二" BodyPadding="10px" Hidden="true" EnableClose="true" runat="server">
                    <Items>
                        <f:Label ID="Label4" Text="标签二中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab3" Title="标签三" BodyPadding="10px" Hidden="true" EnableClose="true" runat="server">
                    <Items>
                        <f:Label ID="Label3" Text="标签三中的文本" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <br />
        <f:Button ID="btnShowTab1" Text="显示标签一" CssClass="marginr"
 runat="server" ClickHandler="onShowTab1Click">
        </f:Button>
        <f:Button ID="btnShowTab2" Text="显示标签二" CssClass="marginr"
 runat="server" ClickHandler="onShowTab2Click">
        </f:Button>
        <f:Button ID="btnShowTab3" Text="显示标签三" CssClass="marginr"
 runat="server" ClickHandler="onShowTab3Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnShowActiveTab1" Text="显示并激活标签一" CssClass="marginr"
 runat="server" ClickHandler="onShowActiveTab1Click">
        </f:Button>
        <f:Button ID="btnShowActiveTab2" Text="显示并激活标签二" CssClass="marginr"
 runat="server" ClickHandler="onShowActiveTab2Click">
        </f:Button>
        <f:Button ID="btnShowActiveTab3" Text="显示并激活标签三" CssClass="marginr"
 runat="server" ClickHandler="onShowActiveTab3Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnHideTab1" Text="隐藏标签一" CssClass="marginr"
 runat="server" ClickHandler="onHideTab1Click">
        </f:Button>
        <f:Button ID="btnHideTab2" Text="隐藏标签二" CssClass="marginr"
 runat="server" ClickHandler="onHideTab2Click">
        </f:Button>
        <f:Button ID="btnHideTab3" Text="隐藏标签三" CssClass="marginr"
 runat="server" ClickHandler="onHideTab3Click">
        </f:Button>
        <br />
        <br />
        <br />
        <br />
    </form>
    <script>

        var Tab1ClientID = '<%= Tab1.ClientID %>';
        var Tab2ClientID = '<%= Tab2.ClientID %>';
        var Tab3ClientID = '<%= Tab3.ClientID %>';

        function onShowTab1Click(event) {
            F(Tab1ClientID).show();
        }

        function onShowTab2Click(event) {
            F(Tab2ClientID).show();
        }

        function onShowTab3Click(event) {
            F(Tab3ClientID).show();
        }

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

        function onHideTab1Click(event) {
            F(Tab1ClientID).hide();
        }

        function onHideTab2Click(event) {
            F(Tab2ClientID).hide();
        }

        function onHideTab3Click(event) {
            F(Tab3ClientID).hide();
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示初始隐藏所有标签，再通过按钮显示和激活标签。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>使用本页切换入口</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnShowTab1").ClientID %>' title="显示标签一">显示标签一</strong>。<br />结果：按按钮配置显示、激活或切换指定标签，标题栏的隐藏规则保持不变。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnShowTab2").ClientID %>' title="显示标签二">显示标签二</strong>。<br />结果：按按钮配置显示、激活或切换指定标签，标题栏的隐藏规则保持不变。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnShowTab3").ClientID %>' title="显示标签三">显示标签三</strong>。<br />结果：按按钮配置显示、激活或切换指定标签，标题栏的隐藏规则保持不变。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Hidden</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab1").ClientID %>' title="标签一">标签一</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab2").ClientID %>' title="标签二">标签二</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab3").ClientID %>' title="标签三">标签三</strong>）：本页标签初始隐藏，显示后才能在标题栏选择。 本页使用<code>true</code>。</li>
    </ul>
</section>
</template>
</body>
</html>
