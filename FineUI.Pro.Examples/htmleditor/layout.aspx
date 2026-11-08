<%@ Page Language="C#" ClientIDMode="Static" ValidateRequest="false" AutoEventWireup="true" CodeBehind="layout.aspx.cs" Inherits="FineUI.Pro.Examples.htmleditor.layout" %>
<!DOCTYPE html>
<html><head runat="server"><title>多实例与容器布局</title></head><body>
<form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
    <f:SimpleForm ID="SimpleForm1" runat="server" IsFluid="true" BodyPadding="10" LabelAlign="Top" Title="多实例与容器布局">
        <Items>
            <f:HtmlEditor runat="server" ID="HtmlEditor1" Label="正文" Height="320" Text="&lt;p&gt;FineUI 富文本编辑器&lt;/p&gt;&lt;p&gt;选择文字，试试&lt;strong&gt;加粗&lt;/strong&gt;、&lt;em&gt;斜体&lt;/em&gt;和列表。&lt;/p&gt;" Readonly="false" ToolbarSet="Basic" />
            <f:HtmlEditor runat="server" ID="HtmlEditor2" Label="正文" Height="320" Text="&lt;p&gt;FineUI 富文本编辑器&lt;/p&gt;&lt;p&gt;选择文字，试试&lt;strong&gt;加粗&lt;/strong&gt;、&lt;em&gt;斜体&lt;/em&gt;和列表。&lt;/p&gt;" Readonly="false" ToolbarSet="Basic" />
            <f:TextArea runat="server" ID="TextArea1" Label="HTML 内容" Height="120" Text="&lt;p&gt;FineUI 富文本编辑器&lt;/p&gt;&lt;p&gt;选择文字，试试&lt;strong&gt;加粗&lt;/strong&gt;、&lt;em&gt;斜体&lt;/em&gt;和列表。&lt;/p&gt;" />
            <f:Button runat="server" ID="Button1" Text="获取编辑器内容" CssClass="marginr" OnClick="Button1_Click" />
            <f:Button runat="server" ID="Button2" Text="设置编辑器内容" OnClick="Button2_Click" />
        </Items>
    </f:SimpleForm>
    <p>两个编辑器拥有独立的内容、选区和撤销记录；改变浏览器宽度可观察工具栏换行。</p>
    <p>内置编辑器默认启用，使用 Text 读写 HTML；旧编辑器仍可显式设置 Editor。</p>
</form>
<script nonce="<%= PageManager.Instance.CspScriptsNonceValue %>">
F.ready(function () {
    var editorWindow = new F.Window({
        id: 'Window1', renderTo: document.body, title: '窗口与隐藏选项卡', hidden: true,
        width: 760, height: 460, layout: 'fit', resizable: true,
        items: [{ type: 'TabStrip', id: 'TabStrip1', items: [
            { type: 'Tab', id: 'Tab1', title: '第一份文档', layout: 'fit', items: [
                { type: 'HtmlEditor', id: 'HtmlEditor3', showLabel: false, value: '<p>窗口中的第一份文档</p>' }
            ] },
            { type: 'Tab', id: 'Tab2', title: '隐藏选项卡', layout: 'fit', items: [
                { type: 'HtmlEditor', id: 'HtmlEditor4', showLabel: false, value: '<p>切换选项卡后继续编辑</p>' }
            ] }
        ] }]
    });
    new F.Button({ id: 'btnOpenEditor', renderTo: document.body, text: '打开编辑窗口', handler: function () {
        editorWindow.show();
    } });
});
</script>
</body></html>
