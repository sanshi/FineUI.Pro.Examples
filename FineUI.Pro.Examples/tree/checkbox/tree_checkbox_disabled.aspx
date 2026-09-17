<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_checkbox_disabled.aspx.cs" Inherits="FineUI.Pro.Examples.tree.checkbox.tree_checkbox_disabled" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" EnableCollapse="false"
            Title="树控件" runat="server" EnableCheckBox="true">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省（复选框禁用，节点不可选择）" Expanded="true" Checked="true" CheckBoxDisabled="true" Selectable="false">
                        <f:TreeNode Text="驻马店市（复选框禁用）" NodeID="zhumadian" Checked="true" CheckBoxDisabled="true">
                            <f:TreeNode Text="遂平县" NodeID="suiping" Checked="true">
                            </f:TreeNode>
                            <f:TreeNode Text="西平县" NodeID="xiping">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省（复选框禁用）" Expanded="true" NodeID="anhui" CheckBoxDisabled="true">
                        <f:TreeNode Text="合肥市" NodeID="hefei">
                        </f:TreeNode>
                        <f:TreeNode Text="黄山市" NodeID="huangshan">
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
