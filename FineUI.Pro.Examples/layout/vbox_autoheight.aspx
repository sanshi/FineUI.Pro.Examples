<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vbox_autoheight.aspx.cs" Inherits="FineUI.Pro.Examples.layout.vbox_autoheight" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel5" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="true" Layout="VBox" ShowHeader="true"
            Title="面板（Layout=VBox）（默认值：BoxConfigAlign=Stretch）" BoxConfigSpace="5" BodyPadding="5">
            <Items>
                <f:Panel ID="Panel1" Title="面板1" Height="100px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="Height=100">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel2" Title="面板2" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" EncodeText="false" Text="末项无额外间隔<br><br><br><br><br><br>bottom line">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />

    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示让纵向盒布局按全部子项内容计算自然高度。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照布局与尺寸变化</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>'
                        title="面板（Layout=VBox）（默认值：BoxConfigAlign=Stretch）">面板（Layout=VBox）（默认值：BoxConfigAlign=Stretch）</strong>中对照最下方子项与外层容器底边。<br />结果：外层包含纵向排列的完整子项，不按固定高度截断内容。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Layout</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>'
                        title="面板（Layout=VBox）（默认值：BoxConfigAlign=Stretch）">面板（Layout=VBox）（默认值：BoxConfigAlign=Stretch）</strong>）：初始为<code>VBox</code>，父容器使用本页对应的布局方式，决定其直接子项的排列。
                </li>
                <li><code>Height</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>'
                        title="面板1">面板1</strong>）：初始为<code>100px</code>，显式高度限定可用区域；未设置固定高度的对照组按内容和父布局计算。</li>
            </ul>
        </section>
    </template>
</body>
</html>
