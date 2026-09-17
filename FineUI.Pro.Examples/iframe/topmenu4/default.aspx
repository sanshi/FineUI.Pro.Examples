<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="FineUI.Pro.Examples.iframe.topmenu4._default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>顶部菜单框架（中间区域选项卡）</title>
    <meta name="sourcefiles" content="~/iframe/topmenu4/leftmenu.aspx;~/iframe/topmenu4/data/menuMail.xml;~/iframe/topmenu4/data/menuSMS.xml;~/iframe/topmenu4/data/menuSYS.xml;" />
    <style>
        .centerregion {
            border-left-width: 0;
        }

        #header table {
            width: 100%;
            border-spacing: 0;
            border-collapse: collapse;
        }

            #header table td {
                padding: 0;
            }


        #header .logotd {
            
        }

        #header .actionstd {
            text-align: right;
        }


        #header .logo {
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
            display: inline-block;
            vertical-align: middle;
            margin: 0 10px;
        }



        #header .f-btn {
            border-width: 0;
            padding: 10px;
        }

        #header .icontopaction .f-btn-icon {
            width: 24px;
            font-size: 24px;
            line-height: 24px;
            height: 24px;
        }

        #header .icontopaction .f-btn-text {
            font-size: 12px;
            line-height: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="RegionPanel1" runat="server"></f:PageManager>
        <f:Panel ID="RegionPanel1" CssClass="mainpanel" Layout="Region" ShowBorder="false" ShowHeader="false" runat="server">
            <Items>
                <f:ContentPanel ID="topPanel" CssClass="topregion bgpanel" RegionPosition="Top" ShowBorder="false" ShowHeader="false" EnableCollapse="false" runat="server">
                    <div id="header" class="f-widget-header f-mainheader">
                        <table>
                            <tr>
                                <td class="logotd">
                                    <a class="logo" href="./default.aspx" title="集团财务管控系统">集团财务管控系统
                                    </a>
                                </td>
                                <td class="actionstd">
                                    <f:Button runat="server" CssClass="icontopaction topmenu menu-mail f-state-active" ID="btnMail" Text="邮件收发" 
                                        IconAlign="Top" IconFont="EnvelopeO" EnableDefaultState="false" EnableDefaultCorner="false">
                                    </f:Button>
                                    <f:Button runat="server" CssClass="icontopaction topmenu menu-sms" ID="btnSMS" Text="短信收发" 
                                        IconAlign="Top" IconFont="MobilePhone" EnableDefaultState="false" EnableDefaultCorner="false">
                                    </f:Button>
                                    <f:Button runat="server" CssClass="icontopaction topmenu menu-sys" ID="btnSYS" Text="系统管理" 
                                        IconAlign="Top" IconFont="Cog" EnableDefaultState="false" EnableDefaultCorner="false">
                                    </f:Button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </f:ContentPanel>
                <f:Panel runat="server" ID="leftPanel" CssClass="leftregion" RegionPosition="Left" RegionSplit="false" EnableCollapse="false"
                    Width="260px" Title="系统菜单" ShowBorder="true" ShowHeader="false" EnableIFrame="true" IFrameName="leftframe" IFrameUrl="./leftmenu.aspx">
                </f:Panel>
                <f:TabStrip ID="mainTabStrip" CssClass="centerregion" ShowInkBar="true" RegionPosition="Center" EnableTabCloseMenu="true" ShowBorder="true" runat="server">
                    <Tabs>
                        <f:Tab ID="Tab1" Title="首页" Layout="Fit" Icon="House" CssClass="maincontent" runat="server">
                            <Items>
                                <f:ContentPanel ID="ContentPanel1" ShowBorder="false" BodyPadding="10px" ShowHeader="false" AutoScroll="true"
                                    runat="server">
                                    首页内容
                                </f:ContentPanel>
                            </Items>
                        </f:Tab>
                    </Tabs>
                </f:TabStrip>
            </Items>
        </f:Panel>
    </form>

    <script>
        var mainTabStripClientID = '<%= mainTabStrip.ClientID %>';
        var leftPanelID = '<%= leftPanel.ClientID %>';

        F.ready(function () {

            var menuLis = $('#header .topmenu');

            function updateLeftMenu(menuType) {

                menuLis.removeClass('f-state-active');
                menuLis.filter('.menu-' + menuType).addClass('f-state-active');

                // 在左侧区域内打开链接
                F(leftPanelID).setIFrameUrl('./leftmenu.aspx?menu=' + encodeURIComponent(menuType));
            }

            // 点击顶部菜单，加载左侧IFrame菜单
            menuLis.click(function (e) {
                var cnode = $(this);
                var classNames = /menu\-(\w+)/.exec(cnode.attr('class'));
                if (classNames.length == 2) {
                    var menuType = classNames[1];

                    updateLeftMenu(menuType);
                }
            });

            // 根据页面的Hash值，来初始化左侧IFrame菜单
            var hash = window.location.hash;
            var hashArray = /.+\/html\/(.+)\-\d+\.html/.exec(hash);
            if (hashArray && hashArray.length === 2) {
                updateLeftMenu(hashArray[1]);
            } else {
                updateLeftMenu('mail');
            }


            window.initTreeTabStrip = function (tree) {
                // 初始化主框架中的树(或者Accordion+Tree)和选项卡互动，以及地址栏的更新
                // treeMenu： 主框架中的树控件实例，或者内嵌树控件的手风琴控件实例
                // mainTabStrip： 选项卡实例
                // updateHash: 切换Tab时，是否更新地址栏Hash值（默认值：true）
                // refreshWhenExist： 添加选项卡时，如果选项卡已经存在，是否刷新内部IFrame（默认值：false）
                // refreshWhenTabChange: 切换选项卡时，是否刷新内部IFrame（默认值：false）
                // maxTabCount: 最大允许打开的选项卡数量
                // maxTabMessage: 超过最大允许打开选项卡数量时的提示信息
                // beforeNodeClick: 节点点击事件之前执行（返回false则不执行点击事件）
                F.initTreeTabStrip(tree, F(mainTabStripClientID));
            };


        });


    </script>
</body>
</html>
