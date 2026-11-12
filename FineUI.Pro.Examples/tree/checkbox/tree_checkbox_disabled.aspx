<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_checkbox_disabled.aspx.cs" Inherits="FineUI.Pro.Examples.tree.checkbox.tree_checkbox_disabled" %>

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
                    <f:TreeNode Text="河南省（复选框禁用，节点不可选择）" Expanded="true" Checked="true" CheckBoxDisabled="true" Selectable="false">
                        <f:TreeNode Text="驻马店市（复选框禁用）" NodeID="zhumadian" Checked="true" CheckBoxDisabled="true">
                            <f:TreeNode Text="遂平县" NodeID="suiping" Checked="true">
                            </f:TreeNode>
                            <f:TreeNode Text="西平县" NodeID="xiping">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省（复选框禁用）" Expanded="true" NodeID="anhui" CheckBoxDisabled="true">
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
    <p>演示禁用指定节点的复选框，保留其它节点的正常展开与勾选。</p>
    <h3><i class="f-iconfont f-iconfont-check-box" aria-hidden="true"></i>对照可勾选范围</h3>
    <ul>
        <li>展开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>的目录，对照目录和叶子节点，尝试点击禁用的复选框。<br />结果：禁用的复选框不接受点击修改；初始勾选状态可以继续显示。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableCheckBox</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：树开启复选框，个别节点另外覆盖勾选能力。 本页使用<code>true</code>。</li>
        <li><code>CheckBoxDisabled</code>（<strong>树节点</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：指定节点设为 <code>true</code>，保留复选框显示但禁止用户修改勾选状态。</li>
    </ul>
</section>
</template>
</body>
</html>
