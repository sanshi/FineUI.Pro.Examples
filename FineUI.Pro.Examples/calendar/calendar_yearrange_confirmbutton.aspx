<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar_yearrange_confirmbutton.aspx.cs" Inherits="FineUI.Pro.Examples.calendar.calendar_yearrange_confirmbutton" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Calendar runat="server" EnableDateSelectEvent="true" DateFormatString="yyyy" DisplayType="YearRange"
            OnDateSelect="Calendar1_DateSelect" ID="Calendar1" ShowConfirmButton="true" ConfirmToSelect="true">
        </f:Calendar>
        <br />
        <br />
        <f:Button runat="server" ID="Button1" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult1" ShowLabel="false" runat="server">
        </f:Label>
    </form>
</body>
</html>
