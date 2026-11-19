<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_nodecommand.aspx.cs"
    Inherits="FineUI.Pro.Examples.tree.tree_nodecommand" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" EnableCollapse="false" OnNodeCommand="Tree1_NodeCommand" ShowHeader="true" Title="树控件" runat="server">
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
            <p>演示通过树节点点击触发自定义回发，并在指定节点回发前要求确认。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>指定节点先确认再处理</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>'
                        title="树控件">树控件</strong>点击遂平县。<br>结果：本页客户端把节点 <code>ID</code> 传给自定义事件，后台更新结果标签。</li>
                <li>点击西平县，先取消确认，再重新点击并确认。<br>结果：取消时不继续处理；确认后才执行本页对应节点的动作。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>OnNodeCommand</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：后台统一处理本页启用点击事件的节点，更新结果标签。
                </li>
                <li><code>EnableClickEvent</code>（<strong>树节点</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>'
                        title="树控件">树控件</strong>）：驻马店市、遂平县和西平县开启点击回发，普通目录不因此回发。</li>
                <li><code>ClickHandler</code>（<strong>树节点</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：西平县先显示确认，取消时阻止后续命令。</li>
            </ul>
        </section>
    </template>
</body>
</html>
