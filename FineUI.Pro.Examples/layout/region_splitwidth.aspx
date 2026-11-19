<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="region_splitwidth.aspx.cs" Inherits="FineUI.Pro.Examples.layout.region_splitwidth" %>

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
                <f:Panel runat="server" ID="panelTopRegion" RegionPosition="Top" RegionSplit="true" RegionSplitWidth="3px" EnableCollapse="true" Height="100px"
                    Title="顶部面板" ShowBorder="true" ShowHeader="true" BodyPadding="10px">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="顶部面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelLeftRegion" RegionPosition="Left" RegionSplit="true" RegionSplitWidth="3px" EnableCollapse="true" Width="200px"
                    Title="左侧面板" ShowBorder="true" ShowHeader="true" BodyPadding="10px">
                    <Items>
                        <f:Label ID="Label2" runat="server" Text="左侧面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelCenterRegion" RegionPosition="Center" Title="中间面板" ShowBorder="true" ShowHeader="true" BodyPadding="10px">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="中间面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelRightRegion" RegionPosition="Right" RegionSplit="true" RegionSplitWidth="3px" EnableCollapse="true"
                    Width="200px" Title="右侧面板" ShowBorder="true" ShowHeader="true" BodyPadding="10px">
                    <Items>
                        <f:Label ID="Label4" runat="server" Text="右侧面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelBottomRegion" RegionPosition="Bottom" RegionSplit="true" RegionSplitWidth="3px" EnableCollapse="true"
                    Height="100px" Title="底部面板" ShowBorder="true" ShowHeader="true" BodyPadding="10px">
                    <Items>
                        <f:Label ID="Label5" runat="server" Text="底部面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示设置区域之间的分隔条宽度，同时保留拖动与折叠能力。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照和拖动分隔条</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>'
                        title="第 1 个面板">第 1 个面板</strong>拖动可用的分隔条，再点击侧边区域的折叠入口。<br />结果：被操作区域改变尺寸或折叠，中心区域随剩余空间重新布局；其它区域内容保留。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Layout</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="第 1 个面板">第 1
                        个面板</strong>）：初始为<code>Region</code>，外层使用 <code>Region</code> 布局组织各方向的子区域。</li>
                <li><code>RegionPosition</code>（本页各面板，如<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panelTopRegion").ClientID %>'
                        title="顶部面板">顶部面板</strong>）：各组分别设为<code>Top</code>、<code>Left</code>、<code>Center</code>、<code>Right</code>、<code>Bottom</code>，指定每个子区域所在的方向，中心区域使用剩余空间。
                </li>
                <li><code>RegionSplitWidth</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panelTopRegion").ClientID %>' title="顶部面板">顶部面板</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panelLeftRegion").ClientID %>'
                        title="左侧面板">左侧面板</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panelRightRegion").ClientID %>' title="右侧面板">右侧面板</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("panelBottomRegion").ClientID %>'
                        title="底部面板">底部面板</strong>）：初始为<code>3px</code>，本页为分隔条显式指定宽度。</li>
            </ul>
        </section>
    </template>
</body>
</html>
