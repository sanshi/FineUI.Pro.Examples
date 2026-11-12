<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="only_md.aspx.cs" Inherits="FineUI.Pro.Examples.block.only_md" %>

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
                <f:Panel ID="PanelExample2" ClientIDMode="Static" CssClass="custompanel" BlockMD="3"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="1">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockMD="3"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="2">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockMD="3"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="3">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockMD="3"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="4">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockMD="9"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="5">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockMD="3"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="6">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockMD="6"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="7">
                </f:Panel>
                <f:Panel CssClass="custompanel" BlockMD="6"
                    runat="server" ShowBorder="true" ShowHeader="true" Title="8">
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示低于桌面临界值时把水平项目层叠排列。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>调整宽度比较排列</h3>
    <ul>
        <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample1").ClientID %>' title="第 1 个面板">第 1 个面板</strong>，先使用桌面宽度，再缩小到手机宽度。<br />结果：桌面按配置分列；较窄屏幕下各项目改为上下层叠。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>BlockMD</code>（本页各面板，如<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample2").ClientID %>' title="1">1</strong>）：各组分别设为<code>3</code>、<code>9</code>、<code>6</code>，指定当前子项在相应宽度区间占用的块数，未达到临界值时使用较小区间的设置。</li>
    </ul>
</section>
</template>
</body>
</html>
