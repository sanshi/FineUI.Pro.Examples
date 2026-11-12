<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="region_regionpercent.aspx.cs" Inherits="FineUI.Pro.Examples.layout.region_regionpercent" %>

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
                <f:Panel runat="server" ID="panelTopRegion" RegionPosition="Top" RegionSplit="true" EnableCollapse="true" RegionPercent="20%"
                    Title="顶部面板" ShowBorder="true" ShowHeader="false" BodyPadding="10px" IconFont="_PullUp">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="顶部面板的内容（RegionPercent=20%）">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelLeftRegion" RegionPosition="Left" RegionSplit="true" EnableCollapse="true"
                    RegionPercent="30%" Title="左侧面板（有提示信息）" TitleToolTip="左侧面板（有提示信息）" ShowBorder="true" ShowHeader="false"
                    BodyPadding="10px" IconFont="_PullLeft">
                    <Items>
                        <f:Label ID="Label2" runat="server" EncodeText="false" Text="左侧面板的内容<br>（RegionPercent=30%）">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelCenterRegion" RegionPosition="Center"
                    Title="中间面板" ShowBorder="true" ShowHeader="false" BodyPadding="10px" IconFont="_RoundPlus">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="中间面板的内容">
                        </f:Label>
                        <f:Label ID="Label6" runat="server">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelRightRegion" RegionPosition="Right" RegionSplit="true" EnableCollapse="true"
                    RegionPercent="30%" Title="右侧面板" ShowBorder="true" ShowHeader="false" BodyPadding="10px" IconFont="_PullRight">
                    <Items>
                        <f:Label ID="Label4" runat="server" EncodeText="false" Text="右侧面板的内容<br>（RegionPercent=30%）">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelBottomRegion" RegionPosition="Bottom" RegionSplit="true" EnableCollapse="true" RegionPercent="20%"
                    Title="底部面板" ShowBorder="true" ShowHeader="false" BodyPadding="10px" IconFont="_PullDown">
                    <Items>
                        <f:Label ID="Label5" runat="server" Text="底部面板的内容（RegionPercent=20%）">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示按百分比分配侧边区域，在容器尺寸改变后重新计算中心剩余空间。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>调整页面与区域尺寸</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="第 1 个面板">第 1 个面板</strong>改变浏览器宽度和高度。<br />结果：左右区域按本页 <code>30%</code> 配置分配宽度，上下区域按 <code>20%</code> 配置分配高度，中心使用剩余空间。</li>
        <li>拖动分隔条或使用侧边区域的折叠入口。<br />结果：当前区域的尺寸或可见状态变化，中心区域重新布局，其它内容保留。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Layout</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="第 1 个面板">第 1 个面板</strong>）：设为<code>Region</code>，外层使用 <code>Region</code>。</li>
        <li><code>RegionPercent</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panelTopRegion").ClientID %>' title="顶部面板">顶部面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panelLeftRegion").ClientID %>' title="左侧面板（有提示信息）">左侧面板（有提示信息）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panelRightRegion").ClientID %>' title="右侧面板">右侧面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panelBottomRegion").ClientID %>' title="底部面板">底部面板</strong>）：各组分别设为<code>20%</code>、<code>30%</code>，子区域以百分比参与当前容器的尺寸分配。</li>
        <li><code>RegionSplit</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panelTopRegion").ClientID %>' title="顶部面板">顶部面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panelLeftRegion").ClientID %>' title="左侧面板（有提示信息）">左侧面板（有提示信息）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panelRightRegion").ClientID %>' title="右侧面板">右侧面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panelBottomRegion").ClientID %>' title="底部面板">底部面板</strong>）：设为<code>true</code>，指定侧边区域可以拖动分隔条。</li>
    </ul>
</section>
</template>
</body>
</html>
