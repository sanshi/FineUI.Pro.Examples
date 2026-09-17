<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar_dayrange_time_showsecond.aspx.cs" Inherits="FineUI.Pro.Examples.calendar.calendar_dayrange_time_showsecond" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Calendar runat="server" EnableDateSelectEvent="true" DateFormatString="yyyy/MM/dd HH:mm"
            OnDateSelect="Calendar1_DateSelect" ID="Calendar1" DisplayType="DayRange" ShowTime="true" ShowSecond="false">
        </f:Calendar>
        <br />
        <br />
        <f:Button runat="server" ID="Button1" CssClass="marginr" OnClick="Button1_Click">
        </f:Button>
        <f:Button runat="server" ID="Button2" Text="获取选中的值" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult1" ShowLabel="false" runat="server">
        </f:Label>
    </form>
</body>
</html>
