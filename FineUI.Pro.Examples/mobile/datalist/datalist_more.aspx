<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datalist_more.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.datalist.datalist_more" %>

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

            .morebutton {
                width: 100%;
                text-align: center;
                margin: 8px 0;
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
                <f:DataList runat="server" ID="DataList1" AttributeDataTag="0" OnItemDataBound="DataList1_ItemDataBound">
                </f:DataList>
                <f:LinkButton runat="server" CssClass="morebutton" Text="加载更多..." ID="btnMore" OnClick="btnMore_Click"></f:LinkButton>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示分批向移动列表末尾追加项目，全部加载后禁用继续加载入口。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>分批加载到末尾</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnMore").ClientID %>' title="加载更多...">加载更多...</strong>。<br />结果：本页读取下一批示例记录并追加到末尾，已经显示的项目继续保留。</li>
        <li>重复点击加载更多，直到本页数据批次全部读取。<br />结果：入口文字改为全部加载完毕，并变为不可用，不再重复追加同一批记录。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>AppendData()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：向当前列表追加一批项目，不替换已有项目。</li>
        <li><code>Enabled</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnMore").ClientID %>' title="加载更多...">加载更多...</strong>）：全部批次加载后禁用继续加载按钮。</li>
    </ul>
</section>
</template>
</body>
</html>
