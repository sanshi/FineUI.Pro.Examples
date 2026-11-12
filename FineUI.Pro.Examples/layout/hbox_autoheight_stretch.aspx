<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hbox_autoheight_stretch.aspx.cs" Inherits="FineUI.Pro.Examples.layout.hbox_autoheight_stretch" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel5" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="false" Layout="HBox" BodyPadding="10px" BoxConfigSpace="5"
            ShowHeader="true" Title="面板（Layout=HBox）（默认值：BoxConfigAlign=Stretch）">
            <Items>
                <f:Panel ID="Panel7" Title="面板1" Width="200px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label5" runat="server" Text="Width=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel8" Title="面板2" Width="200px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label6" runat="server" EncodeText="false" Text="Width=200px<br><br><br><br><br><br><br><br>bottom line">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel13" Title="面板3" BoxFlex="1" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label9" runat="server" EncodeText="false" Text="BoxFlex=1">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="false" Layout="HBox" BodyPadding="10px" BoxConfigSpace="5"
            ShowHeader="true" Title="面板（Layout=HBox）（默认值：BoxConfigAlign=Stretch）">
            <Items>
                <f:Panel ID="Panel2" Title="面板1" Width="200px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="Width=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel3" Title="面板2" Width="200px" Height="250px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label2" runat="server" EncodeText="false" Text="Width=200px Height=250px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel14" Title="面板3" BoxFlex="1" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label10" runat="server" EncodeText="false" Text="BoxFlex=1">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel10" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="false" Layout="HBox" BodyPadding="10px" BoxConfigAlign="Start"
            BoxConfigSpace="5" ShowHeader="true" Title="面板（Layout=HBox BoxConfigAlign=Start）">
            <Items>
                <f:Panel ID="Panel11" Title="面板1" Width="200px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label7" runat="server" Text="Width=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel12" Title="面板2" Width="200px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label8" runat="server" EncodeText="false" Text="Width=200px<br><br><br><br><br><br><br><br>bottom line">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel15" Title="面板3" BoxFlex="1" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label11" runat="server" EncodeText="false" Text="BoxFlex=1">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel4" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="false" Layout="HBox" BoxConfigAlign="Start" BodyPadding="10px"
            BoxConfigSpace="5" ShowHeader="true" Title="面板（Layout=HBox BoxConfigAlign=Start）">
            <Items>
                <f:Panel ID="Panel6" Title="面板1" Width="200px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="Width=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel9" Title="面板2" Width="200px" Height="250px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label4" runat="server" EncodeText="false" Text="Width=200px Height=250px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel16" Title="面板3" BoxFlex="1" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label12" runat="server" EncodeText="false" Text="BoxFlex=1">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>

    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示对比自动高度下子项纵向拉伸的效果。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照布局与尺寸变化</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>' title="第 1 个面板（面板（Layout=HBox）（默认值：BoxConfigAlign=Stretch））">第 1 个面板（面板（Layout=HBox）（默认值：BoxConfigAlign=Stretch））</strong>中对照同排子项的底边与不同内容长度。<br />结果：开启拉伸的一组按同排内容确定共同高度，其它组保留各自自然高度。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>BoxConfigAlign</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel10").ClientID %>' title="第 9 个面板（面板（Layout=HBox BoxConfigAlign=Start））">第 9 个面板（面板（Layout=HBox BoxConfigAlign=Start））</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel4").ClientID %>' title="第 13 个面板（面板（Layout=HBox BoxConfigAlign=Start））">第 13 个面板（面板（Layout=HBox BoxConfigAlign=Start））</strong>）：初始为<code>Start</code>，指定盒布局中交叉方向的对齐或伸展方式。</li>
        <li><code>Height</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel3").ClientID %>' title="第 5 个面板（面板（Layout=HBox）（默认值：BoxConfigAlign=Stretch））的面板2">第 5 个面板（面板（Layout=HBox）（默认值：BoxConfigAlign=Stretch））的面板2</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel9").ClientID %>' title="第 13 个面板（面板（Layout=HBox BoxConfigAlign=Start））的面板2">第 13 个面板（面板（Layout=HBox BoxConfigAlign=Start））的面板2</strong>）：初始为<code>250px</code>，显式高度限定可用区域；未设置固定高度的对照组按内容和父布局计算。</li>
    </ul>
</section>
</template>
</body>
</html>
