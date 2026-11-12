<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datepicker_display_year.aspx.cs" Inherits="FineUI.Pro.Examples.datepicker.datepicker_display_year" %>

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
                <f:DatePicker runat="server" Required="true" DateFormatString="yyyy" Label="开始年份" EmptyText="请选择开始年份"
                    ID="DatePicker1" ShowRedStar="true" DisplayType="Year" ShowTodayButton="false">
                </f:DatePicker>
                <f:DatePicker ID="DatePicker2" Required="true" Readonly="false" CompareControl="DatePicker1" DateFormatString="yyyy"
                    CompareOperator="GreaterThan" CompareMessage="结束年份应该大于开始年份" Label="结束年份"
                    runat="server" ShowRedStar="true" DisplayType="Year" ShowTodayButton="false">
                </f:DatePicker>
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单"
                    OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" ShowLabel="false" runat="server">
        </f:Label>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示通过输入框弹出的面板只选择年份。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>选择年份</h3>
            <ol>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>" title="开始年份">开始年份</strong>字段右侧的下拉图标。<br />
                    结果：显示本页年份面板；输入框当前值仍可对照查看。
                </li>
                <li>
                    在面板中选择明年。<br />
                    结果：所选值回填输入框。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DateFormatString</code>（<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>" title="开始年份">开始年份</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker2.ClientID %>" title="结束年份">结束年份</strong>）：控制选中值的文字格式；本页使用 <code>yyyy</code>。</li>
                <li><code>DisplayType</code>（<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>" title="开始年份">开始年份</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker2.ClientID %>" title="结束年份">结束年份</strong>）：本页采用年份面板，一次选择一个值。</li>
            </ul>
        </section>
    </template>
</body>
</html>
