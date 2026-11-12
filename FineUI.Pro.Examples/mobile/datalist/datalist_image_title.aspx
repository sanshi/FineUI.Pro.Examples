<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datalist_image_title.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.datalist.datalist_image_title" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">
        <link href="<%= PageContext.ResolveUrl("~/res/css/datalist.css") %>" rel="stylesheet" />
        <style>
            .item-desc {
                word-break: break-all;
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
                <f:DataList runat="server" ID="DataList1" OnItemDataBound="DataList1_ItemDataBound">
                </f:DataList>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示在移动列表项中同时显示图片、标题和描述文字。</p>
    <h3><i class="f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照图文项目</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>对照中国、美国等项目的国旗、名称和介绍。<br />结果：每个项目保留独立的图片与文字区域，较长介绍在本页布局中显示。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Text</code>（<strong>列表项目</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：由本页固定模板组合标题与介绍。</li>
        <li><code>Items</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：各项目使用对应的图片和业务文字。</li>
    </ul>
</section>
</template>
</body>
</html>
