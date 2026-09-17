<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_multiselect_keepcurrentselection.aspx.cs"
    Inherits="FineUI.Pro.Examples.tree.select.tree_multiselect_keepcurrentselection" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" EnableCollapse="false" ShowHeader="true" EnableMultiSelect="true" KeepCurrentSelection="true" Title="树控件"
            runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省" Expanded="true">
                        <f:TreeNode Text="驻马店市" Expanded="true" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" NodeID="suiping">
                            </f:TreeNode>
                            <f:TreeNode Text="西平县" NodeID="xiping">
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
        <f:Button ID="btnGetSelectedValues" OnClick="btnGetSelectedValues_Click" CssClass="marginr"
            runat="server" Text="获取选中的节点列表">
        </f:Button>
        <f:Button ID="btnSelectOthers" OnClick="btnSelectOthers_Click" runat="server" Text="继续选中[合肥市]和[黄山市]">
        </f:Button>
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
        <br />
        <br />
    </form>
</body>
</html>
