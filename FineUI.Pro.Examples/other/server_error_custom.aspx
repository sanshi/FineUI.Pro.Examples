<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="server_error_custom.aspx.cs" Inherits="FineUI.Pro.Examples.other.server_error_custom" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="Button5" runat="server" OnClick="Button5_Click"
            Text="服务器异常（500）">
        </f:Button>
        <br />
        <br />
    </form>
    <script>

        F.beforeAjaxError(function (data) {
            var errormsg = 'Unknown';

            // 如果返回的数据包含<title>...</title>标签
            var result = /<title>([^<]+)<\/title>/ig.exec(data);
            if (result && result.length === 2) {
                errormsg = result[1];
            }

            F.alert({
                message: F.rawHtml('<strong>这是自定义错误处理！</strong><br/>服务器返回的错误：' + errormsg),
                messageIcon: 'error'
            });

            // 需要显式的返回 false，来阻止默认的错误处理
            return false;
        });

    </script>
</body>
</html>
