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
<template id="example-description">
<section aria-label="页面描述">
    <p>演示只替换指定节点的子树，并在两套子节点数据之间切换。</p>
    <h3><i class="f-iconfont f-iconfont-refresh" aria-hidden="true"></i>替换当前子树</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnUpdateNode").ClientID %>' title="更新节点[驻马店市]">更新节点[驻马店市]</strong>。<br />结果：当前驻马店节点的旧子树被替换为另一套子节点，并展开更新后的目录；树的其它分支继续保留。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnUpdateNode").ClientID %>' title="更新节点[驻马店市]">更新节点[驻马店市]</strong>。<br />结果：再次切换子树数据，不会把新旧两套子节点重复追加在一起。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>AutoLeafIdentification</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：设为<code>false</code>，保留目录的展开能力，允许原来没有子项的节点加载子树。</li>
    </ul>
</section>
</template>
</body>
</html>
