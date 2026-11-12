<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_longlabel.aspx.cs" Inherits="FineUI.Pro.Examples.form.form_longlabel" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false"
            Title="简单表单" runat="server">
            <Items>
                <f:TextBox runat="server" Label="文本输入框（很长很长很长的标签）" ID="tbxUserName" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:TriggerBox ID="tbxMyBox1" ShowLabel="true" ShowRedStar="true" Required="true" Label="触发器输入框（很长很长很长的标签）" Readonly="false" TriggerIcon="Search" runat="server">
                </f:TriggerBox>
                <f:NumberBox Label="数字输入框（很长很长很长的标签）" ID="NumberBox5" runat="server" ShowRedStar="true" Required="true" />
                <f:DatePicker runat="server" DateFormatString="yyyy-MM-dd" Label="日期选择器（很长很长很长的标签）"
                    ID="DatePicker1" ShowRedStar="true" Required="true">
                </f:DatePicker>
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示较长字段标签在标签区域内换行，同时保持输入区域对齐。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>阅读长标签并填写</h3>
            <ul>
                <li>
                    对照文本、触发器、数字和日期字段的长标签。<br />
                    结果：标签在自身区域换行，输入区域保持独立；可以继续输入或选择日期。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Label</code>（<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="文本输入框（很长很长很长的标签）">文本输入框（很长很长很长的标签）</strong>、<strong class="example-control-reference" data-example-control="<%= tbxMyBox1.ClientID %>" title="触发器输入框（很长很长很长的标签）">触发器输入框（很长很长很长的标签）</strong>、<strong class="example-control-reference" data-example-control="<%= NumberBox5.ClientID %>" title="数字输入框（很长很长很长的标签）">数字输入框（很长很长很长的标签）</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>" title="日期选择器（很长很长很长的标签）">日期选择器（很长很长很长的标签）</strong>）：提供本例较长的字段名称。</li>
            </ul>
        </section>
    </template>
</body>
</html>
