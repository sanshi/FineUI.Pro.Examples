<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datalist.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.datalist.datalist" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
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
                <f:DataList runat="server" ID="DataList1">
                    <f:DataListItem Text="列表项1" Value="item1" />
                    <f:DataListItem Text="列表项2" Value="item2" />
                    <f:DataListItem Text="列表项3" Value="item3" />
                    <f:DataListItem Text="列表项4" Value="item4" />
                    <f:DataListItem Text="列表项5" Value="item5" />
                    <f:DataListItem Text="列表项6" Value="item6" />
                    <f:DataListItem Text="列表项7" Value="item7" />
                    <f:DataListItem Text="列表项8" Value="item8" />
                    <f:DataListItem Text="一个很长很长很长很长很长很长很长很长很长很长很长很长很长很的列表项" Value="item9" />
                </f:DataList>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示移动数据列表的顺序项目，以及长文字项目的显示和滚动。</p>
    <h3><i class="f-iconfont f-iconfont-list" aria-hidden="true"></i>阅读列表与长文字</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>从第一项向下滚动到最后一项。<br />结果：项目按声明顺序显示，末尾的长文字项目保留本页内容；容器可滚动查看超出部分。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Items</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：声明列表的项目与顺序。</li>
        <li><code>AutoScroll</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板">面板</strong>）：设为<code>true</code>，外层移动面板允许滚动查看超出视口的项目。</li>
    </ul>
</section>
</template>
</body>
</html>
