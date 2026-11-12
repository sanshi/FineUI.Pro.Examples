<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_checkall_clientscript.aspx.cs"
    Inherits="FineUI.Pro.Examples.tree.checkbox.tree_checkall_clientscript" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" EnableCollapse="false" ShowHeader="true"
            Title="树控件" runat="server" EnableCheckBox="true">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省" Expanded="true">
                        <f:TreeNode Text="驻马店市" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" NodeID="suiping">
                            </f:TreeNode>
                            <f:TreeNode Text="西平县" NodeID="xiping">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" Expanded="true"
                        NodeID="anhui">
                        <f:TreeNode Text="合肥市" NodeID="hefei">
                        </f:TreeNode>
                        <f:TreeNode Text="黄山市" NodeID="huangshan">
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
            <Listeners>
                <f:Listener Event="nodecheck" Handler="onTreeNodeCheck" />
            </Listeners>
        </f:Tree>
        <br />
        <f:Button runat="server" ID="btnGetCheckedValues" Text="获取选中的复选框" OnClick="btnGetCheckedValues_Click">
        </f:Button>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
    </form>
    <script>

        function onTreeNodeCheck(event, nodeId, checked) {
            var me = this;
            F.noEvent(function () {
                if (checked) {
                    me.checkNode(nodeId, {
                        deep: true, // 是否递归调用子节点
                    });
                } else {
                    me.uncheckNode(nodeId, {
                        deep: true, // 是否递归调用子节点
                    });
                }
            });
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示直接在浏览器中勾选、取消和反选全部树节点。</p>
    <h3><i class="f-iconfont f-iconfont-check-box" aria-hidden="true"></i>批量修改勾选集合</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnGetCheckedValues").ClientID %>' title="获取选中的复选框">获取选中的复选框</strong>。<br />结果：当前树的可勾选节点一起勾选；操作直接在浏览器执行。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableCheckBox</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：显示可操作的节点复选框。 本页使用<code>true</code>。</li>
    </ul>
</section>
</template>
</body>
</html>
