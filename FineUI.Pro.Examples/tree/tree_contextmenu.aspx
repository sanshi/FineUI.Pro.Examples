<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_contextmenu.aspx.cs" Inherits="FineUI.Pro.Examples.tree.tree_contextmenu" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" Title="树控件（右键菜单）" EnableCollapse="false" EnableSingleClickExpand="false"
            runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省">
                        <f:TreeNode Text="驻马店市" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" Leaf="false" NodeID="suiping">
                                <f:TreeNode Text="槐树乡" Leaf="false" NodeID="huaishu">
                                    <f:TreeNode Text="陈庄村" NodeID="chenzhuang">
                                    </f:TreeNode>
                                </f:TreeNode>
                                <f:TreeNode Text="嵖岈山乡" NodeID="chayashanxiang">
                                </f:TreeNode>
                            </f:TreeNode>
                            <f:TreeNode Text="西平县" Leaf="false" NodeID="xiping">
                                <f:TreeNode Text="芦庙乡" NodeID="lumiaoxiang">
                                </f:TreeNode>
                                <f:TreeNode Text="杨庄乡" NodeID="yangzhuangxiang">
                                </f:TreeNode>
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" Expanded="true" NodeID="anhui">
                        <f:TreeNode Text="合肥市" Expanded="true" NodeID="hefei">
                            <f:TreeNode Text="金色池塘小区" NodeID="golden">
                            </f:TreeNode>
                            <f:TreeNode Text="中国科学技术大学" NodeID="ustc">
                            </f:TreeNode>
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
            <Listeners>
                <f:Listener Event="beforenodecontextmenu" Handler="onTreeNodeContextMenu" />
            </Listeners>
        </f:Tree>
        <f:Menu ID="Menu1" runat="server">
            <Items>
                <f:MenuButton ID="btnExpandNode" runat="server" Text="展开全部" ClickHandler="onExpandNode"></f:MenuButton>
                <f:MenuButton ID="btnCollapseNode" runat="server" Text="折叠全部" ClickHandler="onCollapseNode"></f:MenuButton>
            </Items>
            <Listeners>
                <f:Listener Event="show" Handler="onMenuShow" />
            </Listeners>
        </f:Menu>
    </form>
    <br />
    注：在叶子节点上点击右键，则弹出菜单的菜单项都是禁用状态。
    <script>

        var treeID = '<%= Tree1.ClientID %>';
        var menuID = '<%= Menu1.ClientID %>';
        // 保存当前菜单对应的树节点ID
        var currentNodeId;

        // 返回false，来阻止浏览器右键菜单
        function onTreeNodeContextMenu(event, nodeId) {
            currentNodeId = nodeId;
            F(menuID).show();
            return false;
        }

        // 设置所有菜单项的禁用状态
        function setMenuItemsDisabled(disabled) {
            var menu = F(menuID);
            $.each(menu.items, function (index, item) {
                item.setDisabled(disabled);
            });
        }

        // 显示菜单后，检查是否禁用菜单项
        function onMenuShow(event) {
            if (currentNodeId) {
                var tree = F(treeID);
                var nodeData = tree.getNodeData(currentNodeId);
                if (nodeData.leaf) {
                    setMenuItemsDisabled(true);
                } else {
                    setMenuItemsDisabled(false);
                }
            }
        }

        function onExpandNode(event) {
            if (currentNodeId) {
                F(treeID).expandNode(currentNodeId, true);
            }
        }

        function onCollapseNode(event) {
            if (currentNodeId) {
                F(treeID).collapseNode(currentNodeId, true);
            }
        }

    </script>
</body>
</html>
