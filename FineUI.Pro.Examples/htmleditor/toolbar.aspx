<%@ Page Language="C#" ClientIDMode="Static" ValidateRequest="false" AutoEventWireup="true" CodeBehind="toolbar.aspx.cs" Inherits="FineUI.Pro.Examples.htmleditor.toolbar" %>
<!DOCTYPE html>
<html><head runat="server"><title>自定义工具栏</title><style>
    table.result.htmleditor-toolbar-reference {
        width: 100%;
        max-width: 800px;
    }

    .htmleditor-toolbar-reference caption {
        text-align: left;
        font-weight: bold;
        padding-bottom: 8px;
    }

    .htmleditor-toolbar-reference th[scope="row"] {
        white-space: nowrap;
        vertical-align: top;
    }

    .htmleditor-toolbar-reference td > span {
        display: inline-block;
        margin-inline-end: 12px;
    }
</style>
</head><body>
<form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
    <f:SimpleForm ID="SimpleForm1" runat="server" IsFluid="true" BodyPadding="10" LabelAlign="Top" Title="自定义工具栏">
        <Items>
            <f:HtmlEditor runat="server" ID="HtmlEditor1" Label="正文" Height="320" Text="&lt;p&gt;FineUI 富文本编辑器&lt;/p&gt;&lt;p&gt;选择文字，试试&lt;strong&gt;加粗&lt;/strong&gt;、&lt;em&gt;斜体&lt;/em&gt;和列表。&lt;/p&gt;" Readonly="false" ToolbarSet="Basic" />
            
            <f:TextArea runat="server" ID="TextArea1" Label="HTML 内容" Height="120" Text="&lt;p&gt;FineUI 富文本编辑器&lt;/p&gt;&lt;p&gt;选择文字，试试&lt;strong&gt;加粗&lt;/strong&gt;、&lt;em&gt;斜体&lt;/em&gt;和列表。&lt;/p&gt;" />
            <f:Button runat="server" ID="Button1" Text="获取编辑器内容" CssClass="marginr" OnClick="Button1_Click" />
            <f:Button runat="server" ID="Button2" Text="设置编辑器内容" OnClick="Button2_Click" />
        </Items>
    </f:SimpleForm>
    <p>通过 <code>Options</code> 中键名为 <code>toolbar</code> 的数组 选择按钮，本例的配置如下：</p>
    <p><code>["bold", "italic", "underline", "|", "bulletList", "link", "source"]</code></p>
    <p>显式配置会替换 <code>ToolbarSet</code> 预设，按钮按数组顺序显示；<code>"|"</code> 表示分隔线，需要源码按钮时将 <code>source</code> 放在最后。不设置此数组时使用 Basic 或 Full 预设。</p>
    <p>下表适用于内置编辑器 <code>Editor.Default</code>（纯 JS 配置值为 <code>default</code>）；旧第三方编辑器仍使用各自的参数。</p>
    <table class="result htmleditor-toolbar-reference">
        <caption>支持的工具栏项</caption>
        <thead>
            <tr><th scope="col">分组</th><th scope="col">配置值与功能</th></tr>
        </thead>
        <tbody>
            <tr><th scope="row">编辑操作</th><td><span><code>undo</code>（撤销）</span> <span><code>redo</code>（重做）</span> <span><code>clear</code>（清除格式）</span></td></tr>
            <tr><th scope="row">段落</th><td><span><code>heading</code>（正文／标题）</span> <span><code>quote</code>（引用）</span> <span><code>rule</code>（水平分隔线）</span></td></tr>
            <tr><th scope="row">文字样式</th><td><span><code>bold</code>（加粗）</span> <span><code>italic</code>（斜体）</span> <span><code>underline</code>（下划线）</span> <span><code>strike</code>（删除线）</span></td></tr>
            <tr><th scope="row">字体字号</th><td><span><code>fontFamily</code>（字体）</span> <span><code>fontSize</code>（字号）</span></td></tr>
            <tr><th scope="row">颜色</th><td><span><code>color</code>（文字颜色）</span> <span><code>background</code>（背景颜色）</span></td></tr>
            <tr><th scope="row">列表</th><td><span><code>orderedList</code>（有序列表）</span> <span><code>bulletList</code>（无序列表）</span></td></tr>
            <tr><th scope="row">对齐</th><td><span><code>left</code>（左对齐）</span> <span><code>center</code>（居中）</span> <span><code>right</code>（右对齐）</span></td></tr>
            <tr><th scope="row">链接</th><td><span><code>link</code>（插入／编辑链接）</span> <span><code>unlink</code>（取消链接）</span></td></tr>
            <tr><th scope="row">源码</th><td><span><code>source</code>（HTML 源码）</span></td></tr>
            <tr><th scope="row">分组</th><td><span><code>|</code>（分隔线）</span></td></tr>
        </tbody>
    </table>
</form>
</body></html>
