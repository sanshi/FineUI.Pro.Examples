<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="prompt.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.message.prompt" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigSpace="10" BodyPadding="10px" runat="server">
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
<template id="example-description">
<section aria-label="页面描述">
    <p>演示移动输入对话框的输入结果处理和按钮布局。</p>
    <h3><i class="f-iconfont f-iconfont-window" aria-hidden="true"></i>打开并处理当前对话框</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="输入对话框">输入对话框</strong>。<br />结果：本页显示包含输入字段的对话框。</li>
        <li>输入<code>张三</code>并点击<strong>确定</strong>。<br />结果：确认处理读取本次输入并显示用户输入结果；取消时不提交该输入。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>比较按钮样式</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="输入对话框（ButtonFill）">输入对话框（ButtonFill）</strong>。<br />结果：对话框底部按钮填充可用宽度。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button5").ClientID %>' title="输入对话框（ButtonPlain）">输入对话框（ButtonPlain）</strong>。<br />结果：对话框使用本页简洁按钮样式。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>' title="输入对话框（CancelButtonAhead）">输入对话框（CancelButtonAhead）</strong>。<br />结果：取消按钮排列在确定按钮之前。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>ButtonFill</code>（<strong>对话框配置</strong>）：让对话框按钮填满底部工具栏。</li>
        <li><code>ButtonPlain</code>（<strong>对话框配置</strong>）：使用本页简洁按钮外观。</li>
        <li><code>TextMode</code>（<strong>对话框配置</strong>）：密码变体使用 <code>password</code>，普通变体读取文本。</li>
    </ul>
</section>
</template>
</body>
</html>
