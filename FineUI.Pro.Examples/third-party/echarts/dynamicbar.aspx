<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dynamicbar.aspx.cs" Inherits="FineUI.Pro.Examples.third_party.echarts.dynamicbar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/third-party/echarts/dynamicbar_iframe.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" Margin="24px" Title="当前生产销售情况" ShowBorder="true" ShowHeader="false" runat="server" EnableIFrame="true"
            IFrameUrl="~/third-party/echarts/dynamicbar_iframe.aspx">
            <Toolbars>
                <f:Toolbar ID="Toolbar2" runat="server">
                    <Items>
                        <f:RadioButtonList ID="rblChartType" Label="选择图表类型" LabelWidth="150px" runat="server">
                            <Items>
                                <f:RadioItem Text="销售" Value="sales" Selected="true" />
                                <f:RadioItem Text="产量" Value="output" />
                            </Items>
                            <Listeners>
                                <f:Listener Event="change" Handler="onChartTypeChange" />
                            </Listeners>
                        </f:RadioButtonList>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
    </form>
    <script>
        var rblChartTypeClientID = '<%= rblChartType.ClientID %>';
        var Panel1ClientID = '<%= Panel1.ClientID %>';

        function onChartTypeChange(event) {

            var chartType = this.getValue();
            var newUrl = F.resolveUrl('/third-party/echarts/dynamicbar_iframe.aspx?type=' + encodeURIComponent(chartType));

            F(Panel1ClientID).setIFrameUrl(newUrl);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>通过选项切换 IFrame 中的图表类型，演示动态加载第三方图表页面。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>切换图表类型</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("rblChartType").ClientID %>'
                        title="选择图表类型">选择图表类型</strong>选择另一种图表。<br />结果：浏览器更改<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="当前生产销售情况">当前生产销售情况</strong>的 IFrame
                    地址，重新加载对应图表页面。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableIFrame</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="当前生产销售情况">当前生产销售情况</strong>）：初始为
                    <code>true</code>，在窗体或面板中用 IFrame 加载独立页面。
                </li>
                <li><code>IFrameUrl</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="当前生产销售情况">当前生产销售情况</strong>）：初始为
                    <code>~/third-party/echarts/dynamicbar_iframe.aspx</code>，指定 IFrame 实际加载的页面地址。
                </li>
                <li><code>iframeUrl</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>'
                        title="当前生产销售情况">当前生产销售情况</strong>）：图表类型变化后更新内嵌页面地址，具体绘图逻辑在子页面中。</li>
            </ul>
        </section>
    </template>
</body>
</html>
