<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirm.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.message.confirm" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="VBox"
            BoxConfigChildMargin="0 0 10px 0" BodyPadding="10px" runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Title="确认对话框" runat="server" HeaderStyle="true">
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Button Text="确认对话框" runat="server" ID="Button1" OnClick="Button1_Click">
                </f:Button>
                <f:Button Text="确认对话框（ButtonFill）" runat="server" ID="Button2" OnClick="Button2_Click">
                </f:Button>
                <f:Button Text="确认对话框（ButtonPlain）" runat="server" ID="Button6" OnClick="Button6_Click">
                </f:Button>
                <f:Button Text="确认对话框（CancelButtonAhead）" runat="server" ID="Button3" OnClick="Button3_Click">
                </f:Button>
                <f:Button Text="确认对话框（自定义按钮文本，回发）" runat="server" ID="Button4" ClickHandler="onButton4Click"></f:Button>
                <f:Button Text="确认对话框（自定义按钮宽度，回发）" runat="server" ID="Button5" ClickHandler="onButton5Click"></f:Button>
            </Items>
        </f:Panel>
    </form>
    <script>

        function onButton4Click(event) {

            F.create({
                type: 'MessageBox',
                title: '确认退出',
                message: '您即将直接退出，请先保存已修改数据！',
                titleAlign: 'center',
                closable: false,
                buttonPlain: true,
                messageIcon: '',
                buttons: [{
                    buttonId: 'cancel',
                    text: '不退出'
                }, {
                    buttonId: 'ok',
                    text: '直接退出'
                }],
                handler: function (event, buttonId) {
                    if (buttonId === 'ok') {
                        F.customEvent('ConfirmOK');
                    } else {
                        F.customEvent('ConfirmCancel');
                    }
                }
            });

        }


        function onButton5Click(event) {

            F.create({
                type: 'MessageBox',
                title: '确认退出',
                message: '您即将直接退出，请先保存已修改数据！',
                titleAlign: 'center',
                closable: false,
                buttonPlain: true,
                messageIcon: '',
                buttons: [{
                    buttonId: 'cancel',
                    text: '取消',
                    flex: 1
                }, {
                    buttonId: 'ok',
                    text: '直接退出',
                    flex: 2
                }],
                autoFocusButtonId: 'ok',
                handler: function (event, buttonId) {
                    if (buttonId === 'ok') {
                        F.customEvent('ConfirmOK');
                    } else {
                        F.customEvent('ConfirmCancel');
                    }
                }
            });

        }

    </script>
</body>
</html>
