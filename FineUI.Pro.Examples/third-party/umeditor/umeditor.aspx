<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="umeditor.aspx.cs" ValidateRequest="false"
    Inherits="FineUI.Pro.Examples.aspnet.umeditor" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" LabelAlign="Top" EnableCollapse="false"
            Title="表单">
            <Items>
                <f:HtmlEditor runat="server" Label="文本编辑器" ID="HtmlEditor1" Readonly="true"
                    Editor="UMEditor" BasePath="~/res/third-party/umeditor/" ToolbarSet="Full" Height="350px">
                </f:HtmlEditor>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Button ID="Button2" runat="server" CssClass="marginr" Text="设置编辑器的值" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button1" runat="server" Text="获取编辑器的值" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button3" runat="server" CssClass="marginr" Text="设置编辑器只读" OnClick="Button3_Click">
        </f:Button>
        <f:Button ID="Button4" runat="server" Text="取消编辑器只读" OnClick="Button4_Click">
        </f:Button>
        <br />
        <br />
        注：

    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>接入 UMEditor，对照初始只读、客户端切换编辑状态及后台读写 HTML。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>从只读切换到编辑</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button4").ClientID %>' title="取消编辑器只读">取消编辑器只读</strong>。<br />结果：编辑器由只读变为可编辑。</li>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor1").ClientID %>' title="文本编辑器">文本编辑器</strong>输入 <code>编辑器测试</code>，点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="获取编辑器的值">获取编辑器的值</strong>。<br />结果：回发后后台读取当前 HTML，在通知中显示内容。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="设置编辑器的值">设置编辑器的值</strong>。<br />结果：后台预置 HTML 替换当前编辑内容。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>' title="设置编辑器只读">设置编辑器只读</strong>。<br />结果：内容仍可查看，但不能继续键入修改。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
            <li>默认编辑器处于只读状态。</li>
            <li>本示例不支持文件上传，请根据UEditor官网文档自行配置。</li>
        </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Editor</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor1").ClientID %>' title="文本编辑器">文本编辑器</strong>）：初始为 <code>UMEditor</code>，选择本页使用的第三方富文本编辑器。</li>
        <li><code>BasePath</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor1").ClientID %>' title="文本编辑器">文本编辑器</strong>）：初始为 <code>~/res/third-party/umeditor/</code>，指定编辑器脚本、皮肤等文件的基础路径。</li>
        <li><code>ReadOnly</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor1").ClientID %>' title="文本编辑器">文本编辑器</strong>）：初始为 <code>true</code>，控制用户能否编辑内容；切换为可编辑后才接受输入。</li>
    </ul>
</section>
</template>
</body>
</html>
