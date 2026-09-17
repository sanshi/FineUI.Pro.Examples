<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_nodecommand.aspx.cs"
    Inherits="FineUI.Pro.Examples.tree.tree_nodecommand" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true"  EnableCollapse="false" OnNodeCommand="Tree1_NodeCommand" ShowHeader="true"
            Title="树控件" runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省" Expanded="true">
                        <f:TreeNode Text="驻马店市（点击回发）" EnableClickEvent="true" Expanded="true" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县（点击回发）" EnableClickEvent="true" NodeID="suiping">
                            </f:TreeNode>
                            <f:TreeNode Text="西平县（点击回发，ClickHandler）" ClickHandler="onXipingClick" EnableClickEvent="true" NodeID="xiping">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" Expanded="true" NodeID="anhui">
                        <f:TreeNode Text="合肥市" NodeID="hefei">
                        </f:TreeNode>
                        <f:TreeNode Text="黄山市" NodeID="huangshan">
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
        <br />
        <br />
    </form>
    <script>

        function onXipingClick(event, nodeId) {
            return confirm('确定回发？');
        }

    </script>
</body>
</html>
