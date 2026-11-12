<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox_prefix.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox_prefix" %>

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
                <f:NumberBox Label="人民币" ID="NumberBox1" NoDecimal="true" NoNegative="true" Text="3000000" EnableCommas="true"
                    Required="true" ShowRedStar="true" runat="server" NumberPrefix="￥" />
                <f:NumberBox Label="美元" ID="NumberBox2" NoDecimal="true" NoNegative="true" Text="100000" EnableCommas="true"
                    Required="true" ShowRedStar="true" runat="server" NumberPrefix="$" />
                <f:NumberBox Label="百分比" ID="NumberBox3" NoNegative="true" Text="42.567" DecimalPrecision="2"
                    Required="true" ShowRedStar="true" runat="server" NumberSuffix="%" />
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult"></f:Label>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示在数值前后显示货币符号或百分号，并在重新输入后保留格式。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>输入后保留符号</h3>
            <ul>
                <li>
                    在“人民币”中输入 999，然后移开焦点。<br />
                    结果：显示为 ￥999；初始长数字按千分位分组。
                </li>
                <li>
                    在“百分比”中输入 10.5，然后移开焦点。<br />
                    结果：显示为 10.5%，符号不需要用户手动输入。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>NumberPrefix</code>：人民币和美元字段分别使用 ￥、$。</li>
                <li><code>NumberSuffix</code>：百分比字段使用 %，只控制显示单位，不自动除以 100。</li>
            </ul>
        </section>
    </template>
</body>
</html>
