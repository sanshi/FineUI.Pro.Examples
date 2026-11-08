<%@ Page Language="C#" ClientIDMode="Static" ValidateRequest="false" AutoEventWireup="true" CodeBehind="full-toolbar.aspx.cs" Inherits="FineUI.Pro.Examples.htmleditor.FullToolbar" %>
<!DOCTYPE html>
<html><head runat="server"><title>完整工具栏</title></head><body>
<form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
    <f:SimpleForm ID="SimpleForm1" runat="server" IsFluid="true" BodyPadding="10" LabelAlign="Top" Title="完整工具栏">
        <Items>
            <f:HtmlEditor runat="server" ID="HtmlEditor1" Label="正文" Height="320" Text="&lt;p&gt;FineUI 富文本编辑器&lt;/p&gt;&lt;p&gt;选择文字，试试&lt;strong&gt;加粗&lt;/strong&gt;、&lt;em&gt;斜体&lt;/em&gt;和列表。&lt;/p&gt;" Readonly="false" ToolbarSet="Full" />

            <f:TextArea runat="server" ID="TextArea1" Label="HTML 内容" Height="120" Text="&lt;p&gt;FineUI 富文本编辑器&lt;/p&gt;&lt;p&gt;选择文字，试试&lt;strong&gt;加粗&lt;/strong&gt;、&lt;em&gt;斜体&lt;/em&gt;和列表。&lt;/p&gt;" />
            <f:Button runat="server" ID="Button1" Text="获取编辑器内容" CssClass="marginr" OnClick="Button1_Click" />
            <f:Button runat="server" ID="Button2" Text="设置编辑器内容" OnClick="Button2_Click" />
        </Items>
    </f:SimpleForm>
    <p>本例通过 ToolbarSet="Full" 启用完整工具栏，在基础编辑功能上增加字体、字号、文字颜色、背景色、对齐、引用和分隔线；HTML 源码按钮始终位于最后。点击颜色按钮展开色块面板，选择颜色后自动收起；“默认颜色”恢复主题文字色，“无高亮”移除文字背景。</p>
</form>
</body></html>
