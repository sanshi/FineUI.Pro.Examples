<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datepicker_display_month.aspx.cs" Inherits="FineUI.Pro.Examples.datepicker.datepicker_display_month" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false" Title="简单表单" runat="server">
            <Items>
                <f:DatePicker runat="server" Required="true" DateFormatString="yyyy/MM" Label="开始年月" EmptyText="请选择开始年月" ID="DatePicker1" ShowRedStar="true"
                    DisplayType="Month" ShowTodayButton="false">
                </f:DatePicker>
                <f:DatePicker ID="DatePicker2" Required="true" Readonly="false" CompareControl="DatePicker1" DateFormatString="yyyy/MM"
                    CompareOperator="GreaterThan" CompareMessage="结束年月应该大于开始年月" Label="结束年月" runat="server" ShowRedStar="true" DisplayType="Month"
                    ShowTodayButton="false">
                </f:DatePicker>
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" ShowLabel="false" runat="server">
        </f:Label>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示通过输入框弹出的面板只选择年月。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>选择年月</h3>
            <ol>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>" title="开始年月">开始年月</strong>字段右侧的下拉图标。<br />
                    结果：显示本页年月面板；输入框当前值仍可对照查看。
                </li>
                <li>
                    在面板中选择下个月。<br />
                    结果：所选值回填输入框。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DateFormatString</code>（<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>"
                        title="开始年月">开始年月</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker2.ClientID %>"
                        title="结束年月">结束年月</strong>）：初始为<code>yyyy/MM</code>，控制选中值的文字格式。</li>
                <li><code>DisplayType</code>（<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>"
                        title="开始年月">开始年月</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker2.ClientID %>"
                        title="结束年月">结束年月</strong>）：本页采用年月面板，一次选择一个值。</li>
            </ul>
        </section>
    </template>
</body>
</html>
