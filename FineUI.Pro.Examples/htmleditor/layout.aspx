<%@ Page Language="C#" ClientIDMode="Static" ValidateRequest="false" AutoEventWireup="true" CodeBehind="layout.aspx.cs" Inherits="FineUI.Pro.Examples.htmleditor.layout" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>多实例与容器布局</title>
    <style>
        /* 窗口已有外框，嵌入的编辑器去掉自身外框、圆角和聚焦光晕，避免出现重复边界。 */
        .htmleditor-in-tab .f-field-htmleditor-default,
        .htmleditor-in-tab .f-field-htmleditor-default:focus-within {
            border: 0;
            border-radius: 0;
            box-shadow: none;
        }
    </style>
</head>
<body>
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
    <br />
    <f:Button runat="server" ID="btnOpenEditor" Text="打开编辑窗口" ClickHandler="onOpenEditorClick" />
    <f:Window runat="server" ID="Window1" Title="窗口与隐藏选项卡" Hidden="true" Width="760" Height="460"
              Layout="Fit" EnableResize="true" BodyPadding="0">
        <Items>
            <f:TabStrip runat="server" ID="TabStrip1" ShowBorder="false">
                <Tabs>
                    <f:Tab runat="server" ID="Tab1" Title="第一份文档" Layout="Fit" BodyPadding="0">
                        <Items>
                            <f:HtmlEditor runat="server" ID="HtmlEditor3" CssClass="htmleditor-in-tab" ShowLabel="false" Margin="0" Text="&lt;p&gt;窗口中的第一份文档&lt;/p&gt;" />
                        </Items>
                    </f:Tab>
                    <f:Tab runat="server" ID="Tab2" Title="隐藏选项卡" Layout="Fit" BodyPadding="0">
                        <Items>
                            <f:HtmlEditor runat="server" ID="HtmlEditor4" CssClass="htmleditor-in-tab" ShowLabel="false" Margin="0" Text="&lt;p&gt;切换选项卡后继续编辑&lt;/p&gt;" />
                        </Items>
                    </f:Tab>
                </Tabs>
            </f:TabStrip>
        </Items>
    </f:Window>
    <p>两个编辑器拥有独立的内容、选区和撤销记录；改变浏览器宽度可观察工具栏换行。</p>
</form>
<script nonce="<%= PageManager.Instance.CspScriptsNonceValue %>">
        function getHtmlEditorContent() {
            return F.ui.HtmlEditor1.getValue();
        }

        function getSourceContent() {
            return F.ui.TextArea1.getValue();
        }

        function onOpenEditorClick() {
            F.ui.Window1.show();
        }
    </script>
</body></html>
