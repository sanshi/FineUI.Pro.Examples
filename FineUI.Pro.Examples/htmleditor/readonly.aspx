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


</form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示内置富文本编辑器只读时的选择、复制和源码查看，以及恢复编辑。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>只读与恢复编辑</h3>
            <ol>
                <li>
                    在“正文”尝试输入或点击加粗等编辑命令，再查看源码。<br />
                    结果：初始为只读，正文及源码不能修改；仍可选择、复制和查看 HTML。
                </li>
                <li>
                    点击“切换只读”，在正文输入“补充说明”。<br />
                    结果：按钮回发后后台取消只读，正文和编辑命令恢复可用；再次点击恢复只读，保留当前内容。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>只读时允许选择、复制和查看源码；正文和源码均不可修改。可使用下方按钮切换。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Readonly</code>：本页初始为 true；后台反转 Readonly切换是否可编辑，保留正文。</li>
            </ul>
        </section>
    </template>
</body></html>
