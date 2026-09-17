<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_bgimage.aspx.cs" Inherits="FineUI.Pro.Examples.panel.panel_bgimage" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .mybgpanel > .f-panel-bodyct > .f-panel-body {
            background-position: right bottom;
            background-repeat: no-repeat;
        }

        .mybgpanel.bg1 > .f-panel-bodyct > .f-panel-body {
            background-color: #B1EEEF;
            background-image: url(../res/images/bg/1.jpg);
        }

        .mybgpanel.bg2 > .f-panel-bodyct > .f-panel-body {
            background-color: #D9CAB5;
            background-image: url(../res/images/bg/2.jpg);
        }

        .mybgpanel.bg3 > .f-panel-bodyct > .f-panel-body {
            background-color: #FEF3D5;
            background-image: url(../res/images/bg/3.jpg);
        }

        .mybgpanel.bg4 > .f-panel-bodyct > .f-panel-body {
            background-color: #E4ECA1;
            background-image: url(../res/images/bg/4.jpg);
        }

        .mybgpanel.bg5 > .f-panel-bodyct > .f-panel-body {
            background-color: #7FC1C0;
            background-image: url(../res/images/bg/5.jpg);
        }

        .mybgpanel.bg6 > .f-panel-bodyct > .f-panel-body {
            background-color: #9BD1DB;
            background-image: url(../res/images/bg/6.jpg);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" runat="server" CssClass="mybgpanel bg1" BodyPadding="24px" AutoScroll="true" ShowBorder="false" EnableCollapse="false"
            Layout="Column" ShowHeader="false">
            <Items>
                <f:Panel ID="Panel24" ColumnWidth="50%" runat="server" ShowBorder="false" ShowHeader="false" MarginRight="5px">
                    <Items>
                        <f:Panel ID="Panel25" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="false" MarginBottom="5px">
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
                        <f:Panel ID="Panel26" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="false" MarginBottom="5px">
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
                        <f:Panel ID="Panel29" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="false" MarginBottom="5px">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel30" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="false" MarginBottom="5px">
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

        F.ready(function () {

            var panel1El = F(panel1ClientID).el;

            window.setInterval(function () {
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
</body>
</html>
