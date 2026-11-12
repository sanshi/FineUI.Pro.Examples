<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_checkbox.aspx.cs" Inherits="FineUI.Pro.Examples.multilang.tree_checkbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" EnableCollapse="false"
            Title="<%$ Resources:树控件 %>" runat="server" EnableCheckBox="true">
            <Nodes>
                <f:TreeNode Text="<%$ Resources:中国 %>" Expanded="true">
                    <f:TreeNode Text="<%$ Resources:河南省 %>" Expanded="true" Checked="true">
                        <f:TreeNode Text="<%$ Resources:驻马店市 %>" NodeID="zhumadian">
                            <f:TreeNode Text="<%$ Resources:遂平县 %>" NodeID="suiping" Checked="true">
                            </f:TreeNode>
                            <f:TreeNode Text="<%$ Resources:西平县 %>" NodeID="xiping">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="<%$ Resources:漯河市 %>" NodeID="luohe" />
                    </f:TreeNode>
                    <f:TreeNode Text="<%$ Resources:安徽省 %>" Expanded="true" NodeID="anhui">
                        <f:TreeNode Text="<%$ Resources:合肥市 %>" NodeID="hefei">
                        </f:TreeNode>
                        <f:TreeNode Text="<%$ Resources:黄山市 %>" NodeID="huangshan">
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
        <br />
        <f:Button runat="server" ID="btnGetCheckedValues" Text="<%$ Resources:获取选中的复选框 %>" OnClick="btnGetCheckedValues_Click">
        </f:Button>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>从本地化资源生成界面文字，对照同一页面的中文和英文。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>切换界面语言</h3>
    <ul>
        <li>使用页面提供的中文、英文语言链接分别进入本页。<br />结果：<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>的标题、字段标签或列头、按钮文字按所选语言重新生成；此操作重新加载页面。</li>
        <li>对照中英文界面中的相同记录或节点。<br />结果：业务标识与数据含义保持，显示文字按当前语言翻译。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>_R()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：读取当前语言的资源文字，分别用于标题、字段、按钮或节点。</li>
        <li><code>语言参数</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：语言链接重新请求当前页面，由本端语言设置选择资源，不是仅替换一段可见文本。</li>
    </ul>
</section>
</template>
</body>
</html>
