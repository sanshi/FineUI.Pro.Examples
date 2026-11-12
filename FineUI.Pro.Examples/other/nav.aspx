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
                        Text="登录页面">
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
<template id="example-description">
<section aria-label="页面描述">
    <p>演示用一组图标按钮打开其它示例，并与框架菜单复用同一个示例标签。</p>
    <h3><i class="f-iconfont f-iconfont-link" aria-hidden="true"></i>从按钮打开示例</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="登录页面">登录页面</strong>。<br />结果：在父框架打开登录示例；再次从框架菜单进入同一示例时，激活已有标签。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button11").ClientID %>' title="区域布局">区域布局</strong>。<br />结果：在父框架打开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button11").ClientID %>' title="区域布局">区域布局</strong>示例，当前导航页仍可切回。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
        <li>本示例新增的选项卡和手工点击右侧菜单新增的选项卡是同一个！</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>addExampleTabByHref()</code>（<strong>父框架导航函数</strong>）：根据菜单中相同的示例地址查找或打开标签；本页应在示例框架内操作。</li>
        <li><code>IconAlign</code>（本页各按钮，如<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="登录页面">登录页面</strong>）：设为<code>Top</code>，导航按钮将图标放在文字上方。</li>
    </ul>
</section>
</template>
</body>
</html>
