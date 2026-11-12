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


    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>启动定时回发读取服务器时间，并可停止后续定时请求。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>启动后停止定时刷新</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnStartTimer").ClientID %>' title="启动定时器">启动定时器</strong>。<br />结果：定时器开始按本页间隔回发，时间标签显示新的服务器时间。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnStopTimer").ClientID %>' title="停止定时器">停止定时器</strong>。<br />结果：定时请求停止，时间标签保留最后一次结果。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
            <li>点击“启动定时器”，下面的文本会每隔 10 秒钟更新一次。</li>
            <li>更新过于频繁的操作不要使用 Timer，以避免性能问题</li>
        </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Interval</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Timer1").ClientID %>' title="定时器">定时器</strong>）：初始为 <code>10</code>，指定两次定时回发之间的秒数。</li>
        <li><code>Enabled</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Timer1").ClientID %>' title="定时器">定时器</strong>）：初始为 <code>false</code>，控制定时器是否继续发出请求。</li>
    </ul>
</section>
</template>
</body>
</html>
