<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_lazyload_smart.aspx.cs" Inherits="FineUI.Pro.Examples.tree.tree_lazyload_smart" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" Width="300px" Height="400px" ShowHeader="false" EnableSingleClickExpand="true" OnNodeLazyLoad="Tree1_NodeLazyLoad"
            EnableCollapse="false" AutoLeafIdentification="false" runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true" IconFont="_Home">
                    <f:TreeNode Text="河南省" Expanded="true">
                        <f:TreeNode Text="驻马店市（延迟加载）" NodeID="zhumadian">
                        </f:TreeNode>
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
                <f:TreeNode Text="美国" Expanded="true" NodeID="mg" IconFont="_Plane" Icon="Cake">
                    <f:TreeNode Text="加利福尼亚州" NodeID="mg-jlfny" Leaf="true">
                    </f:TreeNode>
                    <f:TreeNode Text="马萨诸塞州" Expanded="true" NodeID="mg-mszs" Leaf="true">
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
        <br />
        <f:CheckBox ID="cbxMiniMode" ShowLabel="false" runat="server" Text="启用微型模式" OnCheckedChanged="cbxMiniMode_CheckedChanged">
        </f:CheckBox>
        <br />
        <br />
        <f:Button ID="btnGetSelectedNode" OnClick="btnGetSelectedNode_Click" CssClass="marginr" runat="server" Text="获取选中的节点">
        </f:Button>
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
    </form>
</body>
</html>
