<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_icon.aspx.cs" Inherits="FineUI.Pro.Examples.tree.tree_icon" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" Title="树控件" EnableCollapse="false"
            runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省" Expanded="true">
                        <f:TreeNode Text="驻马店市" Expanded="true" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" Icon="TagBlue" NodeID="suiping">
                            </f:TreeNode>
                            <f:TreeNode Text="西平县" Icon="TagBlue" NodeID="xiping">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" IconUrl="~/res/icon/tag_orange.png" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" Expanded="true" NodeID="anhui">
                        <f:TreeNode Expanded="true" Text="合肥市" NodeID="hefei">
                            <f:TreeNode Text="中国科学技术大学（链接）" NavigateUrl="http://www.ustc.edu.cn/" Target="_blank"
                                ToolTip="点击跳转到科大主页" NodeID="ustc">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="黄山市" NodeID="huangshan">
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
        <br />
        <f:Button ID="btnGetSelectedNode" OnClick="btnGetSelectedNode_Click" CssClass="marginr"
            runat="server" Text="获取选中的节点">
        </f:Button>
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
    </form>
</body>
</html>
