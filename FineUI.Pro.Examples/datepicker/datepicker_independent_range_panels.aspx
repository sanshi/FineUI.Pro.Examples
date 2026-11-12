<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datepicker_independent_range_panels.aspx.cs" Inherits="FineUI.Pro.Examples.datepicker.datepicker_independent_range_panels" %>

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
                <f:DatePicker runat="server" Required="true" DateFormatString="yyyy-MM-dd" Label="日期范围" EmptyText="请选择日期范围"
                    ID="DatePicker1" ShowRedStar="true" DisplayType="DayRange" IndependentRangePanels="true">
                </f:DatePicker>
                <f:DatePicker runat="server" Required="true" DateFormatString="yyyy/MM" Label="月份范围" EmptyText="请选择月份范围"
                    ID="DatePicker2" ShowRedStar="true" DisplayType="MonthRange" IndependentRangePanels="true">
                </f:DatePicker>
                <f:DatePicker runat="server" Required="true" DateFormatString="yyyy" Label="年份范围" EmptyText="请选择年份范围"
                    ID="DatePicker3" ShowRedStar="true" DisplayType="YearRange" IndependentRangePanels="true">
                </f:DatePicker>
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单"
                    OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" EncodeText="false" ShowLabel="false" runat="server">
        </f:Label>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示日期、月份和年份三个范围选择器的左右面板独立切换，便于选择跨度较大的区间。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>分别切换左右面板</h3>
            <ol>
                <li>
                    分别在本页的范围面板中切换左侧月份或年份，再单独切换右侧。<br />
                    结果：只改变所操作面板的位置，另一侧不被强制带到相邻月份；可以定位跨度较大的区间。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <div> 说明：设置 <code>IndependentRangePanels</code>=<code>true</code> 开启“范围面板独立切换”。范围选择时左右两个面板可各自独立切换年份/月份，互不联动，便于快速定位跨度较大的起止日期区间。 </div>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>IndependentRangePanels</code>（<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>" title="日期范围">日期范围</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker2.ClientID %>" title="月份范围">月份范围</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker3.ClientID %>" title="年份范围">年份范围</strong>）：设为 <code>true</code>，左右面板分别切换年月，另一侧不被强制切到相邻月份。</li>
            </ul>
        </section>
    </template>
</body>
</html>
