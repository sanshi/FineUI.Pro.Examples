<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_multiselect_selectable_selected.aspx.cs"
    Inherits="FineUI.Pro.Examples.tree.select.tree_multiselect_selectable_selected" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>

        /* 设置不可选择节点的文本样式 */
        .f-tree-node-unselectable .f-tree-cell-icon.f-tree-folder,
        .f-tree-node-unselectable .f-tree-cell-text {
            opacity: 0.6;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" EnableCollapse="false" ShowHeader="true"
            EnableMultiSelect="true" Title="树控件" EnableSingleClickExpand="true"
            runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省" Selectable="false" Expanded="true" NodeID="henan">
                        <f:TreeNode Text="驻马店市" Expanded="true" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" NodeID="suiping">
                            </f:TreeNode>
                            <f:TreeNode Text="西平县" NodeID="xiping">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" Selectable="false" Expanded="true" NodeID="anhui">
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
<template id="example-description">
<section aria-label="页面描述">
    <p>演示不可由用户选择的节点仍可由后台设置为初始选中。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>区分展开与选择</h3>
    <ol>
        <li>初次打开时核对<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>的<code>河南省</code>。<br />结果：河南省已由后台设为选中，即使它不允许用户主动选择。</li>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>点击河南省，再点击可选的子节点。<br />结果：不可选目录不会因点击而新增选择，可选子节点正常加入当前选择集合。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
        <li>本示例默认禁用[河南省]和[安徽省]两个节点，默认选中[河南省]和[驻马店市]两个节点。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableMultiSelect</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：初始为<code>true</code>，允许当前选择包含多个节点。</li>
        <li><code>Selectable</code>（<strong>树节点</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：指定节点设为 <code>false</code>，禁止用户把它加入选择；不取消后台明确设置的初值。</li>
    </ul>
</section>
</template>
</body>
</html>
