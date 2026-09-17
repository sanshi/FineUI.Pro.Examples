<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_linkbutton.aspx.cs"
    Inherits="FineUI.Pro.Examples.button.button_linkbutton" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:LinkButton ID="LinkButton2" Text="客户端事件" ClickHandler="onClientEventClick" runat="server">
        </f:LinkButton>
        <br />
        <f:LinkButton ID="LinkButton3" Text="服务器端事件" OnClick="LinkButton3_Click" runat="server">
        </f:LinkButton>
        <br />
        <br />
        <f:LinkButton ID="LinkButton1" Enabled="false" Text="客户端事件（初始禁用）" ClickHandler="onLinkButtonClick" runat="server">
        </f:LinkButton>
        <br />
        <f:Button ID="btnChangeEnable" Text="启用/禁用最后一个链接按钮" runat="server" OnClick="btnChangeEnable_Click" />
    </form>
    <script>
        function onLinkButtonClick(event) {
            top.F.alert("这是初始禁用的链接按钮的客户端事件！");
        }

        function onClientEventClick(event) {
            F.alert({ message: '这是客户端事件', messageIcon: 'information', target: '_top' });
        }
    </script>
</body>
</html>
