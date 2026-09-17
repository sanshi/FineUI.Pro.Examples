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
        <f:Panel ID="Panel1" Margin="24px" Title="当前生产销售情况" ShowBorder="true" 
            ShowHeader="false" runat="server" EnableIFrame="true" IFrameUrl="~/third-party/echarts/dynamicbar_iframe.aspx">
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
</body>
</html>
