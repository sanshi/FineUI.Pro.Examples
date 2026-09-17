<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_position.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.window.window_position" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigChildMargin="0 0 5px 0" BodyPadding="10px" runat="server">
            <Items>
                <f:Button runat="server" ID="Button1" Text="左侧窗体" ClickHandler="onOpenWindow1Click"></f:Button>
                <f:Button runat="server" ID="Button2" Text="右侧窗体" ClickHandler="onOpenWindow2Click"></f:Button>
                <f:Button runat="server" ID="Button3" Text="顶部窗体" ClickHandler="onOpenWindow3Click"></f:Button>
                <f:Button runat="server" ID="Button4" Text="底部窗体" ClickHandler="onOpenWindow4Click"></f:Button>
                <f:Button runat="server" ID="Button5" Text="居中窗体" ClickHandler="onOpenWindow5Click"></f:Button>
            </Items>
        </f:Panel>
        <f:Window runat="server" ID="Window1" ShowHeader="false" Hidden="true"
            IsModal="true" HideOnMaskClick="true" BodyPadding="10px"
            Width="150px" EnableDefaultCorner="false" PositionX="Left">
            <Items>
                <f:ContentPanel runat="server" ShowBorder="false" ShowHeader="false">
                    <p>
                        <a href="http://baike.baidu.com/view/3645.htm" target="_blank"><b>比尔·盖茨</b></a>
                    </p>
                    <p>
                        比尔·盖茨（Bill Gates），全名威廉·亨利·盖茨三世，简称比尔或盖茨。1975年与好友保罗·艾伦一起创办了微软公司，比尔盖茨担任微软公司董事长、CEO和首席软件设计师。
                    </p>
                </f:ContentPanel>
            </Items>
        </f:Window>
        <f:Window runat="server" ID="Window2" ShowHeader="false" Hidden="true"
            IsModal="true" HideOnMaskClick="true" BodyPadding="10px"
            Width="150px" EnableDefaultCorner="false" PositionX="Right">
            <Items>
                <f:ContentPanel ID="ContentPanel1" runat="server" ShowBorder="false" ShowHeader="false">
                    <p>
                        <a href="http://baike.baidu.com/view/3645.htm" target="_blank"><b>比尔·盖茨</b></a>
                    </p>
                    <p>
                        比尔·盖茨（Bill Gates），全名威廉·亨利·盖茨三世，简称比尔或盖茨。1975年与好友保罗·艾伦一起创办了微软公司，比尔盖茨担任微软公司董事长、CEO和首席软件设计师。
                    </p>
                </f:ContentPanel>
            </Items>
        </f:Window>
        <f:Window runat="server" ID="Window3" ShowHeader="false" Hidden="true"
            IsModal="true" HideOnMaskClick="true" BodyPadding="10px" Layout="Fit" 
            Width="300px" Height="220px" EnableDefaultCorner="false" PositionY="Top">
            <Items>
                <f:ContentPanel ID="ContentPanel2" runat="server" ShowBorder="false" ShowHeader="false" AutoScroll="true">
                    <p>
                        <a href="http://baike.baidu.com/view/3645.htm" target="_blank"><b>比尔·盖茨</b></a>
                    </p>
                    <p>
                        比尔·盖茨（Bill Gates），全名威廉·亨利·盖茨三世，简称比尔或盖茨。1975年与好友保罗·艾伦一起创办了微软公司，比尔盖茨担任微软公司董事长、CEO和首席软件设计师。
                    </p>
                </f:ContentPanel>
            </Items>
        </f:Window>
        <f:Window runat="server" ID="Window4" ShowHeader="false" Hidden="true"
            IsModal="true" HideOnMaskClick="true" BodyPadding="10px" Layout="Fit" 
            Width="300px" Height="220px" EnableDefaultCorner="false" PositionY="Bottom">
            <Items>
                <f:ContentPanel ID="ContentPanel3" runat="server" ShowBorder="false" ShowHeader="false" AutoScroll="true">
                    <p>
                        <a href="http://baike.baidu.com/view/3645.htm" target="_blank"><b>比尔·盖茨</b></a>
                    </p>
                    <p>
                        比尔·盖茨（Bill Gates），全名威廉·亨利·盖茨三世，简称比尔或盖茨。1975年与好友保罗·艾伦一起创办了微软公司，比尔盖茨担任微软公司董事长、CEO和首席软件设计师。
                    </p>
                </f:ContentPanel>
            </Items>
        </f:Window>
        <f:Window runat="server" ID="Window5" ShowHeader="false" Hidden="true"
            IsModal="true" HideOnMaskClick="true" BodyPadding="10px" Layout="Fit" 
            Width="300px" Height="220px">
            <Items>
                <f:ContentPanel ID="ContentPanel4" runat="server" ShowBorder="false" ShowHeader="false" AutoScroll="true">
                    <p>
                        <a href="http://baike.baidu.com/view/3645.htm" target="_blank"><b>比尔·盖茨</b></a>
                    </p>
                    <p>
                        比尔·盖茨（Bill Gates），全名威廉·亨利·盖茨三世，简称比尔或盖茨。1975年与好友保罗·艾伦一起创办了微软公司，比尔盖茨担任微软公司董事长、CEO和首席软件设计师。
                    </p>
                </f:ContentPanel>
            </Items>
        </f:Window>
    </form>
    <script>

        var window1ClientID = '<%= Window1.ClientID %>';
        var window2ClientID = '<%= Window2.ClientID %>';
        var window3ClientID = '<%= Window3.ClientID %>';
        var window4ClientID = '<%= Window4.ClientID %>';
        var window5ClientID = '<%= Window5.ClientID %>';

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

        function onOpenWindow5Click(event) {
            F(window5ClientID).show();
        }

    </script>
</body>
</html>
