<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_select.aspx.cs" Inherits="FineUI.Pro.Examples.tree.select.tree_select" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" EnableCollapse="false" ShowHeader="true" Title="树控件" runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省" Expanded="true">
                        <f:TreeNode Text="驻马店市" Expanded="true" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" NodeID="suiping">
                            </f:TreeNode>
                            <f:TreeNode Text="西平县" NodeID="xiping">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" Expanded="true" NodeID="anhui">
                        <f:TreeNode Text="合肥市" NodeID="hefei">
                        </f:TreeNode>
                        <f:TreeNode Text="黄山市" NodeID="huangshan">
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
        <br />
        <f:Button ID="btnGetSelectedNode" OnClick="btnGetSelectedNode_Click" CssClass="marginr"
            runat="server" Text="获取选中的节点">
        </f:Button>
        <f:Button ID="btnSelecthefei" OnClick="btnSelecthefei_Click" runat="server" Text="选中[合肥市]">
        </f:Button>
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
        <br />
        <br />
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示树节点单选，以及后台按钮选中指定节点并读取当前选择。</p>
    <h3><i class="f-iconfont f-iconfont-check" aria-hidden="true"></i>选择与读取单个节点</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSelecthefei").ClientID %>' title="选中[合肥市]">选中[合肥市]</strong>。<br />结果：后台把当前选择设为合肥市；其它节点不再保持单选高亮。</li>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>点击另一个节点文字。<br />结果：浏览器把单选高亮移到刚点击的节点。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnGetSelectedNode").ClientID %>' title="获取选中的节点">获取选中的节点</strong>。<br />结果：读取当前节点名称与标识，结果反映刚才的选择。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>SelectedNodeID</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：读取或指定唯一的当前选中节点。</li>
    </ul>
</section>
</template>
</body>
</html>
