<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="noconflict.aspx.cs" Inherits="FineUI.Pro.Examples.other.noconflict" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>other/noconflict</title>

    <script>

        function inspectNamespace(ns) {
            if (ns === window.FineUI) {
                return "window.FineUI";
            } else {
                return JSON.stringify(ns);
            }
        }

        var result = [];
        // 自定义一个全局变量window.F
        window.F = {
            message: 'Hello world!'
        };
        result.push('<ol>');
        result.push('<li>原始数据，window.F = ' + inspectNamespace(F) + '</li>');

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />

        <f:Button Text="缺省按钮" CssClass="marginr" runat="server" />
        <f:Button ID="btnPrimary" Text="主按钮" ButtonColor="Primary" runat="server" />
        <br />
        <br />
        <f:Button ID="btnChangeEnable" Text="启用后面的按钮" OnClick="btnChangeEnable_Click" CssClass="marginr" runat="server" />
        <f:Button ID="btnEnable" Text="禁用的按钮" OnClick="btnEnable_Click" Enabled="false" runat="server" />
        <br />
        <br />
        <f:Button ID="btnChangePressed" Text="改变后面按钮的按下状态" OnClick="btnChangePressed_Click" CssClass="marginr" runat="server" />
        <f:Button ID="btnPressed" Text="按下的按钮" EnablePress="true" Pressed="true" runat="server" />
        <br />
        <br />
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server"></f:Label>
    </form>
    <script>
        var btnPrimaryClientID = '<%= btnPrimary.ClientID %>';
        var labResultClientID = '<%= labResult.ClientID %>';

        result.push('<li>引入 FineUI 的客户端脚本...</li>');

        result.push('<li>window.F = ' + inspectNamespace(F) + '</li>');


        // 释放对 F 命名空间的占用
        F.noConflict();
        result.push('<li>调用 F.noConflict();</li>');

        // FineUI 已经释放对 F 命名空间的占用，此时 F 指向其原始数据
        result.push('<li>window.F = ' + inspectNamespace(F) + '</li>');

        // 通过 FineUI.ready 注册页面渲染完毕后的回调函数
        FineUI.ready(function (F) {
            // 在 FineUI.ready 回调函数内，可以使用局部变量 F 访问 FineUI 命名空间
            result.push('<li>在 FineUI.ready 回调函数内');

            result.push('<ul>');
            result.push('<li>局部变量 F = ' + inspectNamespace(F) + '</li>');
            result.push('<li>全局变量 window.F = ' + inspectNamespace(window.F) + '</li>');
            result.push('<li>F(btnPrimaryClientID).getText() = ' + F(btnPrimaryClientID).getText() + '</li>');
            result.push('<li>FineUI(btnPrimaryClientID).getText() = ' + FineUI(btnPrimaryClientID).getText() + '</li>');
            result.push('</ul></li>');

            result.push('</ol>');
            F(labResultClientID).setValue(result.join('<br>'));
        });

    </script>
</body>
</html>
