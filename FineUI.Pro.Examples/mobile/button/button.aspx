<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.button.button" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigSpace="5" BodyPadding="10px" AutoScroll="true" runat="server">
            <Items>
                <f:Button ID="Button1" Text="普通按钮" runat="server" />
                <f:Button ID="Button2" Text="按下按钮" runat="server" EnablePress="true" Pressed="true" />
                <f:Button ID="Button3" Text="禁用按钮" Enabled="false" runat="server" MarginBottom="30px" />
                <f:Panel runat="server" ShowBorder="false" ShowHeader="false" Layout="HBox" BoxConfigSpace="5" MarginBottom="30px">
                    <Items>
                        <f:Button ID="Button4" Text="普通按钮" BoxFlex="1" runat="server" />
                        <f:Button ID="Button5" Text="按下按钮" BoxFlex="1" runat="server" EnablePress="true" Pressed="true" />
                        <f:Button ID="Button6" Text="禁用按钮" BoxFlex="1" Enabled="false" runat="server" />
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel2" runat="server" ShowBorder="false" ShowHeader="false" Layout="HBox" BoxConfigSpace="5" MarginBottom="30px">
                    <Items>
                        <f:Button ID="Button7" Text="普通按钮" BoxFlex="1" Icon="Star" IconAlign="Top" runat="server" />
                        <f:Button ID="Button8" Text="按下按钮" BoxFlex="1" IconFont="_Mail" IconAlign="Top" runat="server" EnablePress="true" Pressed="true" />
                        <f:Button ID="Button9" Text="禁用按钮" BoxFlex="1" IconFont="_Refresh" IconAlign="Top" Enabled="false" runat="server" />
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示移动按钮的普通、持续按下和禁用状态，并组合图标及水平伸展。</p>
    <h3><i class="f-iconfont f-iconfont-check" aria-hidden="true"></i>比较三类按钮</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="第 1 个面板">第 1 个面板</strong>分别点击普通按钮、按下按钮和禁用按钮。<br />结果：按下型按钮可切换持续按下外观，禁用按钮不响应普通点击；本页主要演示外观与状态，不执行业务提交。</li>
        <li>对照下方图标位于文字上方的一组。<br />结果：按钮仍保留各自的按下或禁用状态，图标布局与按钮状态互不替代。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnablePress</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="第 2 个按钮（按下按钮）">第 2 个按钮（按下按钮）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button5").ClientID %>' title="第 5 个按钮（按下按钮）">第 5 个按钮（按下按钮）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button8").ClientID %>' title="第 8 个按钮（按下按钮）">第 8 个按钮（按下按钮）</strong>）：设为<code>true</code>，为对应按钮启用持续按下状态。</li>
        <li><code>Pressed</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="第 2 个按钮（按下按钮）">第 2 个按钮（按下按钮）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button5").ClientID %>' title="第 5 个按钮（按下按钮）">第 5 个按钮（按下按钮）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button8").ClientID %>' title="第 8 个按钮（按下按钮）">第 8 个按钮（按下按钮）</strong>）：初始设为<code>true</code>，指定本页对应按钮的初始按下状态。</li>
        <li><code>Enabled</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>' title="第 3 个按钮（禁用按钮）">第 3 个按钮（禁用按钮）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button6").ClientID %>' title="第 6 个按钮（禁用按钮）">第 6 个按钮（禁用按钮）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button9").ClientID %>' title="第 9 个按钮（禁用按钮）">第 9 个按钮（禁用按钮）</strong>）：设为<code>false</code>，禁用按钮初始为 <code>false</code>。</li>
        <li><code>IconAlign</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button7").ClientID %>' title="第 7 个按钮（普通按钮）">第 7 个按钮（普通按钮）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button8").ClientID %>' title="第 8 个按钮（按下按钮）">第 8 个按钮（按下按钮）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button9").ClientID %>' title="第 9 个按钮（禁用按钮）">第 9 个按钮（禁用按钮）</strong>）：设为<code>Top</code>，图文对照组把图标放在文字上方。</li>
    </ul>
</section>
</template>
</body>
</html>
