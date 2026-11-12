<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox_round.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox_round" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" LabelAlign="Top" EnableCollapse="false"
            Title="简单表单" runat="server" LabelWidth="120px">
            <Items>
                <f:NumberBox Label="小数（两位精度，初始值：1.2367）" ID="NumberBox1" runat="server" Text="1.2367" Required="true" ShowRedStar="true" />
                <f:NumberBox Label="小数（两位精度，禁用四舍五入，初始值：1.2367）" ID="NumberBox2" runat="server" Text="1.2367" EnableRound="false" Required="true" ShowRedStar="true" />
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult"></f:Label>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对比数字输入框在相同精度下采用四舍五入和直接截断的结果。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-sort" aria-hidden="true"></i>比较两位小数处理</h3>
            <ul>
                <li>
                    对照两个字段的初始值 <code>1.2367</code>。<br />
                    结果：默认四舍五入显示 <code>1.24</code>，禁用四舍五入的字段显示 <code>1.23</code>。
                </li>
                <li>
                    分别在两个字段输入 <code>1.245</code>，然后移开焦点。<br />
                    结果：第一个显示 <code>1.25</code>，第二个截断为 <code>1.24</code>。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableRound</code>（<strong class="example-control-reference" data-example-control="<%= NumberBox2.ClientID %>" title="小数（两位精度，禁用四舍五入，初始值：1.2367）">小数（两位精度，禁用四舍五入，初始值：1.2367）</strong>）：默认开启四舍五入；<strong class="example-control-reference" data-example-control="<%= NumberBox2.ClientID %>" title="小数（两位精度，禁用四舍五入，初始值：1.2367）">第二个字段</strong>设为 <code>false</code>，直接截断超出精度的小数。</li>
                <li><code>DecimalPrecision</code>（<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>" title="小数（两位精度，初始值：1.2367）">小数（两位精度，初始值：1.2367）</strong>、<strong class="example-control-reference" data-example-control="<%= NumberBox2.ClientID %>" title="小数（两位精度，禁用四舍五入，初始值：1.2367）">小数（两位精度，禁用四舍五入，初始值：1.2367）</strong>）：初始为<code>2</code>，保留两位小数。</li>
            </ul>
        </section>
    </template>
</body>
</html>
