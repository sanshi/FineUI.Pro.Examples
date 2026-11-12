<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nesting_left_right.aspx.cs" Inherits="FineUI.Pro.Examples.block.nesting_left_right" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        body.f-body {
            overflow-x: hidden;
        }
    </style>
</head>
<body class="f-body-darkerbg">
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="PanelExample1" ClientIDMode="Static" IsFluid="true" runat="server"
            Layout="Block" BlockConfigSpace="20px" ShowBorder="false" ShowHeader="false">
            <Items>
                <f:Panel ID="PanelExample2" ClientIDMode="Static" runat="server" BlockMD="8"
                    Layout="Block" BlockConfigSpace="20px" ShowBorder="false" ShowHeader="false">
                    <Items>
                        <f:Panel BlockMD="6" Height="300px"
                            runat="server" ShowBorder="true" ShowHeader="true" Title="1">
                        </f:Panel>
                        <f:Panel BlockMD="6" Height="300px"
                            runat="server" ShowBorder="true" ShowHeader="true" Title="2">
                        </f:Panel>
                        <f:Panel BlockMD="12" Height="400px"
                            runat="server" ShowBorder="true" ShowHeader="true" Title="3">
                        </f:Panel>
                        <f:Panel BlockMD="12" Height="400px"
                            runat="server" ShowBorder="true" ShowHeader="true" Title="4">
                        </f:Panel>
                    </Items>
                </f:Panel>
                <f:Panel ID="PanelExample7" ClientIDMode="Static" runat="server" BlockMD="4"
                    Layout="Block" BlockConfigSpace="20px" ShowBorder="false" ShowHeader="false">
                    <Items>
                        <f:Panel BlockMD="12" Height="300px"
                            runat="server" ShowBorder="true" ShowHeader="true" Title="5">
                        </f:Panel>
                        <f:Panel BlockMD="12" Height="200px"
                            runat="server" ShowBorder="true" ShowHeader="true" Title="6">
                        </f:Panel>
                        <f:Panel BlockMD="12" Height="200px"
                            runat="server" ShowBorder="true" ShowHeader="true" Title="7">
                        </f:Panel>
                        <f:Panel BlockMD="12" Height="200px"
                            runat="server" ShowBorder="true" ShowHeader="true" Title="8">
                        </f:Panel>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示把左右两组各自的 <code>Block</code> 布局嵌入外层布局。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>调整宽度比较排列</h3>
    <ul>
        <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample1").ClientID %>' title="第 1 个面板">第 1 个面板</strong>，改变浏览器宽度，对照左、右分组及各自子块。<br />结果：左右组按外层占比排列，各自内部再独立分配列宽；左组保持本页较大的占比。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Layout</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample1").ClientID %>' title="第 1 个面板">第 1 个面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample2").ClientID %>' title="第 2 个面板">第 2 个面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample7").ClientID %>' title="第 7 个面板">第 7 个面板</strong>）：设为<code>Block</code>，父容器使用 <code>Block</code>，按可用宽度排列内容块。</li>
        <li><code>BlockMD</code>（本页各面板，如<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample2").ClientID %>' title="第 2 个面板">第 2 个面板</strong>）：各组分别设为<code>8</code>、<code>6</code>、<code>12</code>、<code>4</code>，指定当前子项在相应宽度区间占用的块数，未达到临界值时使用较小区间的设置。</li>
    </ul>
</section>
</template>
</body>
</html>
