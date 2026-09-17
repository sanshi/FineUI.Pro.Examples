<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_position_actionsheet_buttongroup_vertical.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.window.window_position_actionsheet_buttongroup_vertical" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .mybgpanel > .f-panel-bodyct > .f-panel-body {
            background-color: #FEF3D5;
            background-image: url(../../res/images/bg/small/3.jpg);
            background-position: right bottom;
            background-repeat: no-repeat;
        }

        .mywindow,
        .mywindow > .f-panel-bodyct > .f-panel-body {
            background-image: none;
            background-color: transparent;
            -moz-box-shadow: none;
            -webkit-box-shadow: none;
            box-shadow: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" CssClass="mybgpanel" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigChildMargin="0 0 5px 0" BodyPadding="10px" runat="server">
            <Items>
                <f:Button runat="server" ID="btnOpenWindow" Text="动作面板" ClickHandler="onOpenWindow1Click"></f:Button>
            </Items>
        </f:Panel>
        <f:Window runat="server" ID="Window1" CssClass="mywindow" ShowHeader="false" ShowBorder="false" Hidden="true" HideOnMaskClick="true"
            IsModal="true" BodyPadding="10px" Layout="VBox" BoxConfigChildMargin="0 0 5px 0"
            PercentWidth="100%" EnableDefaultCorner="false" PositionY="Bottom">
            <Items>
                <f:ButtonGroup runat="server" MarginBottom="10px" Layout="VBox" Vertical="true">
                    <f:Button runat="server" ID="Button1" Size="Large" Text="相册" ClickHandler="onOpenAlbumClick"></f:Button>
                    <f:Button runat="server" ID="Button2" Size="Large" Text="拍照" ClickHandler="onTakeAPictureClick"></f:Button>
                </f:ButtonGroup>
                <f:Button runat="server" ID="Button3" Text="取消" Margin="0" ClickHandler="onCloseWindow1Click"></f:Button>
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


        function onOpenAlbumClick(event) {
            F(window1ClientID).hide();
            showCenterNotify('你点击了 [相册] 按钮！');
        }

        function onTakeAPictureClick(event) {
            F(window1ClientID).hide();
            showCenterNotify('你点击了 [拍照] 按钮！');
        }

    </script>
</body>
</html>
