<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vbox_hbox.aspx.cs" Inherits="FineUI.Pro.Examples.layout.vbox_hbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" AutoSizePanelID="Panel2" />
        <f:Panel ID="Panel2" Margin="24px" runat="server" ShowBorder="true" Layout="VBox" ShowHeader="true" Title="面板（改变页面大小来观察面板的变化）" BodyPadding="5">
            <Items>
                <f:Panel ID="Panel1" BoxFlex="1" runat="server" ShowBorder="false" ShowHeader="false" Layout="HBox" BoxConfigSpace="5" MarginBottom="5">
                    <Items>
                        <f:Panel ID="Panel3" BoxFlex="1" runat="server" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label1" runat="server" Text="Label1">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Panel ID="Panel4" BoxFlex="1" runat="server" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label2" runat="server" Text="Label2">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Panel ID="Panel6" BoxFlex="1" runat="server" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label3" runat="server" Text="Label3">
                                </f:Label>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel5" BoxFlex="1" runat="server" ShowBorder="false" ShowHeader="false" Layout="HBox" BoxConfigSpace="5">
                    <Items>
                        <f:Panel ID="Panel7" BoxFlex="1" runat="server" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label4" runat="server" Text="Label4">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Panel ID="Panel8" BoxFlex="1" runat="server" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label5" runat="server" Text="Label5">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Panel ID="Panel9" BoxFlex="1" runat="server" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label6" runat="server" Text="Label6">
                                </f:Label>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:Panel>

            </Items>
        </f:Panel>

    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示嵌套纵向和横向盒布局，平分当前页面。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照布局与尺寸变化</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel2").ClientID %>' title="面板（改变页面大小来观察面板的变化）">面板（改变页面大小来观察面板的变化）</strong>中同时改变浏览器宽度与高度。<br />结果：外层与内层分别按自己的方向平分空间，各组边界随页面尺寸调整。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Layout</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel2").ClientID %>' title="面板（改变页面大小来观察面板的变化）">面板（改变页面大小来观察面板的变化）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="第 2 个面板">第 2 个面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>' title="第 6 个面板">第 6 个面板</strong>）：各组分别设为<code>VBox</code>、<code>HBox</code>，父容器使用本页对应的布局方式，决定其直接子项的排列。</li>
        <li><code>BoxFlex</code>（本页各面板，如<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="第 2 个面板">第 2 个面板</strong>）：初始为<code>1</code>，直接子项按此比例分配父容器剩余空间。</li>
    </ul>
</section>
</template>
</body>
</html>
