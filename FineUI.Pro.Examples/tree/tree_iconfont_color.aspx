<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_iconfont_color.aspx.cs" Inherits="FineUI.Pro.Examples.tree.tree_iconfont_color" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>

        .tn-color-red .f-tree-folder {
            color: red;
        }

        .tn-color-purple .f-tree-folder {
            color: purple;
        }

        .tn-color-green .f-tree-folder {
            color: green;
        }

        .tn-color-blue .f-tree-folder {
            color: blue;
        }

        .tn-color-orange .f-tree-folder {
            color: orange;
        }


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" Title="树控件" EnableCollapse="false"
            runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省" Expanded="true">
                        <f:TreeNode Text="驻马店市" Expanded="true" IconFont="_Flag" CssClass="tn-color-red" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" IconFont="_Tag" CssClass="tn-color-purple" NodeID="suiping">
                            </f:TreeNode>
                            <f:TreeNode Text="西平县" IconFont="_Book" CssClass="tn-color-green" NodeID="xiping">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" CssClass="tn-color-blue" IconFont="_Bookmark" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" Expanded="true" CssClass="tn-color-orange" NodeID="anhui">
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
    <p>演示为不同树节点的字体图标设置不同颜色。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照节点图标颜色</h3>
    <ul>
        <li>展开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>，对照各节点前的彩色字体图标。<br />结果：同一棵树的节点可以使用不同颜色，颜色只作用于相应图标。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>IconFont</code>（<strong>树节点</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：指定节点使用的字体图标。</li>
        <li><code>IconFontColor</code>（<strong>树节点</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：设置当前节点图标颜色，不改变节点文字内容。</li>
    </ul>
</section>
</template>
</body>
</html>
