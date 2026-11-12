<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datepicker_display_year_mindate.aspx.cs" Inherits="FineUI.Pro.Examples.datepicker.datepicker_display_year_mindate" %>

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
            <p>演示限制年份的可选上下限，超出范围的项目不能选中。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>检查可选范围</h3>
            <ul>
                <li>
                    切换到下限之前或上限之后的日期、年份或月份，尝试点击。<br />
                    结果：超出本页限制的项目不可选；可选择范围以内的项目。上下限按当前日期计算的页面，每天随日期变化。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>MinDate</code>：限定最早可选的日期、月份或年份；下限之前的项目不能选中。</li>
                <li><code>MaxDate</code>：限定最晚可选的日期、月份或年份；上限之后的项目不能选中。</li>
            </ul>
        </section>
    </template>
</body>
</html>
