<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accordion_tree.aspx.cs"
    Inherits="FineUI.Pro.Examples.accordion.accordion_tree" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="RegionPanel1" runat="server"></f:PageManager>
        <f:RegionPanel ID="RegionPanel1" ShowBorder="false" runat="server" Margin="24px">
            <Regions>
                <f:Region ID="Region2" RegionSplit="true" RegionSplitHeaderClass="false" RegionPosition="Left" Width="200px" ShowHeader="false"
                    Title="目录" EnableCollapse="false" Layout="Fit" runat="server">
                    <Items>
                        <f:Accordion runat="server" ShowBorder="false" ShowHeader="false" ShowCollapseTool="true">
                            <Panes>
                                <f:AccordionPane runat="server" Title="面板一" IconUrl="~/res/images/16/1.png" BodyPadding="2px 5px"
                                    Layout="Fit">
                                    <Items>
                                        <f:Tree runat="server" ShowBorder="false" ShowHeader="false" ID="treeMenu" EnableSingleClickExpand="true" EnableNodeHyperLink="true">
                                            <%-- <Listeners>
                                                <f:Listener Event="nodeclick" Handler="onTreeNodeClick" />
                                            </Listeners>--%>
                                        </f:Tree>
                                    </Items>
                                </f:AccordionPane>
                                <f:AccordionPane runat="server" Title="面板二" IconUrl="~/res/images/16/4.png" BodyPadding="2px 5px">
                                    <Items>
                                        <f:Label Text="面板二中的文本" runat="server">
                                        </f:Label>
                                    </Items>
                                </f:AccordionPane>
                            </Panes>
                        </f:Accordion>
                    </Items>
                </f:Region>
                <f:Region ID="Region3" ShowHeader="false" EnableIFrame="true" IFrameUrl="~/accordion/accordion_tree_index.aspx"
                    IFrameName="accordionmainframe" Position="Center" runat="server">
                </f:Region>
            </Regions>
        </f:RegionPanel>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/res/menu.xml"></asp:XmlDataSource>
    </form>
    <%--<script>

        var region3ClientID = '<%= Region3.ClientID %>';

        function onTreeNodeClick(event, nodeId) {
            var me = this;
            var nodeData = me.getNodeData(nodeId);

            if (nodeData.leaf && nodeData.href) {

                F(region3ClientID).setIFrameUrl(nodeData.href);

                event.preventDefault();
            }

        }

    </script>--%>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示用左侧目录树导航右侧 <code>iframe</code>，并由区域布局分配两侧空间。</p>
    <h3><i class="f-iconfont f-iconfont-link" aria-hidden="true"></i>从目录打开示例</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("treeMenu").ClientID %>' title="树">树</strong>展开<code>基本用法</code>，点击<code>你好 FineUI</code>。<br />结果：浏览器在右侧 <code>iframe</code> 打开对应示例，左侧目录和其它已展开节点继续保留。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Layout</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("RegionPanel1").ClientID %>' title="区域面板">区域面板</strong>）：外层使用 <code>Region</code> 布局，目录区域与内容区域分别分配空间。</li>
        <li><code>NavigateUrl</code>（<strong>树节点</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("treeMenu").ClientID %>' title="树">树</strong>）：给叶子节点配置示例地址。</li>
        <li><code>IFrameName</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Region3").ClientID %>' title="第 2 个Region">第 2 个Region</strong>）：设为<code>accordionmainframe</code>，作为节点链接的目标，确保导航发生在右侧内容区。</li>
    </ul>
</section>
</template>
</body>
</html>
