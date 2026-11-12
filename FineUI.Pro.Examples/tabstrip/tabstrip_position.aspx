<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_position.aspx.cs" Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_position" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="150px" ShowBorder="true" TabPosition="Top" ActiveTabIndex="0"
            runat="server">
            <Tabs>
                <f:Tab Title="标签一" EnableClose="true" IconFont="_Home" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签二" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签五" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第五个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
				<f:Tab Title="标签六" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第六个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
				<f:Tab Title="标签七" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第七个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
				<f:Tab Title="标签八" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第八个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
				<f:Tab Title="标签九" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第九个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip2" IsFluid="true" Height="150px" ShowBorder="true" TabPosition="Bottom" ActiveTabIndex="0"
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
                <f:Tab Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签五" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第五个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
				<f:Tab Title="标签六" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第六个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
				<f:Tab Title="标签七" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第七个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
				<f:Tab Title="标签八" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第八个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
				<f:Tab Title="标签九" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第九个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip3"  IsFluid="true" Height="250px" ShowBorder="true" TabPosition="Left" ActiveTabIndex="0"
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
                <f:Tab Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签五" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第五个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
				<f:Tab Title="标签六" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第六个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip4"  IsFluid="true" Height="250px" ShowBorder="true" TabPosition="Right" ActiveTabIndex="0"
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
                <f:Tab Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签五" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第五个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
				<f:Tab Title="标签六" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第六个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <br />

        <br />
        <br />
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示在上、下、左、右四个方向放置标签标题栏。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>对比标题与当前项</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="第 1 个选项卡">第 1 个选项卡</strong>依次点击不同标签，对照本页其它组的同类标题。<br />结果：内容区随当前标签切换；标题方向、对齐、背景、边框或墨水条按本页配置显示。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
        <li>低版本<code>IE</code>浏览器不支持左侧和右侧选项卡。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>TabPosition</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="第 1 个选项卡">第 1 个选项卡</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip2").ClientID %>' title="第 2 个选项卡">第 2 个选项卡</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip3").ClientID %>' title="第 3 个选项卡">第 3 个选项卡</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip4").ClientID %>' title="第 4 个选项卡">第 4 个选项卡</strong>）：指定标题栏所在方向；各组按本页配置分别对照。 本页各组分别使用<code>Top</code>、<code>Bottom</code>、<code>Left</code>、<code>Right</code>。</li>
    </ul>
</section>
</template>
</body>
</html>
