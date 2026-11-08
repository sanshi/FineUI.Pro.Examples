<%@ Page Language="C#" ClientIDMode="Static" ValidateRequest="false" AutoEventWireup="true" CodeBehind="basic.aspx.cs" Inherits="FineUI.Pro.Examples.htmleditor.basic" %>
<!DOCTYPE html>
<html><head runat="server"><title>基础编辑与后台交互</title></head><body>
<form id="form1" runat="server">
    <f:PageManager ID="PageManager1" CspScripts="true" CspScriptsAllowNonce="true" CspScriptsAllowUnsafeInline="false" runat="server" />
    <f:SimpleForm ID="SimpleForm1" runat="server" IsFluid="true" BodyPadding="10" LabelAlign="Top" Title="基础编辑与后台交互">
        <Items>
            <f:HtmlEditor runat="server" ID="HtmlEditor1" Editor="Default" Label="正文" Height="320" Text="&lt;p&gt;FineUI 富文本编辑器&lt;/p&gt;&lt;p&gt;选择文字，试试&lt;strong&gt;加粗&lt;/strong&gt;、&lt;em&gt;斜体&lt;/em&gt;和列表。&lt;/p&gt;" Readonly="false" ToolbarSet="Basic" />
            
            <f:TextArea runat="server" ID="TextArea1" Label="HTML 内容" Height="120" Text="&lt;p&gt;FineUI 富文本编辑器&lt;/p&gt;&lt;p&gt;选择文字，试试&lt;strong&gt;加粗&lt;/strong&gt;、&lt;em&gt;斜体&lt;/em&gt;和列表。&lt;/p&gt;" />
            <f:Button runat="server" ID="Button1" Text="获取编辑器内容" CssClass="marginr" OnClick="Button1_Click" />
            <f:Button runat="server" ID="Button2" Text="设置编辑器内容" OnClick="Button2_Click" />
        </Items>
    </f:SimpleForm>
    <p>基础工具栏提供正文/标题、文字样式、列表、链接及常用编辑操作；编辑正文后可获取 HTML，也可以修改下方 HTML 后重新设置。</p>
</form>
</body></html>
