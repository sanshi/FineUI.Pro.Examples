<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nav.aspx.cs" Inherits="FineUI.Pro.Examples.other.nav" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .mytable {
            border-collapse: collapse;
            border-spacing: 0;
        }

            .mytable td {
                padding: 10px;
                text-align: center;
                position: relative;
            }

            .mytable .f-btn {
                width: 100px;
            }

            .mytable .f-btn-icon {
                width: 50px !important;
                height: 50px !important;
                padding: 5px !important;
                margin: 0 !important;
            }

            .mytable .myicon {
                width: 40px;
                font-size: 30px;
                opacity: .5;
                filter: alpha(opacity=50);
                text-align: center;
            }

            .mytable .td-icon-down {
                height: 60px;
            }

            .mytable .td-icon-down .myicon {
                position: absolute;
                left: 50%;
                margin-left: -20px;
                top: 40px;
            }

        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <table class="mytable">
            <tr>
                <td>
                    <f:Button ID="Button1" runat="server" ClickHandler="onNavLoginClick" IconAlign="Top" Icon="User"
                        Text="登陆页面">
                    </f:Button>
                </td>
                <td>
                    <i class="f-icon f-icon-long-arrow-right myicon"></i>
                </td>
                <td>
                    <f:Button ID="Button5" runat="server" ClickHandler="onNavFormCompareClick" IconAlign="Top" Icon="ApplicationForm"
                        Text="表单验证">
                    </f:Button>
                </td>
                <td>
                    <i class="f-icon f-icon-long-arrow-right myicon"></i>
                </td>
                <td>
                    <f:Button ID="Button6" runat="server" ClickHandler="onNavRowExpanderClick" IconAlign="Top" Icon="Table"
                        Text="行扩展列">
                    </f:Button>
                </td>
                <td>
                    <i class="f-icon f-icon-long-arrow-right myicon"></i>
                </td>
                <td>
                    <f:Button ID="Button7" runat="server" ClickHandler="onNavLargeDataClick" IconAlign="Top" Icon="TableLightning"
                        Text="大数据表格">
                    </f:Button>
                </td>
            </tr>
            <tr>
                <td colspan="6"></td>
                <td class="td-icon-down">
                    <i class="f-icon f-icon-long-arrow-down myicon"></i>
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    <f:Button ID="Button11" runat="server" ClickHandler="onNavRegionClick" IconAlign="Top" Icon="LayoutContent"
                        Text="区域布局">
                    </f:Button>
                </td>
                <td rowspan="2">
                    <i class="f-icon f-icon-long-arrow-left myicon"></i>
                </td>
                <td>
                    <f:Button ID="Button9" runat="server" ClickHandler="onNavGroupPanelClick" IconAlign="Top" Icon="Group"
                        Text="分组面板">
                    </f:Button>
                </td>
                <td rowspan="2">
                    <i class="f-icon f-icon-long-arrow-left myicon"></i>
                </td>
                <td rowspan="2">
                    <f:Button ID="Button10" runat="server" ClickHandler="onNavTabStripClick" IconAlign="Top" Icon="Tab"
                        Text="选项卡控件">
                    </f:Button>
                </td>
                <td rowspan="2">
                    <i class="f-icon f-icon-long-arrow-left myicon"></i>
                </td>
                <td rowspan="2">
                    <f:Button ID="Button8" runat="server" ClickHandler="onNavTreeSmartClick" IconAlign="Top" Icon="ApplicationSideTree"
                        Text="智能树控件">
                    </f:Button>
                </td>
            </tr>
            <tr>
                <td>
                    <f:Button ID="Button12" runat="server" ClickHandler="onNavWindowClick" IconAlign="Top" Icon="Application"
                        Text="窗体控件">
                    </f:Button>
                </td>
            </tr>
        </table>
        <br />
        <br />
        注：本示例新增的选项卡和手工点击右侧菜单新增的选项卡是同一个！
    </form>
    <script type="text/javascript">

        function onNavLoginClick(event) {
            top.addExampleTabByHref('/basic/login.aspx');
        }

        function onNavFormCompareClick(event) {
            top.addExampleTabByHref('/form/form_compare.aspx');
        }

        function onNavRowExpanderClick(event) {
            top.addExampleTabByHref('/grid/grid_rowexpander.aspx');
        }

        function onNavLargeDataClick(event) {
            top.addExampleTabByHref('/griddataurl/griddataurl_largedata_1000.aspx');
        }

        function onNavRegionClick(event) {
            top.addExampleTabByHref('/layout/region.aspx');
        }

        function onNavGroupPanelClick(event) {
            top.addExampleTabByHref('/panel/panel_group.aspx');
        }

        function onNavTabStripClick(event) {
            top.addExampleTabByHref('/tabstrip/tabstrip.aspx');
        }

        function onNavTreeSmartClick(event) {
            top.addExampleTabByHref('/tree/tree_smart.aspx');
        }

        function onNavWindowClick(event) {
            top.addExampleTabByHref('/window/window.aspx');
        }

    </script>
</body>
</html>
