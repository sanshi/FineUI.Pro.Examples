<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addtab.aspx.cs" Inherits="FineUI.Pro.Examples.other.addtab" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="Button1" runat="server" ClickHandler="onOpenHelloFineUIClick"
            Text="向父页面添加选项卡">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button4" runat="server" ClickHandler="onOpenHelloFineUI2Click"
            Text="向父页面添加选项卡（图标字体，与上个按钮添加的选项卡为同一个）">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button2" runat="server" ClickHandler="onCloseActiveTabClick"
            Text="关闭当前选项卡">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="关闭当前选项卡（服务器端注册脚本）">
        </f:Button>
    </form>
    <script type="text/javascript">

        var basePath = '<%= PageContext.ResolveUrl("~/") %>';

        function onOpenHelloFineUIClick(event) {
            parent.addExampleTab({
                id: 'hello_fineui_tab',
                iframeUrl: basePath + 'basic/hello.aspx',
                title: '你好 FineUI.Pro',
                icon: basePath + 'res/images/filetype/vs_aspx.png',
                refreshWhenExist: true
            });
        }

        function onOpenHelloFineUI2Click(event) {
            // 这里的 id 和上面的相同，所以会使用同一个选项卡
            parent.addExampleTab({
                id: 'hello_fineui_tab',
                iframeUrl: basePath + 'basic/login.aspx',
                title: '登陆页面',
                iconFont: 'sign-in',
                refreshWhenExist: true
            });
        }

        function onCloseActiveTabClick(event) {
            parent.removeActiveTab();
        }
    </script>
</body>
</html>
