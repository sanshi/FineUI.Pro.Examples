<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_reload.aspx.cs" Inherits="FineUI.Pro.Examples.tree.tree_reload" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" EnableCollapse="false"
            ShowHeader="true" Title="树控件" AutoLeafIdentification="false" runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省" Expanded="true">
                        <f:TreeNode Text="驻马店市" NodeID="zhumadian" Leaf="true" />
                        <f:TreeNode Text="漯河" NodeID="luohe" Leaf="true" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" Expanded="true" NodeID="anhui">
                        <f:TreeNode Text="合肥市" NodeID="hefei">
                            <f:TreeNode Text="金色池塘小区" NodeID="golden" Leaf="true">
                            </f:TreeNode>
                            <f:TreeNode Text="中国科学技术大学" NodeID="ustc" Leaf="true">
                            </f:TreeNode>
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
        <br />
        <f:HiddenField ID="hfDataSource" Text="source1" runat="server"></f:HiddenField>
        <f:Button ID="btnGetSelectedNode" OnClick="btnGetSelectedNode_Click" CssClass="marginr"
            runat="server" Text="获取选中的节点">
        </f:Button>
        <f:Button ID="btnUpdateNode" OnClick="btnUpdateNode_Click"
            CssClass="marginr" Text="更新节点[驻马店市]" runat="server">
        </f:Button>
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
    </form>
</body>
</html>
