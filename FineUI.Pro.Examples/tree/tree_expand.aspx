<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_expand.aspx.cs" Inherits="FineUI.Pro.Examples.tree.tree_expand" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" OnNodeExpand="Tree1_NodeExpand"
            OnNodeCollapse="Tree1_NodeCollapse" Title="树控件"  EnableCollapse="false"
            runat="server">
            <Nodes>
                <f:TreeNode Text="中国" EnableExpandEvent="true" EnableCollapseEvent="true" Expanded="true">
                    <f:TreeNode Text="河南省" EnableExpandEvent="true" EnableCollapseEvent="true" Expanded="true">
                        <f:TreeNode Text="驻马店市" EnableExpandEvent="true" EnableCollapseEvent="true" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" EnableExpandEvent="true" EnableCollapseEvent="true" Leaf="false" NodeID="suiping">
                                <f:TreeNode Text="槐树乡" EnableExpandEvent="true" EnableCollapseEvent="true" Leaf="false" NodeID="huaishu">
                                    <f:TreeNode Text="陈庄村" NodeID="chenzhuang">
                                    </f:TreeNode>
                                </f:TreeNode>
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" EnableExpandEvent="true" EnableCollapseEvent="true" Expanded="true" NodeID="anhui">
                        <f:TreeNode Text="合肥市" EnableExpandEvent="true" EnableCollapseEvent="true" Expanded="true" NodeID="hefei">
                            <f:TreeNode Text="金色池塘小区" NodeID="golden">
                            </f:TreeNode>
                            <f:TreeNode Text="中国科学技术大学" NodeID="ustc">
                            </f:TreeNode>
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
        <br />
        <f:Label runat="server" ID="labResult"></f:Label>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示分别处理树节点展开和折叠事件，读取对应节点信息。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>展开与折叠回发</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>折叠<code>驻马店市</code>，再重新展开。<br />结果：两次操作分别回发，后台在结果标签显示折叠或展开的节点名称及标识。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>OnNodeExpand</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：展开目录时处理当前节点。</li>
        <li><code>OnNodeCollapse</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：折叠目录时处理当前节点。</li>
    </ul>
</section>
</template>
</body>
</html>
