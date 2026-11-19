<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hbox_autoheight.aspx.cs" Inherits="FineUI.Pro.Examples.layout.hbox_autoheight" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel5" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="false" Layout="HBox" AutoScroll="true" ShowHeader="true"
            Title="面板（Layout=HBox AutoScroll=true）" BoxConfigSpace="5" BodyPadding="5">
            <Items>
                <f:Panel ID="Panel1" Title="面板1" Width="600px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="Width=600">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel2" Title="面板2" BoxFlex="1" MinWidth="600px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" EncodeText="false"
                            Text="BoxFlex=1<br>末项无额外间隔<br>MinWidth=600<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>bottom line">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>

    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示让水平盒布局的高度随最高子项内容确定。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照布局与尺寸变化</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>'
                        title="面板（Layout=HBox AutoScroll=true）">面板（Layout=HBox AutoScroll=true）</strong>中对照同排子面板的内容高度。<br />结果：外层高度按子项实际内容确定，不强制使用固定面板高度。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Layout</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>'
                        title="面板（Layout=HBox AutoScroll=true）">面板（Layout=HBox AutoScroll=true）</strong>）：初始为<code>HBox</code>，父容器使用本页对应的布局方式，决定其直接子项的排列。</li>
                <li><code>Height</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>'
                        title="面板（Layout=HBox AutoScroll=true）">面板（Layout=HBox AutoScroll=true）</strong>）：显式高度限定可用区域；未设置固定高度的对照组按内容和父布局计算。</li>
            </ul>
        </section>
    </template>
</body>
</html>
