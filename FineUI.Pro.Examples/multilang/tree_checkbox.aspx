<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_checkbox.aspx.cs" Inherits="FineUI.Pro.Examples.multilang.tree_checkbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" EnableCollapse="false"
            Title="<%$ Resources:树控件 %>" runat="server" EnableCheckBox="true">
            <Nodes>
                <f:TreeNode Text="<%$ Resources:中国 %>" Expanded="true">
                    <f:TreeNode Text="<%$ Resources:河南省 %>" Expanded="true" Checked="true">
                        <f:TreeNode Text="<%$ Resources:驻马店市 %>" NodeID="zhumadian">
                            <f:TreeNode Text="<%$ Resources:遂平县 %>" NodeID="suiping" Checked="true">
                            </f:TreeNode>
                            <f:TreeNode Text="<%$ Resources:西平县 %>" NodeID="xiping">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="<%$ Resources:漯河市 %>" NodeID="luohe" />
                    </f:TreeNode>
                    <f:TreeNode Text="<%$ Resources:安徽省 %>" Expanded="true" NodeID="anhui">
                        <f:TreeNode Text="<%$ Resources:合肥市 %>" NodeID="hefei">
                        </f:TreeNode>
                        <f:TreeNode Text="<%$ Resources:黄山市 %>" NodeID="huangshan">
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
        <br />
        <f:Button runat="server" ID="btnGetCheckedValues" Text="<%$ Resources:获取选中的复选框 %>" OnClick="btnGetCheckedValues_Click">
        </f:Button>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
    </form>
</body>
</html>
