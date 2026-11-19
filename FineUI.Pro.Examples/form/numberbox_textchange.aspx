<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox_textchange.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox_textchange" %>

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
                <f:NumberBox Label="非负整数" ID="NumberBox3" runat="server" EmptyText="比如 99" OnTextChanged="NumberBox3_TextChanged" NoDecimal="true"
                    NoNegative="true" Required="true" ShowRedStar="true" />
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示手工输入或使用增减箭头后，通过数值变化事件读取最新值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-sort" aria-hidden="true"></i>增减并读取数值</h3>
            <ol>
                <li>
                    在<strong class="example-control-reference" data-example-control="<%= NumberBox3.ClientID %>" title="非负整数">非负整数</strong>中输入
                    <code>28</code>，按键盘向下方向键。<br />
                    结果：回发后，后台显示当前值 <code>27</code>，输入框也变为 <code>27</code>。
                </li>
                <li>
                    点击向上的增减图标。<br />
                    结果：回发后，后台显示当前值 <code>28</code>。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：手工输入数字，或者点击右侧上下箭头都会自动回发页面。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>OnTextChanged</code>（<strong class="example-control-reference" data-example-control="<%= NumberBox3.ClientID %>"
                        title="非负整数">非负整数</strong>）：变化事件回发后，后台读取最新值。</li>
            </ul>
        </section>
    </template>
</body>
</html>
