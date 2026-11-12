<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox_trimend.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox_trimend" %>

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
                <f:NumberBox Label="小数（两位精度，初始值：1.20，TrimEndZero=true）" ID="NumberBox1" runat="server" Text="1.20" DecimalPrecision="2" TrimEndZero="true" Required="true" ShowRedStar="true" />
                <f:NumberBox Label="小数（两位精度，初始值：1.20，TrimEndZero=false）" ID="NumberBox2" runat="server" Text="1.20" DecimalPrecision="2" TrimEndZero="false" Required="true" ShowRedStar="true" />                
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult"></f:Label>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对比数字输入框格式化后去除或保留小数末尾零的显示。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>对比末尾零</h3>
            <ul>
                <li>
                    查看两个初始值为 <code>1.20</code> 的字段。<br />
                    结果：第一个显示 <code>1.2</code>，第二个保留 <code>1.20</code>。
                </li>
                <li>
                    在<strong class="example-control-reference" data-example-control="<%= NumberBox2.ClientID %>" title="小数（两位精度，初始值：1.20，TrimEndZero=false）">第二个字段</strong>输入 <code>2.4</code>，然后移开焦点。<br />
                    结果：补足两位小数显示 <code>2.40</code>。
                </li>
                <li>
                    在<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>" title="小数（两位精度，初始值：1.20，TrimEndZero=true）">第一个字段</strong>输入 <code>2.467</code>，然后移开焦点。<br />
                    结果：仍按两位精度处理，显示 <code>2.47</code>；去除末尾零不表示放宽精度。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>TrimEndZero</code>（<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>" title="小数（两位精度，初始值：1.20，TrimEndZero=true）">小数（两位精度，初始值：1.20，TrimEndZero=true）</strong>）：<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>" title="小数（两位精度，初始值：1.20，TrimEndZero=true）">第一个字段</strong>为 <code>true</code>，第二个为 <code>false</code>。</li>
                <li><code>DecimalPrecision</code>（<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>" title="小数（两位精度，初始值：1.20，TrimEndZero=true）">小数（两位精度，初始值：1.20，TrimEndZero=true）</strong>、<strong class="example-control-reference" data-example-control="<%= NumberBox2.ClientID %>" title="小数（两位精度，初始值：1.20，TrimEndZero=false）">小数（两位精度，初始值：1.20，TrimEndZero=false）</strong>）：初始为<code>2</code>，保留两位小数，先处理精度再决定是否去除末尾零。</li>
            </ul>
        </section>
    </template>
</body>
</html>
