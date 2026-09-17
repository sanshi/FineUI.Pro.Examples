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
</body>
</html>
