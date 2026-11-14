<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip.aspx.cs" Inherits="FineUI.Pro.Examples.third_party.echarts.tabstrip" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">
        <link rel="stylesheet" href="<%= PageContext.ResolveUrl("~/res/third-party/openlayers/ol.css") %>" />
        <style>
            .mycontentpanel .f-panel-body>div {
                width: 100%;
                height: 100%;
            }

            #chart,
            #olmap {
                height: 100%;
                width: 100%;
            }

        </style>
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager2" AutoSizePanelID="TabStrip1" runat="server" />
        <f:TabStrip ID="TabStrip1" CssClass="mytabstrip" Margin="24px" ShowInkBar="true" runat="server" ShowBorder="true" ActiveTabIndex="0">
            <Tabs>
                <f:Tab ID="TabExample1" runat="server" Title="统计图" Layout="Fit" BodyPadding="10px">
                    <Items>
                        <f:ContentPanel runat="server" CssClass="mycontentpanel" ShowBorder="false" ShowHeader="false">
                            <div id="chart">
                            </div>
                        </f:ContentPanel>
                    </Items>
                </f:Tab>
                <f:Tab runat="server" Title="地图" Layout="Fit" BodyPadding="10px">
                    <Items>
                        <f:ContentPanel runat="server" CssClass="mycontentpanel" ShowBorder="false" ShowHeader="false">
                            <div id="olmap">
                            </div>
                        </f:ContentPanel>
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <div class="f-widget-content" id="emptycontent"></div>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/third-party/echarts/echarts.min.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/third-party/openlayers/ol.js") %>"></script>
    <script type="text/javascript">
        var TabStrip1ClientID = '<%= TabStrip1.ClientID %>';

        var myChart;
        var myMap;

        function emptyContentColor() {
            return $('#emptycontent').css('color');
        }

        function randomColors() {
            var colors = ['#c23531', '#2f4554', '#61a0a8', '#d48265', '#91c7ae', '#749f83', '#ca8622', '#bda29a', '#6e7074', '#546570', '#c4ccd3'];
            var randomIndex = Math.random() * colors.length;
            return $.merge(colors.slice(randomIndex), colors.slice(0, randomIndex));
        }

        // 更新选项卡中的图表
        function updateChartInTabStrip() {
            var tabIndex = F(TabStrip1ClientID).getActiveTabIndex();
            if (tabIndex === 0) {
                myChart.resize();
            } else {
                myMap.updateSize();
            }
        }

        F.ready(function() {
            // 初始化ECharts
            var contentColor = emptyContentColor();
            var option = {
                color: randomColors(),
                title: {
                    text: '用户访问来源',
                    subtext: '这是说明文字',
                    x: 'center',
                    textStyle: {
                        color: contentColor
                    }
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    textStyle: {
                        color: contentColor
                    },
                    data: ['直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎']
                },
                series: [{
                    name: '访问来源',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '60%'],
                    data: [{
                            value: 335,
                            name: '直接访问'
                        },
                        {
                            value: 310,
                            name: '邮件营销'
                        },
                        {
                            value: 234,
                            name: '联盟广告'
                        },
                        {
                            value: 135,
                            name: '视频广告'
                        },
                        {
                            value: 1548,
                            name: '搜索引擎'
                        }
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }]
            };
            myChart = echarts.init($('#chart')[0]);
            myChart.setOption(option);

            // 初始化OpenLayers
            myMap = new ol.Map({
                target: 'olmap',
                layers: [
                    new ol.layer.Tile({
                        source: new ol.source.OSM()
                    })
                ],
                view: new ol.View({
                    center: ol.proj.fromLonLat([104.114129, 34.550339]),
                    zoom: 4
                })
            });


            // 选项卡切换或者窗体大小改变时，更新当前选项卡内的图表
            F(TabStrip1ClientID).on('tabchange', function(event, tab) {
                updateChartInTabStrip();
            });
            F.windowResize(function() {
                updateChartInTabStrip();
            });

        });

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>把第三方图表放在选项卡中，在切换和容器尺寸变化后重新适配图表大小。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>切换图表并调整大小</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>切换统计图与地图，再调整浏览器尺寸。<br />结果：激活的图表按当前可见区域绘制和调整，隐藏标签不会占用另一张图的显示空间。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>tabchange / resize</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>）：切换到可见标签后再取得容器尺寸，图表实例随当前容器重新调整。</li>
    </ul>
</section>
</template>
</body>
</html>
