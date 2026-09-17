<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_side.aspx.cs" Inherits="FineUI.Pro.Examples.window.window_side" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        body {
            background: url(../res/images/bg/small/3.jpg) !important;
			overflow: hidden;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />

        <f:Window ID="Window1" Hidden="true" PositionX="Left" Width="200px" PercentHeight="100%" IsModal="true" HideOnMaskClick="true"
            runat="server" AutoScroll="true" BodyPadding="10px" ShowHeader="false" EnableDefaultCorner="false">
            <Content>
                PositionX="Left" Width="200px" PercentHeight="100%" IsModal="true" HideOnMaskClick="true"
            </Content>
        </f:Window>

        <f:Window ID="Window2" Hidden="true" PositionX="Right" Width="200px" PercentHeight="100%" IsModal="true" HideOnMaskClick="true"
            runat="server" AutoScroll="true" BodyPadding="10px" ShowHeader="false" EnableDefaultCorner="false">
            <Content>
                PositionX="Right" Width="200px" PercentHeight="100%" IsModal="true" HideOnMaskClick="true"
            </Content>
        </f:Window>

        <f:Window ID="Window3" Hidden="true" PositionY="Top" Height="100px" PercentWidth="100%" IsModal="true" HideOnMaskClick="true"
            runat="server" AutoScroll="true" BodyPadding="10px" ShowHeader="false" EnableDefaultCorner="false">
            <Content>
                PositionY="Top" Height="100px" PercentWidth="100%" IsModal="true" HideOnMaskClick="true"
            </Content>
        </f:Window>


        <f:Window ID="Window4" Hidden="true" PositionY="Bottom" Height="100px" PercentWidth="100%" IsModal="true" HideOnMaskClick="true"
            runat="server" AutoScroll="true" BodyPadding="10px" ShowHeader="false" EnableDefaultCorner="false">
            <Content>
                PositionY="Bottom" Height="100px" PercentWidth="100%" IsModal="true" HideOnMaskClick="true"
            </Content>
        </f:Window>

        <f:Window ID="Window5" Width="300px" Layout="VBox" BoxConfigChildMargin="0 0 5px 0" PositionX="Center" PositionY="Center"
            runat="server" AutoScroll="true" BodyPadding="10px" ShowHeader="false" IsModal="false">
            <Items>
                <f:Button runat="server" ID="Button1" Text="左侧窗体" ClickHandler="onOpenWindow1Click"></f:Button>
                <f:Button runat="server" ID="Button2" Text="右侧窗体" ClickHandler="onOpenWindow2Click"></f:Button>
                <f:Button runat="server" ID="Button3" Text="顶部窗体" ClickHandler="onOpenWindow3Click"></f:Button>
                <f:Button runat="server" ID="Button4" Text="底部窗体" Margin="0" ClickHandler="onOpenWindow4Click"></f:Button>
            </Items>
        </f:Window>

    </form>
    <script>

        var window1ClientID = '<%= Window1.ClientID %>';
        var window2ClientID = '<%= Window2.ClientID %>';
        var window3ClientID = '<%= Window3.ClientID %>';
        var window4ClientID = '<%= Window4.ClientID %>';

        function onOpenWindow1Click(event) {
            F(window1ClientID).show();
        }

        function onOpenWindow2Click(event) {
            F(window2ClientID).show();
        }

        function onOpenWindow3Click(event) {
            F(window3ClientID).show();
        }

        function onOpenWindow4Click(event) {
            F(window4ClientID).show();
        }

    </script>
</body>
</html>
