<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox_triggertype.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox_triggertype" %>

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
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" LabelAlign="Right" EnableCollapse="false"
            Title="简单表单" runat="server" LabelWidth="100px">
            <Items>
                <f:NumberBox Label="Stack" ID="NumberBox1" NoDecimal="true" NoNegative="true" TriggerType="Stack" Text="100" runat="server" />
                <f:NumberBox Label="Tile" ID="NumberBox2" NoDecimal="true" NoNegative="true" TriggerType="Tile" Text="20" runat="server" />
                <f:NumberBox Label="None" ID="NumberBox3" NoDecimal="true" NoNegative="true" ShowTrigger="false" Text="20" runat="server" />
                <f:NumberBox Label="Separate" ID="NumberBox4" CssClass="text-align-center" NoDecimal="true" NoNegative="true" TriggerType="Separate" Width="200px" Text="1" runat="server" />
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示数字增减图标的叠放、平铺、分离和隐藏方式。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-sort" aria-hidden="true"></i>比较位置并增减数值</h3>
            <ul>
                <li>
                    对照 Stack、Tile、None、Separate 四个字段。<br />
                    结果：增减图标分别叠放、平铺、隐藏、分居两侧，数字输入规则保持一致。
                </li>
                <li>
                    在初始为 20 的 Tile 字段点击加号，再点击减号。<br />
                    结果：浏览器依次将数值改为 21、20；自定义图标仍调用相同增减动作，无需回发。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>TriggerType</code>：控制图标位置，本页对比 Stack、Tile、Separate。</li>
            </ul>
        </section>
    </template>
</body>
</html>
