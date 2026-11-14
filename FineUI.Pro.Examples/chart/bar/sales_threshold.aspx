<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sales_threshold.aspx.cs" Inherits="FineUI.Pro.Examples.chart.BarSalesThreshold" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/data/ChartDataRows.cs" />
    <title>金额门槛筛选柱状图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel runat="server" IsFluid="true" Title="区域销售额" ShowHeader="true" ShowBorder="true" BodyPadding="8">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:ToolbarText runat="server" ID="ToolbarTextChartScope" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:SimpleForm runat="server" IsFluid="true" MaxWidth="240px" ShowHeader="false" ShowBorder="false" LabelWidth="84">
                    <Items>
                        <f:DropDownList runat="server" ID="ddlMinimum" Label="最低金额" OnSelectedIndexChanged="ddlMinimum_SelectedIndexChanged">
                            <f:ListItem Text="全部区域" Value="0" Selected="true" />
                            <f:ListItem Text="4,500 元及以上" Value="4500" />
                            <f:ListItem Text="20,000 元及以上" Value="20000" />
                            <f:ListItem Text="40,000 元及以上" Value="40000" />
                            <f:ListItem Text="68,000 元及以上" Value="68000" />
                            <f:ListItem Text="70,000 元及以上" Value="70000" />
                        </f:DropDownList>
                    </Items>
                </f:SimpleForm>
                <f:Chart runat="server" ID="ChartSalesThreshold" Height="550px" DataCategoryField="Category">
                    <Series>
                        <f:ChartSeries Key="amount" Type="Bar" Name="销售额（元）" DataValueField="Amount" />
                    </Series>
                </f:Chart>
            </Items>
        </f:Panel>



    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>选择最低销售额后立即筛选，只保留达到门槛的区域。选择「全部区域」可恢复全部柱子。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>改变最低金额</h3>
    <ol>
        <li>从<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlMinimum").ClientID %>' title="全部区域">全部区域</strong>选择一个金额门槛。<br />结果：后台仅保留达到门槛的区域，柱数和汇总随之变化。</li>
        <li>重新选择<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlMinimum").ClientID %>' title="全部区域">全部区域</strong>。<br />结果：恢复全部区域的柱状图和汇总。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Items</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlMinimum").ClientID %>' title="全部区域">全部区域</strong>）：预设金额作为下拉项的值。筛选包含等于门槛的区域，例如选择 68,000 元时保留华东。</li>
        <li><code>OnSelectedIndexChanged</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlMinimum").ClientID %>' title="全部区域">全部区域</strong>）：选项改变时更新柱图和命中数。选择 70,000 元可查看空结果。</li>
    </ul>
</section>
</template>
</body>
</html>
