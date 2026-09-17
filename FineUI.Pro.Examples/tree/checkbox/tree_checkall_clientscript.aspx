<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_checkall_clientscript.aspx.cs"
    Inherits="FineUI.Pro.Examples.tree.checkbox.tree_checkall_clientscript" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" EnableCollapse="false" ShowHeader="true"
            Title="树控件" runat="server" EnableCheckBox="true">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省" Expanded="true">
                        <f:TreeNode Text="驻马店市" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" NodeID="suiping">
                            </f:TreeNode>
                            <f:TreeNode Text="西平县" NodeID="xiping">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" Expanded="true"
                        NodeID="anhui">
                        <f:TreeNode Text="合肥市" NodeID="hefei">
                        </f:TreeNode>
                        <f:TreeNode Text="黄山市" NodeID="huangshan">
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
            <Listeners>
                <f:Listener Event="nodecheck" Handler="onTreeNodeCheck" />
            </Listeners>
        </f:Tree>
        <br />
        <f:Button runat="server" ID="btnGetCheckedValues" Text="获取选中的复选框" OnClick="btnGetCheckedValues_Click">
        </f:Button>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
    </form>
    <script>

        function onTreeNodeCheck(event, nodeId, checked) {
            var me = this;
            F.noEvent(function () {
                if (checked) {
                    me.checkNode(nodeId, {
                        deep: true, // 是否递归调用子节点
                    });
                } else {
                    me.uncheckNode(nodeId, {
                        deep: true, // 是否递归调用子节点
                    });
                }
            });
        }

    </script>
</body>
</html>
