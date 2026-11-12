<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_bgimage.aspx.cs" Inherits="FineUI.Pro.Examples.panel.panel_bgimage" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">
        <style>
            .mybgpanel>.f-panel-bodyct>.f-panel-body {
                background-position: right bottom;
                background-repeat: no-repeat;
            }

            .mybgpanel.bg1>.f-panel-bodyct>.f-panel-body {
                background-color: #B1EEEF;
                background-image: url('<%= PageContext.ResolveUrl("~/res/images/bg/1.jpg") %>');
            }

            .mybgpanel.bg2>.f-panel-bodyct>.f-panel-body {
                background-color: #D9CAB5;
                background-image: url('<%= PageContext.ResolveUrl("~/res/images/bg/2.jpg") %>');
            }

            .mybgpanel.bg3>.f-panel-bodyct>.f-panel-body {
                background-color: #FEF3D5;
                background-image: url('<%= PageContext.ResolveUrl("~/res/images/bg/3.jpg") %>');
            }

            .mybgpanel.bg4>.f-panel-bodyct>.f-panel-body {
                background-color: #E4ECA1;
                background-image: url('<%= PageContext.ResolveUrl("~/res/images/bg/4.jpg") %>');
            }

            .mybgpanel.bg5>.f-panel-bodyct>.f-panel-body {
                background-color: #7FC1C0;
                background-image: url('<%= PageContext.ResolveUrl("~/res/images/bg/5.jpg") %>');
            }

            .mybgpanel.bg6>.f-panel-bodyct>.f-panel-body {
                background-color: #9BD1DB;
                background-image: url('<%= PageContext.ResolveUrl("~/res/images/bg/6.jpg") %>');
            }

        </style>
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" runat="server" CssClass="mybgpanel bg1" BodyPadding="24px" AutoScroll="true" ShowBorder="false" EnableCollapse="false"
            Layout="Column" ShowHeader="false">
            <Items>
                <f:Panel ID="Panel24" ColumnWidth="50%" runat="server" ShowBorder="false" ShowHeader="false" MarginRight="5px">
                    <Items>
                        <f:Panel ID="Panel25" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false" MarginBottom="5px">
                            <Content>
                                本页面背景图片每 5 秒更换一次！<br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel26" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false" MarginBottom="5px">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel28" ColumnWidth="50%" runat="server" ShowBorder="false" ShowHeader="false">
                    <Items>
                        <f:Panel ID="Panel29" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false" MarginBottom="5px">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel30" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false" MarginBottom="5px">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
    <script>
        var panel1ClientID = '<%= Panel1.ClientID %>';

        F.ready(function() {

            var panel1El = F(panel1ClientID).el;

            window.setInterval(function() {
                var bgClsExec = /\bbg(\d+)\b/ig.exec(panel1El.attr('class'));
                if (bgClsExec && bgClsExec.length === 2) {
                    var bgNumber = parseInt(bgClsExec[1], 10);

                    panel1El.removeClass('bg' + bgNumber);

                    bgNumber++;
                    if (bgNumber > 6) {
                        bgNumber = 1;
                    }
                    panel1El.addClass('bg' + bgNumber);
                }
            }, 5000);

        });

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示给页面面板铺设背景图片，并按定时器轮换背景样式。</p>
    <h3><i class="f-iconfont f-iconfont-pic" aria-hidden="true"></i>等待背景轮换</h3>
    <ul>
        <li>打开页面，在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="第 1 个面板">第 1 个面板</strong>等待超过 <code>5</code> 秒。<br />结果：背景切到本页下一张图片，前景面板与内容继续保留；随后按相同间隔轮换。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>CssClass</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="第 1 个面板">第 1 个面板</strong>）：设为<code>mybgpanel bg1</code>，把本页背景类应用于外层面板。</li>
        <li><code>setInterval()</code>（<strong>背景轮换脚本</strong>）：本页每 <code>5</code> 秒切换一次背景类，不重新创建前景控件。</li>
    </ul>
</section>
</template>
</body>
</html>
