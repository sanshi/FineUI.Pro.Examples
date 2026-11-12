<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="FineUI.Pro.Examples.block.dashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/css/dashboard.css;~/res/css/responsive-card.css;~/res/js/responsive-card.js" />
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">

        <link rel="stylesheet" id="linkDashboardCSS" href="<%= PageContext.ResolveUrl("~/res/css/dashboard.css?v" + GlobalConfig.ProductVersion) %>" />
        <link href="<%= PageContext.ResolveUrl("~/res/css/responsive-card.css") %>" rel="stylesheet" />
    </asp:PlaceHolder>
</head>
<body class="f-body-darkerbg">
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" EnableWatermark="true" WatermarkText="I❤︎FineUI" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" Layout="Block" BlockConfigSpace="20px" ShowBorder="false" ShowHeader="false">
            <Items>
                <f:ContentPanel ID="ContentPanelExample1" ClientIDMode="Static" BlockMD="6" BlockLG="3" runat="server" ShowBorder="true" ShowBorderShadow="true" ShowHeader="false">
                    <div class="mycard">
                        <div class="title">
                            今日浏览量
                            <i class="f-icon f-iconfont f-iconfont-info infoicon"></i>
                        </div>
                        <div class="number">
                            12,000
                        </div>
                        <div class="chart">
                            <f:Chart ID="ChartCardViews" runat="server" Height="60px" DataCategoryField="Category" Compact="true">
                                <Series>
                                    <f:ChartSeries Key="views" Type="Bar" Name="浏览量" DataValueField="Views" />
                                </Series>
                            </f:Chart>
                        </div>
                        <div class="footer f-widget-content">
                            日均浏览量 15,000
                        </div>
                    </div>
                    <div class="mycard" style="display: none;">
                        <div class="title">
                            今日浏览量
                            <i class="f-icon f-iconfont f-iconfont-info infoicon"></i>
                        </div>
                        <div class="desc">
                            今日浏览量的详细描述。
                            <br />
                            FineUI 是基于 jQuery 的专业 ASP.NET WebForms/Core 控件库。
                        </div>
                    </div>
                </f:ContentPanel>
                <f:ContentPanel ID="ContentPanelExample2" ClientIDMode="Static" BlockMD="6" BlockLG="3" runat="server" ShowBorder="true" ShowBorderShadow="true" ShowHeader="false">
                    <div class="mycard">
                        <div class="title">
                            今日独立IP
                            <i class="f-icon f-iconfont f-iconfont-info infoicon"></i>
                        </div>
                        <div class="number">
                            800
                        </div>
                        <div class="chart">
                            <f:Chart ID="ChartCardTrend" runat="server" Height="60px" DataCategoryField="Category" Compact="true">
                                <Series>
                                    <f:ChartSeries Key="views" Type="Area" Name="独立 IP" DataValueField="Views" Smooth="true" ShowSymbol="true" />
                                </Series>
                            </f:Chart>
                        </div>
                        <div class="footer f-widget-content">
                            日均独立IP 900
                        </div>
                    </div>
                    <div class="mycard" style="display: none;">
                        <div class="title">
                            今日独立IP
                            <i class="f-icon f-iconfont f-iconfont-info infoicon"></i>
                        </div>
                        <div class="desc">
                            今日独立IP的详细描述。
                            <br />
                            FineUI 是基于 jQuery 的专业 ASP.NET WebForms/Core 控件库。
                        </div>
                    </div>
                </f:ContentPanel>
                <f:ContentPanel ID="ContentPanelExample3" ClientIDMode="Static" BlockMD="6" BlockLG="3" runat="server" ShowBorder="true" ShowBorderShadow="true" ShowHeader="false">
                    <div class="mycard">
                        <div class="title">
                            今日用户量
                            <i class="f-icon f-iconfont f-iconfont-info infoicon"></i>
                        </div>
                        <div class="number">
                            900
                        </div>
                        <div class="chart">
                            <f:Chart ID="ChartCardUsers" runat="server" Height="60px" DataCategoryField="Category" Compact="true">
                                <Series>
                                    <f:ChartSeries Key="users" Type="Bar" Name="用户数" DataValueField="Users" />
                                    <f:ChartSeries Key="views" Type="Line" Name="浏览量" DataValueField="Views" Smooth="true" ShowSymbol="true" />
                                </Series>
                            </f:Chart>
                        </div>
                        <div class="footer f-widget-content">
                            周同比 10% <i class="f-icon f-iconfont f-iconfont-triangle-down"></i>
                            &nbsp;
                            日环比 20% <i class="f-icon f-iconfont f-iconfont-triangle-up"></i>
                        </div>
                    </div>
                    <div class="mycard" style="display: none;">
                        <div class="title">
                            今日用户量
                            <i class="f-icon f-iconfont f-iconfont-info infoicon"></i>
                        </div>
                        <div class="desc">
                            今日用户量的详细描述。
                            <br />
                            FineUI 是基于 jQuery 的专业 ASP.NET WebForms/Core 控件库。
                        </div>
                    </div>
                </f:ContentPanel>
                <f:ContentPanel ID="ContentPanelExample4" ClientIDMode="Static" BlockMD="6" BlockLG="3" runat="server" ShowBorder="true" ShowBorderShadow="true" ShowHeader="false">
                    <div class="mycard rank">
                        <div class="title">
                            今日排名
                            <i class="f-icon f-iconfont f-iconfont-info infoicon"></i>
                        </div>
                        <div class="number">
                            <span class="number-subtext">上升</span> 9 <span class="number-subtext">位</span>
                        </div>
                        <div class="chart">
                            <div class="f-progressbar f-widget-content">
                                <div class="f-progressbar-value f-widget-header" style="width: 60%;">
                                </div>
                            </div>
                        </div>
                        <div class="footer f-widget-content">
                            分类排名前 32% <i class="f-icon f-iconfont f-iconfont-triangle-up"></i>
                        </div>
                    </div>
                    <div class="mycard" style="display: none;">
                        <div class="title">
                            今日排名
                            <i class="f-icon f-iconfont f-iconfont-info infoicon"></i>
                        </div>
                        <div class="desc">
                            今日排名的详细描述。
                            <br />
                            FineUI 是基于 jQuery 的专业 ASP.NET WebForms/Core 控件库。
                        </div>
                    </div>
                </f:ContentPanel>
                <f:TabStrip ID="TabStripExample1" ClientIDMode="Static" CssClass="mytabstrip" BlockMD="12" ShowInkBar="true" runat="server" ShowBorder="true" ShowBorderShadow="true" ActiveTabIndex="0">
                    <Tabs>
                        <f:Tab runat="server" Layout="Block" BlockConfigSpace="0" Title="浏览量">
                            <Items>
                                <f:Panel ID="PanelExample2" ClientIDMode="Static" BlockMD="6" BlockLG="8" runat="server" ShowBorder="false" ShowHeader="false">
                                    <Items>
                                        <f:Chart ID="ChartTabViews" runat="server" Height="350px" DataCategoryField="Category" Title="浏览量趋势">
                                            <Series>
                                                <f:ChartSeries Key="views" Type="Area" Name="浏览量" DataValueField="Views" Smooth="true" />
                                            </Series>
                                        </f:Chart>
                                    </Items>
                                </f:Panel>
                                <f:ContentPanel ID="ContentPanelExample5" ClientIDMode="Static" BlockMD="6" BlockLG="4" BodyPadding="20px" runat="server" ShowBorder="false" ShowHeader="false">
                                    <table class="mytable">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Operator</th>
                                                <th>PV</th>
                                                <th>UV</th>
                                                <th>IP</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><span class="mynumber round f-widget-header">1</span></td>
                                                <td>电信</td>
                                                <td>12,000</td>
                                                <td>9,000</td>
                                                <td>6,000</td>
                                            </tr>
                                            <tr>
                                                <td><span class="mynumber round f-widget-header">2</span></td>
                                                <td>联通</td>
                                                <td>10,000</td>
                                                <td>8,000</td>
                                                <td>5,000</td>
                                            </tr>
                                            <tr>
                                                <td><span class="mynumber round f-widget-header">3</span></td>
                                                <td>移动</td>
                                                <td>9,000</td>
                                                <td>6,000</td>
                                                <td>4,000</td>
                                            </tr>
                                            <tr>
                                                <td><span class="mynumber">4</span></td>
                                                <td>长宽</td>
                                                <td>6,000</td>
                                                <td>5,000</td>
                                                <td>3,000</td>
                                            </tr>
                                            <tr>
                                                <td><span class="mynumber">5</span></td>
                                                <td>铁通</td>
                                                <td>4,000</td>
                                                <td>3,000</td>
                                                <td>2,000</td>
                                            </tr>
                                            <tr>
                                                <td><span class="mynumber">6</span></td>
                                                <td>其它</td>
                                                <td>8,000</td>
                                                <td>5,000</td>
                                                <td>2,000</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </f:ContentPanel>
                            </Items>
                        </f:Tab>
                        <f:Tab runat="server" Layout="Block" BlockConfigSpace="0" Title="用户量">
                            <Items>
                                <f:Panel ID="PanelExample3" ClientIDMode="Static" BlockMD="6" BlockLG="8" runat="server" ShowBorder="false" ShowHeader="false">
                                    <Items>
                                        <f:Chart ID="ChartTabUsers" runat="server" Height="350px" DataCategoryField="Category" Title="用户数与浏览量" ShowLegend="true">
                                            <Series>
                                                <f:ChartSeries Key="users" Type="Bar" Name="用户数" DataValueField="Users" />
                                                <f:ChartSeries Key="views" Type="Line" Name="浏览量" DataValueField="Views" Smooth="true" />
                                            </Series>
                                        </f:Chart>
                                    </Items>
                                </f:Panel>
                                <f:ContentPanel ID="ContentPanelExample6" ClientIDMode="Static" BlockMD="6" BlockLG="4" BodyPadding="20px" runat="server" ShowBorder="false" ShowHeader="false">
                                    <table class="mytable">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Browser</th>
                                                <th>PV</th>
                                                <th>UV</th>
                                                <th>IP</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Chrome</td>
                                                <td>12,600</td>
                                                <td>9,600</td>
                                                <td>6,600</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Firefox</td>
                                                <td>10,600</td>
                                                <td>8,600</td>
                                                <td>5,600</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Safari</td>
                                                <td>9,600</td>
                                                <td>6,600</td>
                                                <td>4,600</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>IE</td>
                                                <td>6,600</td>
                                                <td>5,600</td>
                                                <td>3,600</td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>Edge</td>
                                                <td>4,600</td>
                                                <td>3,600</td>
                                                <td>2,600</td>
                                            </tr>
                                            <tr>
                                                <td>6</td>
                                                <td>Others</td>
                                                <td>8,600</td>
                                                <td>5,600</td>
                                                <td>2,600</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </f:ContentPanel>
                            </Items>
                        </f:Tab>
                    </Tabs>
                    <Tools>
                        <f:Tool runat="server" ToolTip="打开详细数据" IconFont="_NewTab" ClickHandler="onTabstripToolClick"></f:Tool>
                    </Tools>
                </f:TabStrip>
                <f:Panel ID="PanelExample4" ClientIDMode="Static" BlockMD="6" BlockLG="8" Layout="Block" BlockConfigSpace="20px" runat="server" ShowBorder="false" ShowHeader="false">
                    <Items>
                        <f:Grid ID="Grid1" CssClass="mygrid responsive-card-grid" BlockMD="12" ShowBorder="true" ShowBorderShadow="true" ShowHeader="true"
                            Title="表格示例" EnableCheckBoxSelect="true" EnableAlternateRowColor="true" EnableRowLines="true" KeepCurrentSelection="true"
                            ResponsiveCardSize="MD" CardRendererFunction="renderResponsiveCard" runat="server" DataIDField="Id"
                            DataAttributeFields="Name,Gender,Avatar,EntranceYear,Status,Desc">
                            <Columns>
                                <f:RenderField ColumnID="UserProfile" Width="250" RendererFunction="renderUserProfile" HeaderText="基本信息"></f:RenderField>
                                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                                <f:RenderField Width="150px" ColumnID="Rate1" DataField="Rate1" FieldType="Int" HeaderText="评分"
                                    RendererFunction="renderRate1" />
                                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px"
                                    HeaderText="所学专业" />
                                <f:RenderField ColumnID="Status" DataField="Status" RendererFunction="renderStatus" HeaderText="状态" />
                            </Columns>
                        </f:Grid>
                        <f:Form ID="FormExample1" ClientIDMode="Static" CssClass="myform" BlockMD="12" Layout="Block" BlockConfigSpace="10px" BodyPadding="20px" runat="server" ShowBorder="true"
                            ShowBorderShadow="true" ShowHeader="true" Title="表单示例" LabelAlign="Right">
                            <Items>
                                <f:Label ID="Label1" BlockMD="6" runat="server" Label="标签" Text="标签的值">
                                </f:Label>
                                <f:CheckBox ID="CheckBox1" BlockMD="6" runat="server" Text="复选框" Label="复选框">
                                </f:CheckBox>
                                <f:DropDownList ID="DropDownList1" BlockMD="6" runat="server" Required="true" ShowRedStar="true" AutoSelectFirstItem="false"
                                    Label="下拉列表">
                                    <f:ListItem Text="可选项 1" Selected="true" Value="0"></f:ListItem>
                                    <f:ListItem Text="可选项 2" Value="2"></f:ListItem>
                                    <f:ListItem Text="可选项 3" Value="3"></f:ListItem>
                                </f:DropDownList>
                                <f:TextBox ID="TextBox1" BlockMD="6" ShowRedStar="true" runat="server" Label="文本框" Required="true" Text="">
                                </f:TextBox>
                                <f:DatePicker runat="server" BlockMD="6" EnableEdit="false" Required="true" Label="日期" EmptyText="请选择日期" ID="DatePicker1"
                                    SelectedDate="2014-07-10" ShowRedStar="true">
                                </f:DatePicker>
                                <f:TimePicker ID="TimePicker1" BlockMD="6" EnableEdit="false" ShowRedStar="true" Label="时间" Increment="30" Required="true"
                                    Text="08:30" EmptyText="请选择时间" runat="server">
                                </f:TimePicker>
                                <f:CheckBoxList ID="CheckBoxList1" BlockMD="12" Label="复选框列表" ColumnNumber="3" runat="server">
                                    <f:CheckItem Text="可选项 1" Value="value1" />
                                    <f:CheckItem Text="可选项 2" Value="value2" Selected="true" />
                                    <f:CheckItem Text="可选项 3" Value="value3" Selected="true" />
                                    <f:CheckItem Text="可选项 4" Value="value4" Selected="true" />
                                    <f:CheckItem Text="可选项 5" Value="value5" Selected="true" />
                                </f:CheckBoxList>
                                <f:TextArea ID="TextArea1" BlockMD="12" runat="server" Label="描述" ShowRedStar="true" Required="true">
                                </f:TextArea>
                            </Items>
                        </f:Form>
                    </Items>
                </f:Panel>
                <f:Panel ID="PanelExample5" ClientIDMode="Static" BlockMD="6" BlockLG="4" Layout="Block" BlockConfigSpace="20px" runat="server" ShowBorder="false" ShowHeader="false">
                    <Items>
                        <f:ContentPanel ID="ContentPanelExample7" ClientIDMode="Static" BlockMD="12" BodyPadding="20px 20px 0 20px" runat="server" ShowBorder="true" ShowBorderShadow="true" ShowHeader="true"
                            Title="本站统计">
                            <ul class="mysitestats">
                            </ul>
                        </f:ContentPanel>
                        <f:Panel ID="PanelExample6" ClientIDMode="Static" BlockMD="12" BodyPadding="20px" runat="server" ShowBorder="true" ShowBorderShadow="true" ShowHeader="true" Title="访问来源">
                            <Items>
                                <f:Chart ID="ChartTrafficSources" runat="server" Height="300px" DataCategoryField="Category"
                                    Title="用户访问来源" Subtitle="这是说明文字" TitleAlign="Center"
                                    ShowLegend="true" LegendPosition="Left" LegendTop="top" PieEmphasisShadow="true" PieCenter="50%,60%">
                                    <Series>
                                        <f:ChartSeries Key="source" Type="Pie" Name="访问来源" DataValueField="Value" />
                                    </Series>
                                </f:Chart>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <div class="f-widget-content" id="emptycontent"></div>
    </form>

    <script type="text/javascript" src="<%= PageContext.ResolveUrl("~/res/js/grid.js?v" + GlobalConfig.ProductVersion) %>"></script>
    <script type="text/javascript" src="<%= PageContext.ResolveUrl("~/res/js/responsive-card.js?v" + GlobalConfig.ProductVersion) %>"></script>
    <script>
        var panel1ClientID = '<%= Panel1.ClientID %>';


        function onTabstripToolClick(event) {
            parent.addExampleTab && parent.addExampleTab({
                id: 'dashboard_iframe_grid',
                iframeUrl: F.resolveUrl('/iframe/grid_iframe.aspx'),
                title: '表格与编辑窗体',
                refreshWhenExist: true
            });
        }

        F.ready(function() {

            $('.mycard .infoicon').click(function() {
                var card1 = $(this).parents('.mycard');
                var card2 = card1.siblings('.mycard');
                // 翻转动画
                F.flip(card1, card2);
            });


            // 本站统计
            var siteStats = [];

            function addToSiteStats(title, content) {
                siteStats.push('<li class="f-state-default f-corner-all"><div class="title">' + title + '</div><div class="content">' + content +
                    '</div></li>');
            }
            var examplesCount = parent.getExamplesCount ? parent.getExamplesCount() : '---';
            var examplesCountTitle = '示例数';
            var cookieShowOnlyCommunity = F.cookie('ShowOnlyCommunity');
            if (cookieShowOnlyCommunity == 'true') {
                examplesCountTitle += '（仅社区版）';
            }
            addToSiteStats(examplesCountTitle, examplesCount);

            var cookieSearchText = F.cookie('SearchText');
            if (cookieSearchText) {
                addToSiteStats('搜索关键字', cookieSearchText);
            }

            addToSiteStats('显示模式', F.displayMode);
            addToSiteStats('语言', F.language);
            addToSiteStats('主题', F.theme);
            addToSiteStats('版本', F.version);
            $('.mysitestats').html(siteStats.join(''));


            F(panel1ClientID).doLayout();

        });

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示用 <code>Block</code> 布局组合统计卡片、图表、表格和表单，并在窄屏重新排列。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>响应排列与卡片翻面</h3>
    <ul>
        <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStripExample1").ClientID %>' title="选项卡">选项卡</strong>中的统计卡片、图表和表格，再缩小浏览器。<br />结果：各部分按本页块宽度重新分列或层叠，内容仍来自同一组示例数据。</li>
        <li>点击统计卡片上的信息图标，再点击背面的图标。<br />结果：卡片翻面显示说明，再次点击恢复正面，页面其它组件不被替换。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Layout</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStripExample1").ClientID %>' title="选项卡">选项卡</strong>）：首页外层使用 <code>Block</code> 布局。</li>
        <li><code>BlockMD</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ContentPanelExample1").ClientID %>' title="第 1 个内容面板">第 1 个内容面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ContentPanelExample2").ClientID %>' title="第 2 个内容面板">第 2 个内容面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ContentPanelExample3").ClientID %>' title="第 3 个内容面板">第 3 个内容面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ContentPanelExample4").ClientID %>' title="第 4 个内容面板">第 4 个内容面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStripExample1").ClientID %>' title="选项卡">选项卡</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample2").ClientID %>' title="第 2 个面板">第 2 个面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ContentPanelExample5").ClientID %>' title="第 5 个内容面板">第 5 个内容面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample3").ClientID %>' title="第 3 个面板">第 3 个面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ContentPanelExample6").ClientID %>' title="第 6 个内容面板">第 6 个内容面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample4").ClientID %>' title="第 4 个面板">第 4 个面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格示例">表格示例</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("FormExample1").ClientID %>' title="表单示例">表单示例</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Label1").ClientID %>' title="标签">标签</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("CheckBox1").ClientID %>' title="复选框">复选框</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownList1").ClientID %>' title="下拉列表">下拉列表</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>' title="文本框">文本框</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DatePicker1").ClientID %>' title="日期">日期</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TimePicker1").ClientID %>' title="时间">时间</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("CheckBoxList1").ClientID %>' title="复选框列表">复选框列表</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextArea1").ClientID %>' title="描述">描述</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample5").ClientID %>' title="第 5 个面板">第 5 个面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ContentPanelExample7").ClientID %>' title="本站统计">本站统计</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample6").ClientID %>' title="访问来源">访问来源</strong>）：各组分别设为<code>6</code>、<code>12</code>，定义各区域在桌面宽度下的占比。</li>
        <li><code>ResponsiveCardSize</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格示例">表格示例</strong>）：设为<code>MD</code>，表格在窄屏使用本页卡片视图。</li>
    </ul>
</section>
</template>
</body>
</html>
