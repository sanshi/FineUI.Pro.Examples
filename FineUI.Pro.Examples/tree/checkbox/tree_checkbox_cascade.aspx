<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_checkbox_cascade.aspx.cs" Inherits="FineUI.Pro.Examples.tree.checkbox.tree_checkbox_cascade" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" EnableCollapse="false" Title="树控件" runat="server" EnableCheckBox="true" CascadeCheck="true">
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
        <f:Button runat="server" ID="btnGetCheckedValues" Text="获取选中的复选框" OnClick="btnGetCheckedValues_Click">
        </f:Button>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示父子节点级联勾选，并切换为各节点独立勾选。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check-box" aria-hidden="true"></i>核对级联勾选</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>'
                        title="树控件">树控件</strong>勾选或取消<code>河南省</code>。<br />结果：启用级联时，可勾选子孙节点跟随父节点，父节点状态也随子节点变化。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CascadeCheck</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>'
                        title="树控件">树控件</strong>）：初始为<code>true</code>，启用父子级联勾选，不等同于节点的文字高亮选择。</li>
            </ul>
        </section>
    </template>
</body>
</html>
