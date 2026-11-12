<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_iconfont.aspx.cs" Inherits="FineUI.Pro.Examples.tree.tree_iconfont" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" Title="树控件" EnableCollapse="false"
            runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省" Expanded="true">
                        <f:TreeNode Text="驻马店市" Expanded="true" IconFont="_Flag" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" IconFont="_Tag" NodeID="suiping">
                            </f:TreeNode>
                            <f:TreeNode Text="西平县" IconFont="_Book" NodeID="xiping">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" IconFont="_Bookmark" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" Expanded="true" NodeID="anhui">
                        <f:TreeNode Expanded="true" Text="合肥市" NodeID="hefei">
                            <f:TreeNode Text="中国科学技术大学（链接）" NavigateUrl="http://www.ustc.edu.cn/" Target="_blank"
                                ToolTip="点击跳转到科大主页" NodeID="ustc">
                            </f:TreeNode>
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
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示用字体图标代替树节点的图片图标。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照字体图标</h3>
    <ul>
        <li>展开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>，对照目录与叶子节点的图标。<br />结果：节点按各自配置显示字体图标，不需要为每个图标提供图片文件。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>IconFont</code>（<strong>树节点</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：指定节点的字体图标，目录和叶子可分别配置。</li>
    </ul>
</section>
</template>
</body>
</html>
