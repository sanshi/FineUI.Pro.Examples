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

<template id="example-description">
<section aria-label="页面描述">
    <p>演示用节点勾选事件递归全选或取消当前目录的子孙节点。</p>
    <h3><i class="f-iconfont f-iconfont-check-box" aria-hidden="true"></i>递归勾选当前分支</h3>
    <ol>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>勾选<code>河南省</code>。<br />结果：该目录及它的可勾选子孙节点一起勾选，其它省份不受影响。</li>
        <li>再次取消<code>河南省</code>的勾选。<br />结果：同一分支的可勾选子孙节点一起取消。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableCheckBox</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：显示树复选框。 本页使用<code>true</code>。</li>
        <li><code>nodecheck</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：客户端处理当前节点的勾选变化，并递归更新它的子孙节点。</li>
    </ul>
</section>
</template>
</body>
</html>
