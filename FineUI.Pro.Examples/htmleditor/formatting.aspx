<%@ Page Language="C#" ClientIDMode="Static" ValidateRequest="false" AutoEventWireup="true" CodeBehind="formatting.aspx.cs" Inherits="FineUI.Pro.Examples.htmleditor.formatting" %>
<!DOCTYPE html>
<html><head runat="server"><title>文字排版与列表</title></head><body>
<form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
    <f:SimpleForm ID="SimpleForm1" runat="server" IsFluid="true" BodyPadding="10" LabelAlign="Top" Title="文字排版与列表">
        <Items>
            <f:HtmlEditor runat="server" ID="HtmlEditor1" Label="正文" Height="320" Text="&lt;p&gt;FineUI 富文本编辑器&lt;/p&gt;&lt;p&gt;选择文字，试试&lt;strong&gt;加粗&lt;/strong&gt;、&lt;em&gt;斜体&lt;/em&gt;和列表。&lt;/p&gt;" Readonly="false" ToolbarSet="Full" />
            
            <f:TextArea runat="server" ID="TextArea1" Label="HTML 内容" Height="120" Text="&lt;p&gt;FineUI 富文本编辑器&lt;/p&gt;&lt;p&gt;选择文字，试试&lt;strong&gt;加粗&lt;/strong&gt;、&lt;em&gt;斜体&lt;/em&gt;和列表。&lt;/p&gt;" />
            <f:Button runat="server" ID="Button1" Text="获取编辑器内容" CssClass="marginr" OnClick="Button1_Click" />
            <f:Button runat="server" ID="Button2" Text="设置编辑器内容" OnClick="Button2_Click" />
        </Items>
    </f:SimpleForm>
    <p>支持字体、字号、文字颜色、背景色、对齐、有序列表和无序列表；完整工具栏还支持标题、引用和分隔线。</p>
    <p>内置编辑器默认启用，使用 Text 读写 HTML；旧编辑器仍可显式设置 Editor。</p>
</form>
</body></html>
