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
<template id="example-description">
<section aria-label="页面描述">
    <p>释放 window.F 的占用，通过 FineUI 或回调中的局部 F 继续操作控件。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>释放名称后继续使用控件</h3>
    <ul>
        <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("labResult").ClientID %>' title="标签">标签</strong>中的命名空间记录。<br />结果：记录显示调用 noConflict 前后全局 F 的变化，FineUI 仍可访问框架。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnChangeEnable").ClientID %>' title="启用后面的按钮">启用后面的按钮</strong>。<br />结果：后面的禁用按钮变为可用，再点击它仍能显示业务提示。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnChangePressed").ClientID %>' title="改变后面按钮的按下状态">改变后面按钮的按下状态</strong>。<br />结果：后面的按钮在按下与抬起状态之间切换，命名空间释放不影响控件实例。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>F.noConflict()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("labResult").ClientID %>' title="标签">标签</strong>）：把全局 F 恢复到加载框架之前的值，保留全局 FineUI。</li>
        <li><code>FineUI.ready(function (F) { … })</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("labResult").ClientID %>' title="标签">标签</strong>）：回调参数 F 只在当前函数内指向框架，不重新占用 window.F。</li>
    </ul>
</section>
</template>
</body>
</html>
