<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accordion_tool.aspx.cs" Inherits="FineUI.Pro.Examples.accordion.accordion_tool" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Accordion ID="Accordion1" IsFluid="true" Title="手风琴控件" ShowHeader="false" runat="server" Height="500px"
            ShowBorder="true" ActivePaneIndex="1" EnableCollapse="false">
            <Panes>
                <f:AccordionPane ID="AccordionPane1" runat="server" Title="面板一" IconUrl="~/res/images/16/1.png"
                    BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label1" Text="面板一中的文本" runat="server">
                        </f:Label>
                    </Items>
                    <Tools>
                        <f:Tool runat="server" IconFont="_Gear" ToolTip="设置" ClickHandler="onToolIconClick"></f:Tool>
                        <f:Tool runat="server" IconFont="_Download" ToolTip="下载" ClickHandler="onToolIconClick"></f:Tool>
                    </Tools>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane2" runat="server" Title="面板二" IconUrl="~/res/images/16/4.png"
                    BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label2" Text="面板二中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane3" runat="server" Title="面板三" IconUrl="~/res/images/16/7.png"
                    BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label3" Text="面板三中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
            </Panes>
        </f:Accordion>
        <br />
        <f:Button ID="Button1" Text="获取当前展开的面板" runat="server" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button2" Text="展开下一个面板" runat="server" OnClick="Button2_Click">
        </f:Button>
    </form>
    <script>

        function onToolIconClick(event) {
            
            // 当前点击的图标字体
            var iconFont = this.iconFont;

            F.notify({
                message: '你点击了标题栏工具图标：' + iconFont,
                messageIconFont: iconFont,
                displayMilliseconds: 3000,
                positionX: 'center',
                positionY: 'center'
            });


            // 阻止事件向上传播（点击工具图标时不会折叠展开面板）
            event.stopPropagation();
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示在手风琴面板标题中加入自定义工具图标，并独立处理点击。</p>
    <h3><i class="f-iconfont f-iconfont-edit" aria-hidden="true"></i>点击标题工具</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Accordion1").ClientID %>' title="手风琴控件">手风琴控件</strong>面板标题中点击齿轮工具图标。<br />结果：执行本页配置的工具动作并显示提示，不会把点击误作普通的面板标题切换。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Tools</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("AccordionPane1").ClientID %>' title="面板一">面板一</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("AccordionPane2").ClientID %>' title="面板二">面板二</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("AccordionPane3").ClientID %>' title="面板三">面板三</strong>）：为对应面板标题追加自定义工具。</li>
        <li><code>handler</code>（<strong>标题工具图标</strong>）：工具点击时执行本页提示逻辑，与面板展开动作分开。</li>
    </ul>
</section>
</template>
</body>
</html>
