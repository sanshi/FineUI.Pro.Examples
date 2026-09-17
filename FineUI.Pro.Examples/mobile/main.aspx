<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.main" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .mywindow,
        .mywindow > .f-panel-bodyct > .f-panel-body {
            background-image: none;
            background-color: transparent;
            -moz-box-shadow: none;
            -webkit-box-shadow: none;
            box-shadow: none;
        }

        .themepanel > .f-panel-bodyct > .f-panel-body {
            background: none;
            background-color: #000;
        }

        #themecontainer {
            background: none;
            background-color: #000;
            padding-top: 5px;
        }

            #themecontainer ul {
                list-style-type: none;
                margin: 10px 0 0;
                padding: 0;
            }

                #themecontainer ul li {
                    display: inline-block;
                    margin: 0 0 10px 10px;
                    padding: 0;
                }

                    #themecontainer ul li .title {
                        text-align: center;
                        color: #666;
                        font-size: 12px;
                        display: none;
                    }

                    #themecontainer ul li.hover,
                    #themecontainer ul li.active {
                        border-bottom-color: #fff;
                    }

                        #themecontainer ul li.hover .title,
                        #themecontainer ul li.active .title {
                            color: #fff;
                            font-weight: bold;
                        }

                    #themecontainer ul li img {
                        width: 75px;
                        border-radius: 5px;
                    }

            #themecontainer .grouptitle {
                color: #ccc;
                font-size: 16px;
                border-bottom: solid 1px #333;
                padding: 5px;
                margin: 10px;
                margin-top: 0;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" CssClass="mypanel" IsViewPort="true" AutoScroll="true"
            ShowBorder="false" ShowHeader="false" runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Title="FineUI.Pro 移动示例" runat="server" ToolbarAlign="Right" HeaderStyle="true">
                    <Items>
                        <f:Button ID="Button1" runat="server" Size="Small"
                            IconFont="_MoreVertical" ShowMenuIcon="false" EnableDefaultState="false">
                            <Menu runat="server">
                                <f:MenuButton runat="server" Text="主题仓库" ClickHandler="onThemeSelectClick"></f:MenuButton>
                                <f:MenuSeparator runat="server"></f:MenuSeparator>
                                <f:MenuButton runat="server" Text="示例首页"
                                    ClickHandler="onBackToHomeClick">
                                </f:MenuButton>
                            </Menu>
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:DataList runat="server" ID="DataList1" CssClass="mydatalist">
                </f:DataList>
            </Items>
        </f:Panel>
        <f:Panel ID="Panel2" CssClass="mypanel" runat="server" ShowHeader="false" ShowBorder="false" Hidden="true"
            IsViewPort="true" AutoScroll="true">
            <Toolbars>
                <f:Toolbar ID="Toolbar2" runat="server" HeaderStyle="true">
                    <Items>
                        <f:Button ID="Button4" runat="server" Size="Small" Text="后退" ClickHandler="onBacktoPanel1Click"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:DataList runat="server" ID="DataList2" CssClass="mydatalist">
                </f:DataList>
            </Items>
        </f:Panel>
        <f:Panel ID="Panel3" CssClass="mypanel" runat="server" ShowHeader="false" ShowBorder="false" Hidden="true"
            IsViewPort="true" AutoScroll="true">
            <Toolbars>
                <f:Toolbar ID="Toolbar3" runat="server" HeaderStyle="true">
                    <Items>
                        <f:Button ID="Button2" runat="server" Size="Small" Text="后退" ClickHandler="onBacktoPanel2Click"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:DataList runat="server" ID="DataList3">
                </f:DataList>
            </Items>
        </f:Panel>
        <f:Window runat="server" ID="Window1" CssClass="mywindow" ShowHeader="false" ShowBorder="false" Hidden="true" HideOnMaskClick="true"
            IsModal="true" BodyPadding="10px" Layout="VBox" PercentWidth="100%" EnableDefaultCorner="false" PositionY="Bottom">
            <Items>
                <f:ContentPanel ID="ContentPanel1" CssClass="themepanel" Height="200px" AutoScroll="true" ShowHeader="false" runat="server">
                    <div id="themecontainer">
                        <div class="grouptitle">
                            Pure
                        </div>
                        <ul>
                            <li>
                                <a href="javascript:;">
                                    <img src="../res/images/themes/pure_black.png" alt="Pure Black" data-value="Pure_Black" />
                                </a>
                                <div class="title">Pure Black</div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../res/images/themes/pure_green.png" alt="Pure Green" data-value="Pure_Green" />
                                </a>
                                <div class="title">Pure Green</div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../res/images/themes/pure_blue.png" alt="Pure Blue" data-value="Pure_Blue" />
                                </a>
                                <div class="title">Pure Blue</div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../res/images/themes/pure_purple.png" alt="Pure Purple" data-value="Pure_Purple" />
                                </a>
                                <div class="title">Pure Purple</div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../res/images/themes/pure_orange.png" alt="Pure Orange" data-value="Pure_Orange" />
                                </a>
                                <div class="title">Pure Orange</div>
                            </li>
                        </ul>
                        <div class="grouptitle">
                            jQuery UI
                        </div>
                        <ul>
                            <li>
                                <a href="javascript:;">
                                    <img src="../res/images/themes/cupertino.png" alt="Cupertino" data-value="Cupertino" /></a>
                                <div class="title">Cupertino</div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../res/images/themes/start.png" alt="Start" data-value="Start" /></a>
                                <div class="title">Start</div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../res/images/themes/dark_hive.png" alt="Dark Hive" data-value="Dark_Hive" /></a>
                                <div class="title">Dark Hive</div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../res/images/themes/flick.png" alt="Flick" data-value="Flick" /></a>
                                <div class="title">Flick</div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../res/images/themes/south_street.png" alt="South Street" data-value="South_Street" /></a>
                                <div class="title">South Street</div>
                            </li>
                        </ul>
                    </div>
                </f:ContentPanel>
            </Items>
        </f:Window>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" EnableCaching="false" DataFile="~/res/menu.xml"></asp:XmlDataSource>
    </form>
    <script>

        var panel1ClientID = '<%= Panel1.ClientID %>';
        var dataList1ClientID = '<%= DataList1.ClientID %>';

        var panel2ClientID = '<%= Panel2.ClientID %>';
        var dataList2ClientID = '<%= DataList2.ClientID %>';
        var toolbar2ClientID = '<%= Toolbar2.ClientID %>';

        var panel3ClientID = '<%= Panel3.ClientID %>';
        var dataList3ClientID = '<%= DataList3.ClientID %>';
        var toolbar3ClientID = '<%= Toolbar3.ClientID %>';

        var window1ClientID = '<%= Window1.ClientID %>';



        // 从二级菜单返回
        function onBacktoPanel1Click(event) {
            // 改变网址的HASH值（hashchange驱动页面变化）
            window.location.hash = '';

            // 仅在桌面版Chrome出现的问题：改变当前页的哈希值为空时，父页面的滚动条会改变
            if (F.isChrome()) {
                parent && parent.$('body').scrollTop(0);
            }
        }

        // 从三级菜单返回
        function onBacktoPanel2Click(event) {
            // 改变网址的HASH值（hashchange驱动页面变化）
            var level = decodeURIComponent(window.location.hash.substr(1));
            var levelItems = level.split('-');
            if (levelItems.length) {
                window.location.hash = levelItems[0];
            }

            // 仅在桌面版Chrome出现的问题：改变当前页的哈希值为空时，父页面的滚动条会改变
            if (F.isChrome()) {
                parent && parent.$('body').scrollTop(0);
            }
        }


        // 显示主题设置窗体
        function onThemeSelectClick(event) {
            F(window1ClientID).show();
        }

        function getMenu(level) {
            var data;
            if (level) {
                var levelItems = level.split('-');
                if (levelItems.length === 1) {
                    data = MENUSOURCE[levelItems[0]];
                } else {
                    data = MENUSOURCE[levelItems[0]].children[levelItems[1]];
                }
            }
            return data;
        }

        function getMenuData(level) {
            var children, data = getMenu(level);
            if (!data) {
                children = MENUSOURCE;
            } else {
                children = data.children;
            }

            var subMenus = [];
            $.each(children, function (index, menu) {
                // fields: ['text', 'href', 'hrefTarget', 'arrow', 'level']
                subMenus.push([menu.text, menu.navigateUrl, '_self', true, level ? (level + '-' + index) : index]);
            });
            return subMenus;
        }



        function checkHashChange() {
            // 根据HASH值在顶层菜单和二级菜单之间切换
            var level = decodeURIComponent(window.location.hash.substr(1));
            var visiblePanelID = $('.mypanel:visible').attr('id');

            if (!level) {
                // 返回顶级菜单
                F.slideRight(visiblePanelID, panel1ClientID);
            } else {
                var levelItems = level.split('-');
                var levelMenuText = getMenu(level).text;

                if (levelItems.length === 1) {
                    // 设置二级菜单的标题
                    F(toolbar2ClientID).setTitle(levelMenuText);

                    // 绑定二级菜单
                    F(dataList2ClientID).fields = ['text', 'href', 'hrefTarget', 'arrow', 'level'];
                    F(dataList2ClientID).loadData(getMenuData(level));

                    // 转到二级菜单
                    if (visiblePanelID === panel3ClientID) {
                        F.slideRight(visiblePanelID, panel2ClientID);
                    } else {
                        F.slideLeft(visiblePanelID, panel2ClientID);
                    }
                } else {
                    // 设置三级菜单的标题
                    F(toolbar3ClientID).setTitle(levelMenuText);

                    // 绑定三级菜单
                    F(dataList3ClientID).fields = ['text', 'href', 'hrefTarget', 'arrow', 'level'];
                    F(dataList3ClientID).loadData(getMenuData(level));

                    // 转到三级菜单
                    F.slideLeft(visiblePanelID, panel3ClientID);
                }
            }
        }



        F.ready(function () {

            var dataList1 = F(dataList1ClientID);

            // 社区版不支持DataList
            if (!dataList1) {
                return;
            }

            // 点击一级菜单和二级菜单
            $('.mydatalist').on('click', '.f-datalist-item', function (event) {
                var itemEl = $(this), datalist = F(itemEl.closest('.f-datalist').attr('id'));
                var itemData = datalist.getItemData(itemEl);

                // 这是一个目录，则改变网址的HASH值（hashchange驱动页面变化）
                if (!itemData.href) {
                    window.location.hash = '#' + encodeURIComponent(itemData.level);
                }
            });

            // 绑定一级菜单
            dataList1.fields = ['text', 'href', 'hrefTarget', 'arrow', 'level'];
            dataList1.loadData(getMenuData(''));



            // 页面第一次加载时，转到二级菜单不需要动画效果
            F.noAnimation(function () {
                checkHashChange();
            });


            // hashchange驱动页面变化
            $(window).on('hashchange', function (event) {
                checkHashChange();
            });


            // 选中某个主题
            $('#themecontainer li').on('click', function (event) {
                var imgNode = $(this).find('img');

                var themeName = imgNode.attr('data-value');
                F.cookie('Theme', themeName, {
                    expires: 100  // 单位：天
                });

                var themeTitle = imgNode.attr('alt');
                F.cookie('Theme_Title', themeTitle, {
                    expires: 100  // 单位：天
                });

                top.window.location.reload();
            });
        });

        function onBackToHomeClick(event) {
            top.window.location.href='../';
        }

    </script>
</body>
</html>
