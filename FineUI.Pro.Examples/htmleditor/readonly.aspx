<%@ Page Language="C#" ClientIDMode="Static" ValidateRequest="false" AutoEventWireup="true" CodeBehind="readonly.aspx.cs" Inherits="FineUI.Pro.Examples.htmleditor.ReadonlyPage" %>
<!DOCTYPE html>
<html><head runat="server"><title>只读与恢复编辑</title></head><body>
<form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
    <f:SimpleForm ID="SimpleForm1" runat="server" IsFluid="true" BodyPadding="10" LabelAlign="Top" Title="只读与恢复编辑">
        <Items>
            <f:HtmlEditor runat="server" ID="HtmlEditor1" Label="正文" Height="320" Text="&lt;p&gt;FineUI 富文本编辑器&lt;/p&gt;&lt;p&gt;选择文字，试试&lt;strong&gt;加粗&lt;/strong&gt;、&lt;em&gt;斜体&lt;/em&gt;和列表。&lt;/p&gt;" Readonly="true" ToolbarSet="Basic" />
            
            <f:TextArea runat="server" ID="TextArea1" Label="HTML 内容" Height="120" Text="&lt;p&gt;FineUI 富文本编辑器&lt;/p&gt;&lt;p&gt;选择文字，试试&lt;strong&gt;加粗&lt;/strong&gt;、&lt;em&gt;斜体&lt;/em&gt;和列表。&lt;/p&gt;" />
            <f:Button runat="server" ID="Button1" Text="获取编辑器内容" CssClass="marginr" OnClick="Button1_Click" />
            <f:Button runat="server" ID="Button2" Text="设置编辑器内容" CssClass="marginr" OnClick="Button2_Click" />
            <f:Button runat="server" ID="btnToggle" Text="切换只读" OnClick="btnToggle_Click" />
        </Items>
    </f:SimpleForm>
    <p>只读时允许选择、复制和查看源码；正文和源码均不可修改。可使用下方按钮切换。</p>
</form>
</body></html>
