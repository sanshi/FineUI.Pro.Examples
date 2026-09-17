<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_checkall.aspx.cs"
    Inherits="FineUI.Pro.Examples.tree.checkbox.tree_checkall" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" OnNodeCheck="Tree1_NodeCheck" EnableCollapse="false"
            ShowHeader="true" Title="树控件" runat="server" EnableCheckBox="true">
            <Nodes>
                <f:TreeNode Text="中国" EnableCheckEvent="true" Expanded="true">
                    <f:TreeNode EnableCheckEvent="true" Text="河南省" Expanded="true">
                        <f:TreeNode Text="驻马店市" EnableCheckEvent="true" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" EnableCheckEvent="true" NodeID="suiping">
                            </f:TreeNode>
                            <f:TreeNode Text="西平县" EnableCheckEvent="true" NodeID="xiping">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" EnableCheckEvent="true" NodeID="luohe" />
                    </f:TreeNode>
                    <f:TreeNode EnableCheckEvent="true" Text="安徽省" Expanded="true"
                        NodeID="anhui">
                        <f:TreeNode EnableCheckEvent="true" Text="合肥市" NodeID="hefei">
                        </f:TreeNode>
                        <f:TreeNode EnableCheckEvent="true" Text="黄山市" NodeID="huangshan">
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
        <br />
        <f:Button runat="server" ID="btnGetCheckedValues" Text="获取选中的复选框" OnClick="btnGetCheckedValues_Click">
        </f:Button>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
    </form>

</body>
</html>
