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
<template id="example-description">
<section aria-label="页面描述">
    <p>演示按需加载子节点，并在同一棵树上切换微型导航外观。</p>
    <h3><i class="f-iconfont f-iconfont-list" aria-hidden="true"></i>逐层加载子节点</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树">树</strong>展开<code>驻马店市</code>，再展开新增的<code>遂平县</code>。<br />结果：每次展开尚未加载的目录都会回发，后台按节点 <code>ID</code> 添加县级或乡级子节点；已经加载的子树无需再次创建。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>切换微型模式</h3>
    <ul>
        <li>切换<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("cbxMiniMode").ClientID %>' title="启用微型模式">启用微型模式</strong>。<br />结果：树收起文字，保留图标；取消勾选后恢复完整节点文字。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>AutoLeafIdentification</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树">树</strong>）：设为 <code>false</code>，首次没有子节点的目录仍可以显示展开入口。 本页使用<code>false</code>。</li>
        <li><code>nodelazyload</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树">树</strong>）：展开尚未加载的节点时取得其 <code>ID</code>，并加载对应的子节点。</li>
        <li><code>MiniMode</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树">树</strong>）：由本页复选框切换，只改变导航外观，不清空节点。</li>
    </ul>
</section>
</template>
</body>
</html>
