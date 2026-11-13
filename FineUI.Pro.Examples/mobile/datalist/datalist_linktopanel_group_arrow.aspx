<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datalist_linktopanel_group_arrow.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.datalist.datalist_linktopanel_group_arrow" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">
        <link href="<%= PageContext.ResolveUrl("~/res/css/datalist.css") %>" rel="stylesheet" />
        <style>
            .item-desc.china {
                white-space: normal;
            }

        </style>
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" AutoScroll="true" runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Title="列表" runat="server" HeaderStyle="true">
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:DataList runat="server" ID="DataList1" OnItemDataBound="DataList1_ItemDataBound" EnableGroup="true">
                </f:DataList>
            </Items>
        </f:Panel>
        <f:Panel ID="Panel2" runat="server" ShowHeader="false" ShowBorder="false" Hidden="true" BodyPadding="10px" IsViewPort="true" Layout="Fit">
            <Toolbars>
                <f:Toolbar ID="Toolbar2" runat="server" Title="Panel2" HeaderStyle="true">
                    <Items>
                        <f:Button ID="Button4" runat="server" Text="后退" ClickHandler="onBacktoPanel1Click"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Label runat="server" ID="Label2" EncodeText="false"></f:Label>
            </Items>
        </f:Panel>
    </form>
    <script>
        var panel1 = '<%= Panel1.ClientID %>';
        var dataList1 = '<%= DataList1.ClientID %>';

        var panel2 = '<%= Panel2.ClientID %>';
        var label2 = '<%= Label2.ClientID %>';
        var toolbar2 = '<%= Toolbar2.ClientID %>';


        function onBacktoPanel1Click(event) {
            F.slideRight(panel2, panel1);
        }

        F.ready(function() {

            F(dataList1).el.on('click', 'a.f-datalist-item-inner', function(event) {
                var innerEl = $(this);

                var text = innerEl.find('.item-text').text();
                var desc = innerEl.find('.item-desc').text();
                var imageUrl = innerEl.find('.item-img').attr('src');
                F(toolbar2).setTitle(text);
                F(label2).setValue(
                    '<div style="text-align:center;margin-bottom:15px;"><img style="width:60px;" src="' + imageUrl + '"/></div>' +
                    desc);


                F.slideLeft(panel1, panel2);
            });

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示按项目控制可点击状态与右侧箭头，并从可用项目进入详情。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>进入详情并返回列表</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>'
                        title="数据列表">数据列表</strong>点击中国项，对照欧洲组的右侧箭头。<br />结果：中国项被本页配置为不可点击，不进入详情；只有指定组显示箭头。</li>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>'
                        title="数据列表">数据列表</strong>点击一个可用的国家项目。<br />结果：浏览器把该项目的标题、图片及介绍填入详情面板，再滑入对应详情；不会固定显示第一次点击的项目。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button4").ClientID %>'
                        title="后退">后退</strong>。<br />结果：滑回原列表，分组与列表项目继续保留，可以进入另一项。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>el.on(&quot;click&quot;, …)</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>'
                        title="数据列表">数据列表</strong>）：本页把点击委托给列表中的实际链接或详情按钮，根据当前项内容更新详情面板。</li>
                <li><code>EnableGroup</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>'
                        title="数据列表">数据列表</strong>）：初始为<code>true</code>，按本页地区分组显示组头。</li>
                <li><code>Group</code>（<strong>列表项目</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：为项目指定亚洲、欧洲、美洲等分组。
                </li>
                <li><code>ShowArrow</code>（<strong>列表项目</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：只为本页指定组的项目显示右侧箭头。
                </li>
                <li><code>NavigateUrl</code>（<strong>列表项目</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>'
                        title="数据列表">数据列表</strong>）：中国项未设置链接，脚本只响应其它项的链接点击。</li>
            </ul>
        </section>
    </template>
</body>
</html>
