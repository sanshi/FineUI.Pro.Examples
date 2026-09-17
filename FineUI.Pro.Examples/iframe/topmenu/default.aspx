<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="FineUI.Pro.Examples.iframe.topmenu._default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>顶部菜单框架（左侧树）</title>
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
                                        IconAlign="Top" IconFont="EnvelopeO" OnClick="btnMail_Click" EnableDefaultState="false" EnableDefaultCorner="false">
                                    </f:Button>
                                    <f:Button runat="server" CssClass="icontopaction topmenu menu-sms" ID="btnSMS" Text="短信收发"
                                        IconAlign="Top" IconFont="MobilePhone" OnClick="btnSMS_Click" EnableDefaultState="false" EnableDefaultCorner="false">
                                    </f:Button>
                                    <f:Button runat="server" CssClass="icontopaction topmenu menu-sys" ID="btnSYS" Text="系统管理"
                                        IconAlign="Top" IconFont="Cog" OnClick="btnSYS_Click" EnableDefaultState="false" EnableDefaultCorner="false">
                                    </f:Button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </f:ContentPanel>
                <f:Tree runat="server" ID="leftTree" CssClass="leftregion bgpanel" RegionPosition="Left" RegionSplit="false" EnableCollapse="false"
                    Width="260px" Title="系统菜单" ShowBorder="true" ShowHeader="false" EnableNodeHyperLink="true"
                    HeaderStyle="true" AllHeaderStyle="true" ExpanderToRight="true"
                    EnableSingleClickExpand="true" HideHScrollbar="true" HideVScrollbar="true">
                </f:Tree>
                <f:Panel ID="mainPanel" CssClass="centerregion" ShowHeader="false" RegionPosition="Center" ShowBorder="true"
                    EnableIFrame="true" IFrameName="mainframe" runat="server">
                </f:Panel>
            </Items>
        </f:Panel>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/iframe/topmenu/data/menuMail.xml"></asp:XmlDataSource>
    </form>

    <script>
        var leftTreeID = '<%= leftTree.ClientID %>';
        var mainPanelID = '<%= mainPanel.ClientID %>';

        function selectMenu(menuClassName) {
            // 选中当前菜单
            $('#header .topmenu').removeClass('f-state-active');
            $('#header .topmenu.' + menuClassName).addClass('f-state-active');


            // 展开树的第一个节点，并选中第一个节点下的第一个子节点（在右侧IFrame中打开）
            var tree = F(leftTreeID);
            var treeFirstChild = tree.getRootNode().children[0];

            // 展开第一个节点（如果想要展开全部节点，调用 tree.expandNodes();）
            tree.expandNode(treeFirstChild);

            // 选中第一个链接节点，并在右侧IFrame中打开此链接
            var treeFirstLink = treeFirstChild.children[0];
            tree.selectNode(treeFirstLink);

            // 在主区域内打开链接
            F(mainPanelID).setIFrameUrl(treeFirstLink.href);

        }

        F.ready(function () {

            if (!F(leftTreeID)) return;

            selectMenu('menu-mail');


        });
    </script>
</body>
</html>
