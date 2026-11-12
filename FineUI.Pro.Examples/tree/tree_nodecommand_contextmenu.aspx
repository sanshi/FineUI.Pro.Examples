<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_nodecommand_contextmenu.aspx.cs"
    Inherits="FineUI.Pro.Examples.tree.tree_nodecommand_contextmenu" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true"  EnableCollapse="false" OnNodeCommand="Tree1_NodeCommand" ShowHeader="true"
            Title="树控件" runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省" Expanded="true">
                        <f:TreeNode Text="驻马店市（点击回发）" EnableClickEvent="true" Expanded="true" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县（点击回发）" EnableClickEvent="true" NodeID="suiping">
                            </f:TreeNode>
                            <f:TreeNode Text="西平县（点击回发，ClickHandler）" ClickHandler="onXipingClick" EnableClickEvent="true" NodeID="xiping">
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
        <f:Label ID="labResult" runat="server">
        </f:Label>
        <br />
        <br />

    </form>
    <script>

        function onXipingClick(event, nodeId) {
            return confirm('确定回发？');
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示右键点击树节点时触发节点命令，并在指定节点回发前要求确认。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>触发节点命令</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>右键遂平县，再右键西平县并先取消确认。<br />结果：遂平县的命令回发并更新结果文字；西平县取消确认后不执行后续命令，再次点击并确认才继续处理。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
        <li>在树节点上点击右键菜单时，会触发 <code>nodeclick</code> 事件。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>OnNodeCommand</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：初始为<code>Tree1_NodeCommand</code>，后台统一处理已开启点击事件的节点命令。</li>
        <li><code>EnableClickEvent</code>（<strong>树节点</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：只为需要回发的指定节点开启命令。</li>
        <li><code>ClickHandler</code>（<strong>树节点</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：西平县先执行确认处理，返回 <code>false</code> 时阻止后续回发。</li>
    </ul>
</section>
</template>
</body>
</html>
