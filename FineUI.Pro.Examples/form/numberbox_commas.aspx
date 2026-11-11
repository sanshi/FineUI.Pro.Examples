<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox_commas.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox_commas" %>

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
                <f:NumberBox Label="小数" ID="NumberBox1" runat="server" Text="-12345.6789" EnableCommas="true" Required="true" ShowRedStar="true"
                    DecimalPrecision="2" />
                <f:NumberBox Label="正整数" ID="NumberBox2" NoDecimal="true" NoNegative="true" Text="987654321" EnableCommas="true" ShowTrigger="false"
                    runat="server" />
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult"></f:Label>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示整数和小数的千分位显示，并对比输入框中的格式与提交时读取的数值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>格式化长数字</h3>
            <ul>
                <li>
                    在“小数”中输入“-12345.6789”，然后移开焦点。<br />
                    结果：按两位小数显示为 -12,345.68。
                </li>
                <li>
                    在“正整数”中输入“12345678”，然后移开焦点。<br />
                    结果：显示为 12,345,678，且不显示增减图标。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-send" aria-hidden="true"></i>读取当前值</h3>
            <ul>
                <li>
                    点击“提交表单”。<br />
                    结果：表单验证通过后回发，后台显示读取到的字段值，可与输入框中的逗号分组对照。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableCommas</code>：两个字段均设为 true，用逗号分隔千分位。</li>
                <li><code>NoDecimal</code>：正整数框设为 true，不接受小数。</li>
                <li><code>NoNegative</code>：正整数框设为 true，不接受负数。</li>
                <li><code>ShowTrigger</code>：正整数框设为 false，隐藏增减图标。</li>
                <li><code>ValidateForms</code>：提交前验证表单，小数字段不能为空。</li>
            </ul>
        </section>
    </template>
</body>
</html>
