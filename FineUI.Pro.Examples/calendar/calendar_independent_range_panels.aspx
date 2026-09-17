<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar_independent_range_panels.aspx.cs" Inherits="FineUI.Pro.Examples.calendar.calendar_independent_range_panels" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <b>日期范围</b>
        <br />
        <f:Calendar runat="server" DateFormatString="yyyy/MM/dd" ID="Calendar1"
            DisplayType="DayRange" IndependentRangePanels="true">
        </f:Calendar>
        <br />
        <br />
        <br />
        <b>月份范围</b>
        <br />
        <f:Calendar runat="server" DateFormatString="yyyy/MM" ID="Calendar2"
            DisplayType="MonthRange" IndependentRangePanels="true">
        </f:Calendar>
        <br />
        <br />
        <br />
        <b>年份范围</b>
        <br />
        <f:Calendar runat="server" DateFormatString="yyyy" ID="Calendar3"
            DisplayType="YearRange" IndependentRangePanels="true">
        </f:Calendar>
        <br />
        <f:Button runat="server" ID="Button1" Text="获取选中的值" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" ShowLabel="false" runat="server">
        </f:Label>
        <br />
        <div style="margin-top:15px;color:#666;line-height:1.8;">
            说明：设置 IndependentRangePanels=true 开启“范围面板独立切换”。范围选择时左右两个面板可各自独立切换年份/月份，互不联动，便于快速定位跨度较大的起止日期区间。
        </div>
    </form>
</body>
</html>
