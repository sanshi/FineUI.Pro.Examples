<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tinymce_two.aspx.cs" ValidateRequest="false"
    Inherits="FineUI.Pro.Examples.aspnet.tinymce_two" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="Form1" IsFluid="true" BodyPadding="10px" EnableCollapse="false"
            Title="添加文章" runat="server">
            <Items>
                <f:TextBox ID="tbxTitle" Label="文章标题" Required="true" runat="server">
                </f:TextBox>
                <f:HtmlEditor runat="server" Label="文章正文" ID="HtmlEditor1"
                    Editor="TinyMCE" BasePath="~/res/third-party/tinymce/" ToolbarSet="Full" Height="400px">
                </f:HtmlEditor>
                <f:HtmlEditor runat="server" Label="文章摘要" ID="HtmlEditor2"
                    Editor="TinyMCE" BasePath="~/res/third-party/tinymce/" ToolbarSet="Basic" Height="200px">
                </f:HtmlEditor>
            </Items>
            <Toolbars>
                <f:Toolbar runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="Button1" runat="server" ValidateForms="Form1"
                            Text="获取文章内容" OnClick="Button1_Click">
                        </f:Button>
                        <f:Button ID="Button2" runat="server" Text="更新文章摘要" OnClick="Button2_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>
        <f:Label runat="server" ID="labResult" EncodeText="false">
        </f:Label>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>同时使用两个 TinyMCE，把文章正文和摘要分开编辑，并由正文生成摘要。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>正文与摘要分别处理</h3>
    <ol>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor1").ClientID %>' title="文章正文">文章正文</strong>输入一段文字并设置加粗，点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="更新文章摘要">更新文章摘要</strong>。<br />结果：后台读取正文 HTML、移除标签并按本页长度限制生成摘要，只更新<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor2").ClientID %>' title="文章摘要">文章摘要</strong>。</li>
        <li>填写<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxTitle").ClientID %>' title="文章标题">文章标题</strong>后点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="获取文章内容">获取文章内容</strong>。<br />结果：后台分别读取标题、正文和摘要并显示结果，正文与摘要不会互相覆盖。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>ToolbarSet</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor1").ClientID %>' title="文章正文">文章正文</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor2").ClientID %>' title="文章摘要">文章摘要</strong>）：初始为 <code>Full</code>、<code>Basic</code>，选择编辑器的工具栏组合。</li>
        <li><code>Text</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor2").ClientID %>' title="文章摘要">文章摘要</strong>）：两份编辑器各自保存 HTML；摘要按钮只给摘要编辑器赋值。</li>
    </ul>
</section>
</template>
</body>
</html>
