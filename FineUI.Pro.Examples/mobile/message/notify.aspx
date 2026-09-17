<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notify.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.message.notify" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .mynotify .f-messagebox-message {
            margin: 0;
        }

        .mynotify .f-loading {
            position: static;
            margin: 0;
            text-align: center;
        }

            .mynotify .f-loading .f-loading-img {
                display: inline-block;
                vertical-align: top;
            }

        .mynotify .f-loading-message {
            font-size: 14px;
            margin: 5px 10px 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="VBox"
            BoxConfigChildMargin="0 0 10px 0" BodyPadding="10px" runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Title="通知对话框" runat="server" HeaderStyle="true">
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Button Text="通知对话框" runat="server" ID="Button1" OnClick="Button1_Click">
                </f:Button>
                <f:Button Text="通知对话框（正在加载）" runat="server" ID="Button2" OnClick="Button2_Click">
                </f:Button>
                <f:Button Text="通知对话框（正在加载，不显示文字）" runat="server" ID="Button3" OnClick="Button3_Click">
                </f:Button>
                <f:Button Text="通知对话框（正在加载，自定义样式）" runat="server" ID="Button4" OnClick="Button4_Click">
                </f:Button>
                <f:Label runat="server" Text=""></f:Label>
                <f:Panel runat="server" ShowBorder="false" ShowHeader="false" Layout="HBox" BoxConfigChildMargin="0 10 0 0">
                    <Items>
                        <f:Button Text="显示通知对话框" runat="server" ID="Button5" BoxFlex="1" ClickHandler="onShowNotifyWindowClick"></f:Button>
                        <f:Button Text="关闭通知对话框" runat="server" ID="Button6" BoxFlex="1" Margin="0" ClickHandler="onHideNotifyWindowClick"></f:Button>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
    <script>

        function onShowNotifyWindowClick(event) {
            // 注意：id属性是通知对话框的标识符
            var mynotifywindow = F('mynotifywindow');
            if (!mynotifywindow) {
                F.notify({
                    id: 'mynotifywindow',
                    message: '正在加载...',
                    messageIcon: '',
                    header: false,
                    positionX: 'center',
                    positionY: 'top',
                    showLoading: true,
                    minWidth: 100,
                    displayMilliseconds: 60000  // 1分钟才关闭
                });
            }
        }

        function onHideNotifyWindowClick(event) {
            var mynotifywindow = F('mynotifywindow');
            if (mynotifywindow) {
                mynotifywindow.hide();
            }
        }

    </script>
</body>
</html>
