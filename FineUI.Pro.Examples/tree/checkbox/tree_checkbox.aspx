<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_checkbox.aspx.cs" Inherits="FineUI.Pro.Examples.tree.checkbox.tree_checkbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" EnableCollapse="false"
            Title="树控件" runat="server" EnableCheckBox="true">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省" Expanded="true" Checked="true">
                        <f:TreeNode Text="驻马店市" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" NodeID="suiping" Checked="true">
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
    <p>演示树节点的复选框勾选、通过按钮设置勾选项以及读取当前勾选集合。</p>
    <h3><i class="f-iconfont f-iconfont-check-box" aria-hidden="true"></i>勾选并读取节点</h3>
    <ol>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>勾选<code>驻马店市</code>与<code>漯河市</code>前的复选框。<br />结果：两项可以同时勾选；复选框勾选与点击节点文字产生的选择高亮相互独立。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnGetCheckedValues").ClientID %>' title="获取选中的复选框">获取选中的复选框</strong>。<br />结果：读取当前勾选集合并显示节点名称及标识；没有勾选时显示空选择提示。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableCheckBox</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：设为<code>true</code>，为树节点显示复选框。</li>
        <li><code>GetCheckedNodes()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：读取本页当前勾选的节点集合，不把文字高亮选择当作复选框状态。</li>
    </ul>
</section>
</template>
</body>
</html>
