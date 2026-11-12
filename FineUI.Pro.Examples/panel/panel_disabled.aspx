<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_disabled.aspx.cs" Inherits="FineUI.Pro.Examples.panel.panel_disabled" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" Title="面板" Enabled="false"
            BodyPadding="10px" EnableCollapse="false" IconFont="_VolumeUp">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Position="Bottom" runat="server">
                    <Items>
                        <f:ToolbarText Text="工具条文本一" ID="ToolbarText1" runat="server">
                        </f:ToolbarText>
                        <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                        </f:ToolbarSeparator>
                        <f:ToolbarText Text="工具条文本二" ID="ToolbarText2" runat="server">
                        </f:ToolbarText>
                        <f:ToolbarSeparator ID="ToolbarSeparator2" runat="server">
                        </f:ToolbarSeparator>
                        <f:Button ID="btnToolbarButton" Text="工具条按钮" runat="server" ClickHandler="onToolbarButtonClick">
                        </f:Button>
                        <f:ToolbarFill ID="ToolbarFill1" runat="server">
                        </f:ToolbarFill>
                        <f:ToolbarText Text="工具条文本四" ID="ToolbarText4" runat="server">
                        </f:ToolbarText>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:ContentPanel ID="ContentPanel1" Title="内容面板" ShowBorder="true" Height="200px"
                    BodyPadding="10px" EnableCollapse="false" ShowHeader="true"
                    runat="server">
                    可以在此放置Asp.Net控件或者<a href="http://www.w3schools.com/html/" target="_blank">HTML</a>标签。
                </f:ContentPanel>
            </Items>
        </f:Panel>
        <br />
        <f:Button ID="Button2" CssClass="marginr" Text="启用/禁用面板" runat="server" OnClick="Button2_Click">
        </f:Button>

    </form>
    <script>

        function onToolbarButtonClick(event) {
            F.alert({
                message: '你点击了工具栏按钮',
                messageIcon: 'information'
            });
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示初始禁用整个面板，并由面板外的按钮恢复或再次禁用。</p>
    <h3><i class="f-iconfont f-iconfont-check" aria-hidden="true"></i>切换整个面板的可用状态</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="启用/禁用面板">启用/禁用面板</strong>。<br />结果：后台启用原先禁用的面板，内部工具栏和内容恢复可操作。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="启用/禁用面板">启用/禁用面板</strong>。<br />结果：整个面板再次禁用，内部控件不再接受普通用户操作，内容仍保留。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Enabled</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板">面板</strong>）：初始设为<code>false</code>，外层面板初始设为 <code>false</code>，影响它内部的交互区域。</li>
    </ul>
</section>
</template>
</body>
</html>
