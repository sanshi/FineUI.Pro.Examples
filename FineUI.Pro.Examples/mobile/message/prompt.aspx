<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="prompt.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.message.prompt" %>

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
                <f:Button Text="输入对话框" runat="server" ID="Button1" OnClick="Button1_Click">
                </f:Button>
                <f:Button Text="输入对话框（ButtonFill）" runat="server" ID="Button2" OnClick="Button2_Click">
                </f:Button>
                <f:Button Text="输入对话框（ButtonPlain）" runat="server" ID="Button5" OnClick="Button5_Click">
                </f:Button>
                <f:Button Text="输入对话框（ButtonPlain，密码）" runat="server" ID="Button4" OnClick="Button4_Click">
                </f:Button>
                <f:Button Text="输入对话框（CancelButtonAhead）" runat="server" ID="Button3" OnClick="Button3_Click">
                </f:Button>
            </Items>
        </f:Panel>
    </form>
    
    <script>

        function notifyit(inputValue) {
            var message = '用户输入：' + inputValue;
            if (!inputValue) {
                message = '用户未输入值！';
            }
            showCenterNotify(message);
        }

    </script>
</body>
</html>
