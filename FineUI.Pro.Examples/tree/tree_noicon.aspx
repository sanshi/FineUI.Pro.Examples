<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_noicon.aspx.cs" Inherits="FineUI.Pro.Examples.tree.tree_noicon" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" Title="树控件（隐藏节点图标）" EnableCollapse="false" EnableIcons="false" runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省" Expanded="true">
                        <f:TreeNode Text="驻马店市" Expanded="true" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" Icon="TagBlue" NodeID="suiping">
                            </f:TreeNode>
                            <f:TreeNode Text="西平县" Icon="TagBlue" NodeID="xiping">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" IconUrl="~/res/icon/tag_orange.png" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" Expanded="true" NodeID="anhui">
                        <f:TreeNode Expanded="true" Text="合肥市" NodeID="hefei">
                            <f:TreeNode Text="中国科学技术大学（链接）" NavigateUrl="http://www.ustc.edu.cn/" Target="_blank" ToolTip="点击跳转到科大主页" NodeID="ustc">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="黄山市" NodeID="huangshan">
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
        <br />
        <f:Button ID="btnGetSelectedNode" OnClick="btnGetSelectedNode_Click" CssClass="marginr" runat="server" Text="获取选中的节点">
        </f:Button>
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示隐藏树节点图标，同时保留层级展开和节点选择。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>隐藏图标后的树</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>'
                        title="树控件（隐藏节点图标）">树控件（隐藏节点图标）</strong>展开<code>河南省</code>并选择一个子节点。<br />结果：目录仍有展开图标，节点文字仍可选择，但节点自身的图片或字体图标不显示。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableIcons</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>'
                        title="树控件（隐藏节点图标）">树控件（隐藏节点图标）</strong>）：初始为<code>false</code>，只隐藏节点图标，不隐藏目录展开入口。</li>
            </ul>
        </section>
    </template>
</body>
</html>
