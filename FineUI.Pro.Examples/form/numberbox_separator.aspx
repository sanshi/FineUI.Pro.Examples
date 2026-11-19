<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox_separator.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox_separator" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" LabelAlign="Top" EnableCollapse="false" Title="简单表单" runat="server" LabelWidth="120px">
            <Items>
                <f:NumberBox Label="小数" ID="NumberBox1" runat="server" Text="-1234567.809" EnableCommas="true" Required="true" ShowRedStar="true"
                    DecimalPrecision="2" CommaSeparator="'" />
                <f:NumberBox Label="正整数" ID="NumberBox2" NoDecimal="true" NoNegative="true" Text="987654321" EnableCommas="true" ShowTrigger="false"
                    runat="server" CommaSeparator=" " />
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult"></f:Label>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示用单引号或空格代替默认逗号，分隔较长数字的千分位。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>修改后重新分组</h3>
            <ul>
                <li>
                    在<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>" title="小数">小数</strong>中输入
                    <code>-123456.890</code>，然后移开焦点。<br />
                    结果：显示为 <code>-123</code>'<code>456.89</code>，按两位精度处理。
                </li>
                <li>
                    在<strong class="example-control-reference" data-example-control="<%= NumberBox2.ClientID %>" title="正整数">正整数</strong>中输入
                    <code>98765432</code>，然后移开焦点。<br />
                    结果：显示为 <code>98</code> <code>765</code> <code>432</code>，使用空格分隔千分位。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableCommas</code>（<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>"
                        title="小数">小数</strong>、<strong class="example-control-reference" data-example-control="<%= NumberBox2.ClientID %>"
                        title="正整数">正整数</strong>）：初始为 <code>true</code>，启用千分位格式。</li>
                <li><code>CommaSeparator</code>（<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>"
                        title="小数">小数</strong>）：小数字段设为单引号，整数字段设为空格。</li>
            </ul>
        </section>
    </template>
</body>
</html>
