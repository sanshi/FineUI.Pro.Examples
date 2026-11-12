<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_id_specialchar.aspx.cs" Inherits="FineUI.Pro.Examples.tree.tree_id_specialchar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" Title="树控件" EnableCollapse="false"
            runat="server" EnableMultiSelect="true">
            <Nodes>
                <f:TreeNode Text="中国 .$#@!^&*&quot;'" Expanded="true" NodeID="中国 .$#@!^&*&quot;'">
                    <f:TreeNode Text="河南省 .$#@!^&*&quot;'" Expanded="true" NodeID="河南省 .$#@!^&*&quot;'">
                        <f:TreeNode Text="驻马店市 .$#@!^&*&quot;'" NodeID="驻马店市 .$#@!^&*&quot;'">
                            <f:TreeNode Text="遂平县 .$#@!^&*&quot;'" Leaf="false" NodeID="遂平县 .$#@!^&*&quot;'">
                                <f:TreeNode Text="槐树乡 .$#@!^&*&quot;'" Leaf="false" NodeID="槐树乡 .$#@!^&*&quot;'">
                                    <f:TreeNode Text="陈庄村 .$#@!^&*&quot;'" NodeID="陈庄村 .$#@!^&*&quot;'">
                                    </f:TreeNode>
                                </f:TreeNode>
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市 .$#@!^&*&quot;'" NodeID="漯河市 .$#@!^&*&quot;'" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省 .$#@!^&*&quot;'" Expanded="true" NodeID="安徽省 .$#@!^&*&quot;'">
                        <f:TreeNode Text="合肥市 .$#@!^&*&quot;'" Expanded="true" NodeID="合肥市 .$#@!^&*&quot;'">
                            <f:TreeNode Text="金色池塘小区 .$#@!^&*&quot;'" NodeID="金色池塘小区 .$#@!^&*&quot;'">
                            </f:TreeNode>
                            <f:TreeNode Text="中国科学技术大学 .$#@!^&*&quot;'" NodeID="中国科学技术大学 .$#@!^&*&quot;'">
                            </f:TreeNode>
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
        <br />
        <br />
        <f:Button ID="btnGetSelectedValues" OnClick="btnGetSelectedValues_Click" CssClass="marginr"
            runat="server" Text="获取选中的节点列表">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />

    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示树节点标识包含中文、空格和特殊字符时，仍可正常选择和读取。</p>
    <h3><i class="f-iconfont f-iconfont-check" aria-hidden="true"></i>读取特殊标识</h3>
    <ol>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>选择名称包含中文及符号的节点。<br />结果：节点正常高亮，特殊字符不会被当成选择器语法拆开。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnGetSelectedValues").ClientID %>' title="获取选中的节点列表">获取选中的节点列表</strong>。<br />结果：后台读取原始节点标识，在结果区域显示对应节点集合。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
        <li>树节点的<code>NodeID</code>属性可以包含特殊字符，比如：.$#&#64;!^&*\"'</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>NodeID</code>（<strong>树节点</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：本页保留中文、空格及 .$#@!^&* 等字符作为完整标识。</li>
        <li><code>EnableMultiSelect</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：允许选择多个节点，再一次读取当前集合。 本页使用<code>true</code>。</li>
    </ul>
</section>
</template>
</body>
</html>
