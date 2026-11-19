<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datepicker_time_stack.aspx.cs" Inherits="FineUI.Pro.Examples.datepicker.datepicker_time_stack" %>

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
                <f:DatePicker runat="server" Required="true" DateFormatString="yyyy-MM-dd HH:mm:ss" Label="开始日期" EmptyText="请选择开始日期" ID="DatePicker1"
                    ShowRedStar="true" ShowTime="true" StackDateTime="true">
                </f:DatePicker>
                <f:DatePicker ID="DatePicker2" Required="true" Readonly="false" CompareControl="DatePicker1" DateFormatString="yyyy-MM-dd HH:mm:ss"
                    CompareOperator="GreaterThan" CompareMessage="结束日期应该大于开始日期" Label="结束日期" runat="server" ShowRedStar="true" ShowTime="true"
                    StackDateTime="true">
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
            <p>演示把日期网格与时间列上下排列，在同一面板选择日期和时间。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>在同一面板上下选择日期和时间</h3>
            <ol>
                <li>
                    展开日期时间面板，对照日期与时间区域，再分别调整日期、小时和分钟。<br />
                    结果：日期和时间上下排列在同一个面板中，无需在两种视图之间来回切换。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>StackDateTime</code>（<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>"
                        title="开始日期">开始日期</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker2.ClientID %>"
                        title="结束日期">结束日期</strong>）：初始为 <code>true</code>，日期网格与时间列上下排列，适合较窄的面板。</li>
            </ul>
        </section>
    </template>
</body>
</html>
