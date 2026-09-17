<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notify_addtab.aspx.cs"
    Inherits="FineUI.Pro.Examples.message.notify_addtab" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .addtabcontainer {
            text-align: center;
            padding-top: 20px;
            padding-bottom: 20px;
            font-size: 14px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button Text="弹出通知对话框" runat="server" ID="btnOperation1" OnClick="btnOperation1_Click1">
        </f:Button>
        <br />
        <br />
    </form>

    <script type="text/javascript">

        var basePath = '<%= PageContext.ResolveUrl("~/") %>';

        function openExampleHello(notifyId) {
            parent.addExampleTab({
                iframeUrl: basePath + 'basic/hello.aspx',
                title: '你好 FineUI.Pro',
                icon: basePath + 'res/images/filetype/vs_aspx.png',
                refreshWhenExist: true
            });

            // 关闭通知对话框
            F(notifyId).hide();
        }

    </script>
</body>
</html>
