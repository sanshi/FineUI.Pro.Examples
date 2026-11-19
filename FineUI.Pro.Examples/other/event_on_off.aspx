<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="event_on_off.aspx.cs" Inherits="FineUI.Pro.Examples.other.event_on_off" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="btnTest" runat="server" Text="测试按钮" Size="Large" ClickHandler="onTestClick"></f:Button>
        <br />
        <br />
        <hr />
        <f:Button ID="btnCustomEvent" runat="server" Text="注册点击事件（1）" ClickHandler="onCustomEventClick"></f:Button>
        <br />
        <br />
        <f:Button CssClass="marginr" ID="btnSpecialEvent" runat="server" Text="注册特殊点击事件" ClickHandler="onSpecialEventClick"></f:Button>
        <f:Button ID="btnDeleteSpecialEvent" runat="server" Text="删除特殊点击事件" Enabled="false" ClickHandler="onDeleteSpecialEventClick">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnDeleteAll" runat="server" Text="删除全部点击事件" ClickHandler="onDeleteAllClick"></f:Button>
        <br />
        <br />
        触发的事件列表（<a id="clearResult" href="#">clear</a>）：
        <ul id="result">
        </ul>
        <br />
        <br />

    </form>
    <script>
        var btnTestClientID = '<%= btnTest.ClientID %>';
        var btnCustomEventClientID = '<%= btnCustomEvent.ClientID %>';
        var btnSpecialEventClientID = '<%= btnSpecialEvent.ClientID %>';
        var btnDeleteSpecialEventClientID = '<%= btnDeleteSpecialEvent.ClientID %>';
        var customEventNumber = 1;
        var theSpecialEventCallback = function(event) {
            $('#result').append('<li>特殊点击事件</li>');
        };

        function onClearResultClick(event) {
            event.preventDefault();
            $('#result').empty();
        }

        function onTestClick(event) {
            $('#result').append('<li>点击事件（default）</li>');
        }

        function onCustomEventClick(event) {
            (function(number) {
                F(btnTestClientID).on('click', function(event) {
                    event.preventDefault();
                    $('#result').append('<li>点击事件（' + number + '）</li>');
                });
            })(customEventNumber);

            customEventNumber++;
            F(btnCustomEventClientID).setText('注册点击事件（' + customEventNumber + '）');
        }

        function onSpecialEventClick(event) {
            F(btnTestClientID).on('click', theSpecialEventCallback);
            F(btnSpecialEventClientID).disable();
            F(btnDeleteSpecialEventClientID).enable();
        }

        function onDeleteSpecialEventClick(event) {
            F(btnTestClientID).off('click', theSpecialEventCallback);
            F(btnSpecialEventClientID).enable();
            F(btnDeleteSpecialEventClientID).disable();
        }

        function onDeleteAllClick(event) {
            F(btnTestClientID).off('click');
            F(btnSpecialEventClientID).enable();
            F(btnDeleteSpecialEventClientID).disable();
        }

        F.ready(function() {
            $('#clearResult').on('click', onClearResultClick);
        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>给同一个测试按钮动态添加多个点击回调，并分别删除指定回调或全部回调。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>添加与移除回调</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnCustomEvent").ClientID %>'
                        title="注册点击事件（1）">注册点击事件（1）</strong>。<br />结果：新增一个普通点击回调，再点测试按钮时结果列表增加该回调记录。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSpecialEvent").ClientID %>'
                        title="注册特殊点击事件">注册特殊点击事件</strong>。<br />结果：注册可单独识别的特殊回调；再次点测试按钮时普通与特殊记录都出现。</li>
                <li>点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnDeleteSpecialEvent").ClientID %>'
                        title="删除特殊点击事件">删除特殊点击事件</strong>。<br />结果：只移除特殊回调，普通回调继续执行。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnDeleteAll").ClientID %>'
                        title="删除全部点击事件">删除全部点击事件</strong>。<br />结果：移除测试按钮的全部点击监听，之后点击不再追加原来的回调记录。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>on() / off()</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnTest").ClientID %>'
                        title="测试按钮">测试按钮</strong>）：向测试按钮注册或取消事件；单独取消时传入原来的同一个函数引用。</li>
            </ul>
        </section>
    </template>
</body>
</html>
