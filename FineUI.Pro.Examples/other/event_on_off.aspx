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
        <f:Button ID="btnSpecialEvent" runat="server" Text="注册特殊点击事件" ClickHandler="onSpecialEventClick"></f:Button>
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
</body>
</html>
