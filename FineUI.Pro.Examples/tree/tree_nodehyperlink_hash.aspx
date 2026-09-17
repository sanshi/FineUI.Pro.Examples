<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_nodehyperlink_hash.aspx.cs" Inherits="FineUI.Pro.Examples.tree.tree_nodehyperlink_hash" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

    <style>
        .lefttree {
            border-top-width: 0;
            border-left-width: 0;
            border-bottom-width: 0;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="RegionPanel1" IsFluid="true" Layout="Region" Height="500px" ShowHeader="true" Title="左右区域布局"
            ShowBorder="true" runat="server">
            <Items>
                <f:Tree ID="Tree1" RegionSplit="false" RegionPosition="Left" Width="200px" CssClass="lefttree"
                    ShowHeader="false" ShowBorder="true" runat="server" EnableSingleClickExpand="true">
                    <Nodes>
                        <f:TreeNode Text="基本用法">
                            <f:TreeNode Text="你好 FineUI" NavigateUrl="~/basic/hello.aspx">
                            </f:TreeNode>
                            <f:TreeNode Text="登陆页面" NavigateUrl="~/basic/login.aspx">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="表单控件">
                            <f:TreeNode Text="简单按钮" NavigateUrl="~/button/button.aspx">
                            </f:TreeNode>
                            <f:TreeNode Text="文本输入框" NavigateUrl="~/form/textbox.aspx">
                            </f:TreeNode>
                        </f:TreeNode>
                    </Nodes>
                </f:Tree>
                <f:Panel ID="Panel1" ShowHeader="false" EnableIFrame="true" ShowBorder="false"
                    RegionPosition="Center" runat="server">
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <f:Button runat="server" ID="btnRefresh" Text="刷新本页面" ClickHandler="onRefreshClick"></f:Button>
        <br />
        <br />
        注：刷新页面后，能够保持当前选中的树节点。
    </form>
    <script>
        function onRefreshClick(event) {
            window.location.reload();
        }



        var tree1ClientID = '<%= Tree1.ClientID %>';
        var panel1ClientID = '<%= Panel1.ClientID %>';

        F.ready(function () {

            var tree1 = F(tree1ClientID);
            var panel1 = F(panel1ClientID);

            // 树节点的点击事件
            tree1.on('nodeclick', function (event, nodeId) {

                // 点击树节点的数据
                var nodeData = tree1.getNodeData(nodeId);

                // 不管当前节点是否子节点，只要有 href 属性，都需要打开一个新Tab
                if (nodeData.href) {

                    // 修改地址栏
                    window.location.hash = '#' + nodeData.href;

                    // 在主区域内打开链接
                    panel1.setIFrameUrl(nodeData.href);

                    // 阻止默认的点击行为（比如超链接）
                    event.preventDefault();
                }
            });



            // 页面第一次加载时，根据URL地址在主窗口加载页面
            var HASH = window.location.hash.substr(1);
            if (HASH) {
                // 遍历树节点
                tree1.resolveNode(function (node) {

                    // 找到节点
                    if (node.href === HASH) {

                        // 展开节点所在的路径
                        tree1.expandNodePath(node);

                        // 选中节点
                        tree1.selectNode(node);

                        // 在主区域内打开链接
                        panel1.setIFrameUrl(node.href);

                        return false; // break
                    }

                });

            }


        });


    </script>
</body>
</html>
