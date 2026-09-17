<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_id_specialchar.aspx.cs" Inherits="FineUI.Pro.Examples.tree.tree_id_specialchar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" Title="树控件" EnableCollapse="false"
            runat="server" EnableMultiSelect="true">
            <Nodes>
                <f:TreeNode Text="中国 .$#@!^&*&quot;'" Expanded="true" NodeID="中国 .$#@!^&*&quot;'">
                    <f:TreeNode Text="河南省 .$#@!^&*&quot;'" Expanded="true" NodeID="河南省 .$#@!^&*&quot;'">
                        <f:TreeNode Text="驻马店市 .$#@!^&*&quot;'" NodeID="驻马店市 .$#@!^&*&quot;'">
                            <f:TreeNode Text="遂平县 .$#@!^&*&quot;'" Leaf="false" NodeID="遂平县 .$#@!^&*&quot;'">
                                <f:TreeNode Text="槐树乡 .$#@!^&*&quot;'" Leaf="false" NodeID="槐树乡 .$#@!^&*&quot;'">
                                    <f:TreeNode Text="陈庄村 .$#@!^&*&quot;'" NodeID="陈庄村 .$#@!^&*&quot;'">
                                    </f:TreeNode>
                                </f:TreeNode>
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市 .$#@!^&*&quot;'" NodeID="漯河市 .$#@!^&*&quot;'" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省 .$#@!^&*&quot;'" Expanded="true" NodeID="安徽省 .$#@!^&*&quot;'">
                        <f:TreeNode Text="合肥市 .$#@!^&*&quot;'" Expanded="true" NodeID="合肥市 .$#@!^&*&quot;'">
                            <f:TreeNode Text="金色池塘小区 .$#@!^&*&quot;'" NodeID="金色池塘小区 .$#@!^&*&quot;'">
                            </f:TreeNode>
                            <f:TreeNode Text="中国科学技术大学 .$#@!^&*&quot;'" NodeID="中国科学技术大学 .$#@!^&*&quot;'">
                            </f:TreeNode>
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
        <br />
        <br />
        <f:Button ID="btnGetSelectedValues" OnClick="btnGetSelectedValues_Click" CssClass="marginr"
            runat="server" Text="获取选中的节点列表">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：树节点的NodeID属性可以包含特殊字符，比如：.$#@!^&*\"'
    </form>
</body>
</html>
