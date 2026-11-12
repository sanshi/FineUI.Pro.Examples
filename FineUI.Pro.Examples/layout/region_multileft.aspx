<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="region_multileft.aspx.cs" Inherits="FineUI.Pro.Examples.layout.region_multileft" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" Margin="24px" runat="server" ShowBorder="false" ShowHeader="false" Layout="Region">
            <Items>
                <f:Panel runat="server" ID="panelLeftRegion" RegionPosition="Left" RegionSplit="true" EnableCollapse="true"
                    Width="200px" Title="左侧面板" ShowBorder="true" ShowHeader="true"
                    BodyPadding="10px">
                    <Items>
                        <f:Label ID="Label2" runat="server" Text="左侧面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panel2" RegionPosition="Left" RegionSplit="true" EnableCollapse="true"
                    Width="200px" Title="左侧面板" ShowBorder="true" ShowHeader="true"
                    BodyPadding="10px">
                    <Items>
                        <f:Label ID="Label6" runat="server" Text="左侧面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panel3" RegionPosition="Left" RegionSplit="true" EnableCollapse="true"
                    Width="200px" Title="左侧面板" ShowBorder="true" ShowHeader="true"
                    BodyPadding="10px">
                    <Items>
                        <f:Label ID="Label7" runat="server" Text="左侧面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelCenterRegion" RegionPosition="Center"
                    Title="中间面板" ShowBorder="true" ShowHeader="true" BodyPadding="10px">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="中间面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示同一容器中放置多个左侧区域，按顺序分配左侧空间。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>调整区域空间</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="第 1 个面板">第 1 个面板</strong>拖动可用的分隔条，再点击侧边区域的折叠入口。<br />结果：被操作区域改变尺寸或折叠，中心区域随剩余空间重新布局；其它区域内容保留。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Layout</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="第 1 个面板">第 1 个面板</strong>）：外层使用 <code>Region</code> 布局组织各方向的子区域。 本页使用<code>Region</code>。</li>
        <li><code>RegionPosition</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panelLeftRegion").ClientID %>' title="第 2 个面板（左侧面板）">第 2 个面板（左侧面板）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panel2").ClientID %>' title="第 3 个面板（左侧面板）">第 3 个面板（左侧面板）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panel3").ClientID %>' title="第 4 个面板（左侧面板）">第 4 个面板（左侧面板）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panelCenterRegion").ClientID %>' title="中间面板">中间面板</strong>）：指定每个子区域所在的方向，中心区域使用剩余空间。 本页各组分别使用<code>Left</code>、<code>Center</code>。</li>
        <li><code>RegionSplit</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panelLeftRegion").ClientID %>' title="第 2 个面板（左侧面板）">第 2 个面板（左侧面板）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panel2").ClientID %>' title="第 3 个面板（左侧面板）">第 3 个面板（左侧面板）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panel3").ClientID %>' title="第 4 个面板（左侧面板）">第 4 个面板（左侧面板）</strong>）：允许对应区域显示可拖动的分隔条。 本页使用<code>true</code>。</li>
    </ul>
</section>
</template>
</body>
</html>
