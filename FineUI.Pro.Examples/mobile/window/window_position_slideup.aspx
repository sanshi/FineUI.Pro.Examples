<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_position_slideup.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.window.window_position_slideup" %>

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
                <f:Button runat="server" ID="btnOpenWindow" Text="从下方滑入窗体" ClickHandler="onOpenWindow1Click"></f:Button>
            </Items>
        </f:Panel>
        <f:Window runat="server" ID="Window1" ShowHeader="false" Hidden="true"
            IsModal="true" HideOnMaskClick="true" BodyPadding="10px" Layout="Fit"
            PercentWidth="100%" PercentHeight="100%" EnableDefaultCorner="false" PositionY="Bottom">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Title="弹出窗体标题" runat="server" HeaderStyle="true" ToolbarAlign="Right">
                    <Items>
                        <f:Button runat="server" ID="Button1" Size="Small" Text="关闭" ClickHandler="onCloseWindow1Click"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:ContentPanel runat="server" ShowBorder="false" ShowHeader="false" AutoScroll="true">
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

        function onOpenWindow1Click(event) {
            F(window1ClientID).show();
        }

        function onCloseWindow1Click(event) {
            F(window1ClientID).hide();
        }


    </script>
</body>
</html>
