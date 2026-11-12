<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_textalign.aspx.cs" Inherits="FineUI.Pro.Examples.form.form_textalign" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .text-align-center input {
            text-align: center;
        }
        .text-align-right input {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" LabelWidth="180px" LabelAlign="Right" EnableCollapse="false" Title="简单表单" runat="server">
            <Items>
                <f:TextBox runat="server" Label="文本输入框" ID="TextBox1" Required="true" Text="文本居左" ShowRedStar="true">
                </f:TextBox>
                <f:TextBox runat="server" Label="文本输入框（居中）" ID="TextBox2" CssClass="text-align-center" Text="文本居中" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:TextBox runat="server" Label="文本输入框（居右）" ID="TextBox3" CssClass="text-align-right" Text="文本居右" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示通过 CSS 让字段中的输入文字居中对齐。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>输入时观察对齐方式</h3>
            <ol>
                <li>
                    在用户名和密码字段输入内容。<br />
                    结果：文字及密码掩码在输入区域中居中显示。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CssClass</code>（<strong class="example-control-reference" data-example-control="<%= TextBox2.ClientID %>" title="文本输入框（居中）">文本输入框（居中）</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox3.ClientID %>" title="文本输入框（居右）">文本输入框（居右）</strong>）：<code>text</code>-<code>align</code>-<code>center</code>、<code>text</code>-<code>align</code>-<code>right</code> 分别为输入元素设置居中和靠右样式。</li>
            </ul>
        </section>
    </template>
</body>
</html>
