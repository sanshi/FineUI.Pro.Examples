<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_nodehyperlink.aspx.cs" Inherits="FineUI.Pro.Examples.tree.tree_nodehyperlink" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

    <style>
        .lefttree {
            border-top-width: 0;
            border-left-width: 0;
            border-bottom-width: 0;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="RegionPanel1" runat="server" />
        <f:Panel ID="RegionPanel1" Margin="24px" Layout="Region" ShowHeader="true" Title="将树节点渲染为超链接（点击节点空白处也能打开链接）"
            ShowBorder="true" runat="server">
            <Items>
                <f:Tree ID="Tree1" RegionSplit="false" RegionPosition="Left" Width="200px" CssClass="lefttree"
                    ShowHeader="false" ShowBorder="true" EnableNodeHyperLink="true" runat="server">
                    <Nodes>
                        <f:TreeNode Text="基本用法" Expanded="true">
                            <f:TreeNode Text="你好 FineUI" Target="treemainframe" NavigateUrl="~/basic/hello.aspx">
                            </f:TreeNode>
                            <f:TreeNode Text="登录页面" Target="treemainframe" NavigateUrl="~/basic/login.aspx">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="表单控件" Expanded="true">
                            <f:TreeNode Text="简单按钮" Target="treemainframe" NavigateUrl="~/button/button.aspx">
                            </f:TreeNode>
                            <f:TreeNode Text="文本输入框" Target="treemainframe" NavigateUrl="~/form/textbox.aspx">
                            </f:TreeNode>
                        </f:TreeNode>
                    </Nodes>
                </f:Tree>
                <f:Panel ID="Region3" ShowHeader="false" EnableIFrame="true" ShowBorder="false"
                    IFrameName="treemainframe" RegionPosition="Center" runat="server">
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示把整行树节点作为超链接，点击文字外的空白区域也能导航。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-link" aria-hidden="true"></i>点击节点整行导航</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树">树</strong>中带链接节点的文字，再尝试点击同一行文字以外的空白位置。<br />结果：两处点击都按节点链接打开右侧 <code>iframe</code> 页面；展开图标仍用于展开目录。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableNodeHyperLink</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树">树</strong>）：初始为<code>true</code>，把链接应用到节点整行。</li>
        <li><code>NavigateUrl</code>（<strong>树节点</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树">树</strong>）：指定节点导航地址。</li>
        <li><code>Target</code>（<strong>树节点</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树">树</strong>）：指向本页 <code>iframe</code> 的名称，避免替换整个示例页面。</li>
    </ul>
</section>
</template>
</body>
</html>
