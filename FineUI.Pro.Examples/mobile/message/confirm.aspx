<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirm.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.message.confirm" %>

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
                <f:Button Text="确认对话框" runat="server" ID="Button1" OnClick="Button1_Click">
                </f:Button>
                <f:Button Text="确认对话框（ButtonFill）" runat="server" ID="Button2" OnClick="Button2_Click">
                </f:Button>
                <f:Button Text="确认对话框（ButtonPlain）" runat="server" ID="Button6" OnClick="Button6_Click">
                </f:Button>
                <f:Button Text="确认对话框（CancelButtonAhead）" runat="server" ID="Button3" OnClick="Button3_Click">
                </f:Button>
                <f:Button Text="确认对话框（自定义按钮文本，回发）" runat="server" ID="Button4" ClickHandler="onButton4Click"></f:Button>
                <f:Button Text="确认对话框（自定义按钮宽度，回发）" runat="server" ID="Button5" ClickHandler="onButton5Click"></f:Button>
            </Items>
        </f:Panel>
    </form>
    <script>
        function onButton4Click(event) {

            F.create({
                type: 'MessageBox',
                title: '确认退出',
                message: '您即将直接退出，请先保存已修改数据！',
                titleAlign: 'center',
                closable: false,
                buttonPlain: true,
                messageIcon: '',
                buttons: [{
                    buttonId: 'cancel',
                    text: '不退出'
                }, {
                    buttonId: 'ok',
                    text: '直接退出'
                }],
                handler: function(event, buttonId) {
                    if (buttonId === 'ok') {
                        F.customEvent('ConfirmOK');
                    } else {
                        F.customEvent('ConfirmCancel');
                    }
                }
            });

        }


        function onButton5Click(event) {

            F.create({
                type: 'MessageBox',
                title: '确认退出',
                message: '您即将直接退出，请先保存已修改数据！',
                titleAlign: 'center',
                closable: false,
                buttonPlain: true,
                messageIcon: '',
                buttons: [{
                    buttonId: 'cancel',
                    text: '取消',
                    flex: 1
                }, {
                    buttonId: 'ok',
                    text: '直接退出',
                    flex: 2
                }],
                autoFocusButtonId: 'ok',
                handler: function(event, buttonId) {
                    if (buttonId === 'ok') {
                        F.customEvent('ConfirmOK');
                    } else {
                        F.customEvent('ConfirmCancel');
                    }
                }
            });

        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示移动确认对话框的结果处理与按钮样式。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>打开并处理当前对话框</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="第 1 个按钮（确认对话框）">第 1 个按钮（确认对话框）</strong>。<br />结果：本页显示确认对话框。</li>
                <li>点击<strong>取消</strong>，再重新打开并确定。<br />结果：取消和确定进入各自处理分支；本页演示确认动作，并没有真实删除数据。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>比较按钮样式</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>'
                        title="确认对话框（ButtonFill）">确认对话框（ButtonFill）</strong>。<br />结果：对话框底部按钮填充可用宽度。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button6").ClientID %>'
                        title="确认对话框（ButtonPlain）">确认对话框（ButtonPlain）</strong>。<br />结果：对话框使用本页简洁按钮样式。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>'
                        title="确认对话框（CancelButtonAhead）">确认对话框（CancelButtonAhead）</strong>。<br />结果：取消按钮排列在确定按钮之前。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>回传自定义按钮结果</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button4").ClientID %>'
                        title="确认对话框（自定义按钮文本，回发）">确认对话框（自定义按钮文本，回发）</strong>。<br />结果：显示本页自定义按钮文字的确认框；点击后把对应结果传给本页处理函数，不代表真的退出系统。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ButtonFill</code>（<strong>对话框配置</strong>）：让对话框按钮填满底部工具栏。</li>
                <li><code>ButtonPlain</code>（<strong>对话框配置</strong>）：使用本页简洁按钮外观。</li>
                <li><code>CancelButtonAhead</code>（<strong>对话框配置</strong>）：把取消入口排到确定之前。</li>
            </ul>
        </section>
    </template>
</body>
</html>
