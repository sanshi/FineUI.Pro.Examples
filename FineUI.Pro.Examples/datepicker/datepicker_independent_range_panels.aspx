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
                <f:DatePicker runat="server" Required="true" DateFormatString="yyyy/MM/dd" Label="日期范围" EmptyText="请选择日期范围"
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
        <br />
        <div style="margin-top:15px;color:#666;line-height:1.8;">
            说明：设置 IndependentRangePanels=true 开启“范围面板独立切换”。范围选择时左右两个面板可各自独立切换年份/月份，互不联动，便于快速定位跨度较大的起止日期区间。
        </div>
    </form>
</body>
</html>
