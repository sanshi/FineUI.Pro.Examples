<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buttongroup.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.button.buttongroup" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigSpace="30" BodyPadding="10px" AutoScroll="true" runat="server">
            <Items>
                <f:ButtonGroup ID="ButtonGroup1" EnablePressGroup="true" runat="server">
                    <Items>
                        <f:Button ID="Button1" runat="server" Text="按钮一" EnablePress="true" Pressed="true">
                        </f:Button>
                        <f:Button ID="Button2" runat="server" Text="按钮二" EnablePress="true">
                        </f:Button>
                        <f:Button ID="Button3" runat="server" Text="按钮三" EnablePress="true">
                        </f:Button>
                    </Items>
                </f:ButtonGroup>
                <f:ButtonGroup ID="ButtonGroup4" Layout="HBox" BoxConfigPosition="Center" EnablePressGroup="true" runat="server">
                    <Items>
                        <f:Button ID="Button10" runat="server" Text="按钮一" EnablePress="true">
                        </f:Button>
                        <f:Button ID="Button11" runat="server" Text="按钮二" EnablePress="true" Pressed="true">
                        </f:Button>
                        <f:Button ID="Button12" runat="server" Text="按钮三" EnablePress="true">
                        </f:Button>
                    </Items>
                </f:ButtonGroup>
                <f:ButtonGroup ID="ButtonGroup5" Layout="HBox" BoxConfigPosition="End" EnablePressGroup="true" runat="server">
                    <Items>
                        <f:Button ID="Button13" runat="server" Text="按钮一" EnablePress="true">
                        </f:Button>
                        <f:Button ID="Button14" runat="server" Text="按钮二" EnablePress="true">
                        </f:Button>
                        <f:Button ID="Button15" runat="server" Text="按钮三" EnablePress="true" Pressed="true">
                        </f:Button>
                    </Items>
                </f:ButtonGroup>
                <f:ButtonGroup ID="ButtonGroup3" Layout="HBox" EnablePressGroup="true" runat="server">
                    <Items>
                        <f:Button ID="Button7" runat="server" BoxFlex="1" Text="按钮一" EnablePress="true">
                        </f:Button>
                        <f:Button ID="Button8" runat="server" BoxFlex="1" Text="按钮二" EnablePress="true" Pressed="true">
                        </f:Button>
                        <f:Button ID="Button9" runat="server" BoxFlex="1" Text="按钮三" EnablePress="true">
                        </f:Button>
                    </Items>
                </f:ButtonGroup>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示移动按钮组的互斥按下状态、对齐和等宽伸展。</p>
    <h3><i class="f-iconfont f-iconfont-check" aria-hidden="true"></i>在同组中切换按下项</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ButtonGroup1").ClientID %>' title="第 1 个按钮组">第 1 个按钮组</strong>依次点击两个不同按钮。<br />结果：后点击的按钮按下，同组原先按下的按钮弹起；其它按钮组的状态不变。</li>
        <li>对照其它组的排列和宽度。<br />结果：各组分别对齐或拉伸，使用伸展比例的一组等分当前宽度。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnablePressGroup</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ButtonGroup1").ClientID %>' title="第 1 个按钮组">第 1 个按钮组</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ButtonGroup4").ClientID %>' title="第 2 个按钮组">第 2 个按钮组</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ButtonGroup5").ClientID %>' title="第 3 个按钮组">第 3 个按钮组</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ButtonGroup3").ClientID %>' title="第 4 个按钮组">第 4 个按钮组</strong>）：设为<code>true</code>，在各组内部保持互斥的按下状态。</li>
        <li><code>BoxFlex</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button7").ClientID %>' title="第 10 个按钮（按钮一）">第 10 个按钮（按钮一）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button8").ClientID %>' title="第 11 个按钮（按钮二）">第 11 个按钮（按钮二）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button9").ClientID %>' title="第 12 个按钮（按钮三）">第 12 个按钮（按钮三）</strong>）：设为<code>1</code>，对应按钮等比例分配组内剩余宽度。</li>
    </ul>
</section>
</template>
</body>
</html>
