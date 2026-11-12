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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示多份独立富文本和窗口<strong class="example-control-reference" data-example-control="<%= TabStrip1.ClientID %>" title="选项卡">选项卡</strong>中的编辑器，切换容器后继续编辑。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>多实例与隐藏容器</h3>
            <ol>
                <li>
                    只在第一个编辑器追加文字，再切到第二个编辑器。<br />
                    结果：第二份文档不随之变化；各实例内容和撤销记录独立。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnOpenEditor.ClientID %>" title="打开编辑窗口">打开编辑窗口</strong>，切到<strong class="example-control-reference" data-example-control="<%= Tab2.ClientID %>" title="隐藏选项卡">隐藏选项卡</strong>，编辑其中的正文。<br />
                    结果：先前隐藏的编辑器展开后正常排版；切回<strong class="example-control-reference" data-example-control="<%= Tab1.ClientID %>" title="第一份文档">第一份文档</strong>，再切回来，已编辑内容保留。
                </li>
                <li>
                    拖动窗口边缘或调整浏览器宽度。<br />
                    结果：编辑区域跟随容器可用空间重新排版；工具栏空间不足时换行。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>两个编辑器拥有独立的内容、选区和撤销记录；改变浏览器宽度可观察工具栏换行。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Layout</code>（<strong class="example-control-reference" data-example-control="<%= Window1.ClientID %>" title="窗口与隐藏选项卡">窗口与隐藏选项卡</strong>）：窗口及 <code>Tab</code> 使用 <code>Fit</code> 布局，编辑器随容器填充；隐藏页签显示后会重新计算可用尺寸。</li>
            </ul>
        </section>
    </template>
</body></html>
