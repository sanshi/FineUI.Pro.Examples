<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="timer.aspx.cs" Inherits="FineUI.Pro.Examples.other.timer" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Timer ID="Timer1" Interval="10" Enabled="false" OnTick="Timer1_Tick" EnableAjaxLoading="false" runat="server">
        </f:Timer>
        <f:Button ID="btnStartTimer" runat="server" CssClass="marginr" Text="启动定时器"
            OnClick="btnStartTimer_Click">
        </f:Button>
        <f:Button ID="btnStopTimer" runat="server" Enabled="false" Text="停止定时器" OnClick="btnStopTimer_Click">
        </f:Button>
        <br />
        <f:Label ID="labServerTime" runat="server" CssStyle="color:red;">
        </f:Label>
        <br />
        <br />
        注：
        <ul>
            <li>点击“启动定时器”，下面的文本会每隔 10 秒钟更新一次。</li>
            <li>更新过于频繁的操作不要使用 Timer，以避免性能问题</li>
        </ul>

    </form>
</body>
</html>
