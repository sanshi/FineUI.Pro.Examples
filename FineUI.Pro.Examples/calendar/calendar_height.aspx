<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar_height.aspx.cs" Inherits="FineUI.Pro.Examples.calendar.calendar_height" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-calendar-day {
            text-align: center;
        }

        .f-calendar-table th {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" Margin="24px" runat="server" Title="面板" ShowHeader="false" ShowBorder="true" Layout="Fit" BodyPadding="10px" Width="800px" Height="600px">
            <Toolbars>
                <f:Toolbar runat="server" ToolbarAlign="Center" Position="Bottom">
                    <Items>
                        <f:Button runat="server" ID="Button1" OnClick="Button1_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Calendar runat="server" EnableDateSelectEvent="true" DateFormatString="yyyy/MM/dd"
                    OnDateSelect="Calendar1_DateSelect" ID="Calendar1" ShowTodayButton="false">
                </f:Calendar>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
