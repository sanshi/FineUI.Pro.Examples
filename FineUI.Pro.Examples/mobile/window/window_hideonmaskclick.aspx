<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_hideonmaskclick.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.window.window_hideonmaskclick" %>

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
                <f:Button runat="server" ID="btnOpenWindow" Text="打开窗体一" ClickHandler="onOpenWindow1Click"></f:Button>
            </Items>
        </f:Panel>
        <f:Window runat="server" ID="Window1" ShowHeader="false" Width="300px" Hidden="true"
            IsModal="true" HideOnMaskClick="true" BodyPadding="10px" Layout="VBox">
            <Items>
                <f:ContentPanel runat="server" ShowBorder="false" ShowHeader="false">
                    <p>
                        <a href="http://baike.baidu.com/view/3645.htm" target="_blank"><b>比尔·盖茨</b></a>
                    </p>
                    <p>
                        比尔·盖茨（Bill Gates），全名威廉·亨利·盖茨三世，简称比尔或盖茨。1955年10月28日出生于美国华盛顿州西雅图，13岁开始计算机编程设计，18岁考入哈佛大学，一年后从哈佛退学，1975年与好友保罗·艾伦一起创办了微软公司，比尔盖茨担任微软公司董事长、CEO和首席软件设计师。
                    </p>
                </f:ContentPanel>
                <f:Button runat="server" ID="Button1" Text="打开窗体二" ClickHandler="onOpenWindow2Click"></f:Button>
            </Items>
        </f:Window>

        <f:Window runat="server" ID="Window2" ShowHeader="false" Width="300px" Hidden="true"
            IsModal="true" HideOnMaskClick="true" BodyPadding="10px">
            <Content>
                <p>
                    <a href="http://tech.163.com/special/jobsdead/" target="_blank"><b>乔布斯</b></a>
                </p>
                <p>
                    乔布斯于1955年2月24日出生，苹果创始人之一，近年来多次被评为全美最佳CEO，业界评论“苹果就是乔布斯，乔布斯就是苹果”。
                </p>
            </Content>
        </f:Window>
    </form>
    <script>

        var window1ClientID = '<%= Window1.ClientID %>';
        var window2ClientID = '<%= Window2.ClientID %>';

        function onOpenWindow1Click(event) {
            F(window1ClientID).show();
        }

        function onOpenWindow2Click(event) {
            F(window2ClientID).show();
        }

    </script>
</body>
</html>
