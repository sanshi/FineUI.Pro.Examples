<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hyperlink.aspx.cs" Inherits="FineUI.Pro.Examples.form.hyperlink" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
    <f:HyperLink ID="HyperLink3" Text="新窗口打开百度首页" Target="_blank" NavigateUrl="http://www.baidu.com/"
        runat="server">
    </f:HyperLink>
    <br />
    <f:HyperLink ID="HyperLink1" EncodeText="false" Text="新窗口打开 <span style='color:red;'>Google</span> 首页"
        Target="_blank" NavigateUrl="http://www.google.com/" runat="server">
    </f:HyperLink>
    <br />
    <f:HyperLink ID="HyperLink2" Enabled="false" Text="点击弹出对话框" NavigateUrl="#"
        ClickHandler="onHyperLink2Click" runat="server">
    </f:HyperLink>
    <br />
    <f:Button ID="btnChangeEnable" Text="启用/禁用最后一个链接" runat="server" OnClick="btnChangeEnable_Click" />
    </form>

    <script>
        // 超链接的客户端点击回调（返回 false 可阻止默认导航）
        function onHyperLink2Click(event) {
            F.alert({ message: '这是链接的客户端提示', messageIcon: 'information', target: '_parent' });
        }

    </script>
</body>
</html>
