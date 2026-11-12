<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_align.aspx.cs" Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_align" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="150px" ShowBorder="true" ActiveTabIndex="0"
            runat="server">
            <Tabs>
                <f:Tab Title="标签一" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab4" Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label4" Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip2" IsFluid="true" Height="150px" ShowBorder="true" TabAlign="Center" ActiveTabIndex="1"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab1" Title="标签一" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label1" Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab2" Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label2" Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab3" Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label3" Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab8" Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label8" Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip3" IsFluid="true" Height="150px" ShowBorder="true" TabAlign="Right" ActiveTabIndex="2"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab5" Title="标签一" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label5" Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab6" Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label6" Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab7" Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label7" Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab9" Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label9" Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示对比标签标题的左对齐、居中和右对齐。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>对比标题与当前项</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="第 1 个选项卡">第 1 个选项卡</strong>依次点击不同标签，对照本页其它组的同类标题。<br />结果：内容区随当前标签切换；标题方向、对齐、背景、边框或墨水条按本页配置显示。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>TabAlign</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip2").ClientID %>' title="第 2 个选项卡">第 2 个选项卡</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip3").ClientID %>' title="第 3 个选项卡">第 3 个选项卡</strong>）：指定标题列表在可用空间内的对齐方式。 本页各组分别使用<code>Center</code>、<code>Right</code>。</li>
    </ul>
</section>
</template>
</body>
</html>
