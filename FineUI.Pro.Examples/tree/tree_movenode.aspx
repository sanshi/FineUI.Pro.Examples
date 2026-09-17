<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_movenode.aspx.cs" Inherits="FineUI.Pro.Examples.tree.tree_movenode" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" Title="树控件（内联）" EnableCollapse="false"
            runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true" NodeID="china">
                    <f:TreeNode Text="河南省" Expanded="true" NodeID="henan">
                        <f:TreeNode Text="驻马店市" Expanded="true" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" Expanded="true" Leaf="false" NodeID="suiping">
                                <f:TreeNode Text="槐树乡" Leaf="false" NodeID="huaishu">
                                    <f:TreeNode Text="陈庄村" NodeID="chenzhuang">
                                    </f:TreeNode>
                                    <f:TreeNode Text="王老村" NodeID="wanglao">
                                    </f:TreeNode>
                                </f:TreeNode>
                                <f:TreeNode Text="嵖岈山乡" Leaf="false" NodeID="chayashan">
                                </f:TreeNode>
                                <f:TreeNode Text="阳丰乡" Leaf="false" NodeID="yangfeng">
                                </f:TreeNode>
                            </f:TreeNode>
                            <f:TreeNode Text="西平县" Leaf="false" NodeID="xiping">
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
                            <f:TreeNode Text="包公祠" NodeID="baogong">
                            </f:TreeNode>
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
        <br />
        <f:Button ID="Button1" CssClass="marginr" runat="server" Text="[槐树乡]移到[嵖岈山乡]的后面" ClickHandler="onButton1Click"></f:Button>
        <f:Button ID="Button2" CssClass="marginr" runat="server" Text="[包公祠]移到[金色池塘小区]的前面" ClickHandler="onButton2Click"></f:Button>
        <br />
        <br />
        <f:Button ID="Button3" CssClass="marginr" runat="server" Text="获取树控件数据" ClickHandler="onButton3Click"></f:Button>
        <br />
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>

    </form>
    <script>

        var treeClientID = '<%= Tree1.ClientID %>';
        var labResultClientID = '<%= labResult.ClientID %>';

        function onButton1Click(event) {
            F(treeClientID).moveNode('huaishu', 'chayashan', 'after');
        }

        function onButton2Click(event) {
            F(treeClientID).moveNode('baogong', 'golden', 'before');
        }


        function onButton3Click(event) {
            F(labResultClientID).setValue('<pre>' + JSON.stringify(F(treeClientID).rootNode, null, 4) + '<pre>');
        }

    </script>
</body>
</html>
