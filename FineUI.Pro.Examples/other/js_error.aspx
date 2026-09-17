<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="js_error.aspx.cs" Inherits="FineUI.Pro.Examples.other.js_error" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="Button1" runat="server" ClickHandler="onCallback1Click"
            Text="客户端的JavaScript错误">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button4" runat="server" OnClick="Button4_Click"
            Text="服务器返回的JavaScript错误">
        </f:Button>
        <br />
        <br />
        <br />
        <br />
    </form>
    <script type="text/javascript">
        
        function onCallback1Click(event) {
            var i = a[0];
        }


        // 参考：http://stackoverflow.com/questions/951791/javascript-global-error-handling/10556743#10556743
        window.onerror = function (msg, url, line, col, error) {
            var errors = [];
            errors.push('消息：' + msg);
            errors.push('网址：' + url);
            errors.push('行：' + line);
            errors.push('列：' + col);

            F.alert({
                message: F.rawHtml(errors.join('<br/>')),
                title: 'JavaScript错误！',
                messageIcon: 'error'
            });

            // 返回 true 阻止浏览器弹出错误提示框（比如在IE浏览器中）
            return true;
        };



    </script>
</body>
</html>
