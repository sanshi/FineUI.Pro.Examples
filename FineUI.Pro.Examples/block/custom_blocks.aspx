<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="custom_blocks.aspx.cs" Inherits="FineUI.Pro.Examples.block.custom_blocks" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        body.f-body {
            overflow-x: hidden;
        }

        .custompanel {
            min-height: 200px;
        }
    </style>
</head>
<body class="f-body-darkerbg">
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="PanelExample1" IsFluid="true" runat="server"
            Layout="Block" BlockConfigSpace="20px" BlockConfigBlockCount="20" ShowBorder="false" ShowHeader="false">
            <Items>
                <f:Panel ID="PanelExample2" CssClass="custompanel" BlockSM="10" BlockMD="4"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="4">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockSM="5" BlockMD="4"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="4">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockSM="5" BlockMD="4"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="4">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockSM="10" BlockMD="4"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="4">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockSM="10" BlockMD="4"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="4">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockSM="20" BlockMD="10"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="10">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockSM="10" BlockMD="10"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="10">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockSM="10" BlockMD="20"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="20">
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示把总块数改为 <code>20</code>，以便显示五列布局。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>调整宽度比较排列</h3>
    <ul>
        <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample1").ClientID %>' title="第 1 个面板">第 1 个面板</strong>，放大到本页桌面布局生效的宽度。<br />结果：一行可放五个各占 <code>4</code> 块的项目，不受默认 <code>12</code> 块总数限制。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>BlockConfigBlockCount</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample1").ClientID %>' title="第 1 个面板">第 1 个面板</strong>）：初始为<code>20</code>，指定当前子项在相应宽度区间占用的块数，未达到临界值时使用较小区间的设置。</li>
        <li><code>BlockMD</code>（本页各面板，如<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample2").ClientID %>' title="第 2 个面板（4）">第 2 个面板（4）</strong>）：各组分别设为<code>4</code>、<code>10</code>、<code>20</code>，指定当前子项在相应宽度区间占用的块数，未达到临界值时使用较小区间的设置。</li>
    </ul>
</section>
</template>
</body>
</html>
