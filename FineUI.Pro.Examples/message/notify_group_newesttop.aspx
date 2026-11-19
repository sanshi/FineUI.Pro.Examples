<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notify_group_newesttop.aspx.cs"
    Inherits="FineUI.Pro.Examples.message.notify_group_newesttop" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/js/notify-group.js" />
    <style>
        .notify-group-item .f-messagebox-message {
            min-width: 260px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button Text="弹出通知对话框（多次点击）" runat="server" ID="btnOperation1" ClickHandler="onOperation1Click"></f:Button>
        <br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/notify-group.js") %>"></script>
    <script type="text/javascript">
        var _orderNumber = 0;

        function onOperation1Click(event) {
            // 创建一个消息对话框实例
            var displayTime = 2000 + Math.random() * 10000;

            var allMessageIcons = ['information', 'warning', 'question', 'error', 'success'];
            showNotifyGroup({
                message: F.rawHtml('这是第<strong>' + _orderNumber + '</strong>条提示信息，显示' + Math.floor(displayTime / 1000) + '秒'),
                messageIcon: allMessageIcons[_orderNumber % allMessageIcons.length],
                header: false,
                displayMilliseconds: displayTime
            }, true);

            _orderNumber++;
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把同组通知集中排列，并让最新通知显示在上方。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>连续创建通知</h3>
            <ul>
                <li>连续点击几次<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOperation1").ClientID %>'
                        title="弹出通知对话框（多次点击）">弹出通知对话框（多次点击）</strong>。<br />结果：同组通知按新到旧从上向下排列，新通知插入组的顶部。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>showNotifyGroup(options, newestOnTop)</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOperation1").ClientID %>'
                        title="弹出通知对话框（多次点击）">弹出通知对话框（多次点击）</strong>）：本页共用函数维护当前通知队列，按窗口位置和间距集中排列。</li>
                <li><code>newestOnTop</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOperation1").ClientID %>'
                        title="弹出通知对话框（多次点击）">弹出通知对话框（多次点击）</strong>）：调用分组函数时传入 true，使新通知排在已有通知之前。</li>
            </ul>
        </section>
    </template>
</body>
</html>
