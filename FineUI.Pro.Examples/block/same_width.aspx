<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="same_width.aspx.cs" Inherits="FineUI.Pro.Examples.block.same_width" %>

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
        <f:Panel ID="PanelExample1" ClientIDMode="Static" IsFluid="true" runat="server"
            Layout="Block" BlockConfigSpace="20px" ShowBorder="false" ShowHeader="false">
            <Items>
                <f:Panel ID="PanelExample2" ClientIDMode="Static" CssClass="custompanel" BlockSM="6" BlockMD="4" BlockLG="3"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="1">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockSM="6" BlockMD="4" BlockLG="3"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="2">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockSM="6" BlockMD="4" BlockLG="3"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="3">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockSM="6" BlockMD="4" BlockLG="3"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="4">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockSM="6" BlockMD="4" BlockLG="3"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="5">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockSM="6" BlockMD="4" BlockLG="3"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="6">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockSM="6" BlockMD="4" BlockLG="3"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="7">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockSM="6" BlockMD="4" BlockLG="3"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="8">
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示让同一行的可伸展项目等比例分配宽度。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>调整宽度比较排列</h3>
    <ul>
        <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample1").ClientID %>' title="第 1 个面板">第 1 个面板</strong>，改变浏览器宽度，对照同一行各块宽度。<br />结果：同组项目保持等宽，合计占满本页可用行宽。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Block</code>（本页各面板，如<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample2").ClientID %>' title="1">1</strong>）：子项在默认宽度区间占用的列数。</li>
    </ul>
</section>
</template>
</body>
</html>
