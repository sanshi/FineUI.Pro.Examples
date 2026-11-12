<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datalist_selectedvaluearray_keepcurrentselection.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.datalist.datalist_selectedvaluearray_keepcurrentselection" %>

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
                    <Items>
                        <f:Button runat="server" Text="获取选中项" ID="btnSubmit" OnClick="btnSubmit_Click"></f:Button>
                    </Items>
                </f:Toolbar>
                <f:Toolbar ID="ToolbarActions" runat="server">
                    <Items>
                        <f:Button ID="btnSetSelection" Text="设置选择" OnClick="btnSetSelection_Click" runat="server"></f:Button>
                        <f:Button ID="btnClearSelection" Text="清空选择" OnClick="btnClearSelection_Click" runat="server"></f:Button>
                        <f:Button ID="btnRebindSelection" Text="重绑并选中" OnClick="btnRebindSelection_Click" runat="server"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:DataList runat="server" ID="DataList1" OnItemDataBound="DataList1_ItemDataBound" EnableSelect="true" EnableMultiSelect="true"
                    KeepCurrentSelection="true" DataValueField="Id">
                </f:DataList>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示移动列表连续点击累加选择，并通过按钮读取、设置或清空当前集合。</p>
    <h3><i class="f-iconfont f-iconfont-check" aria-hidden="true"></i>修改并读取选择</h3>
    <ol>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>点击<code>中国</code>，再点击<code>法国</code>。<br />结果：两个项目可以累加到当前集合，不需要按键盘修饰键。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSubmit").ClientID %>' title="获取选中项">获取选中项</strong>。<br />结果：读取当前项目值或值数组，提示与列表现在的选择一致。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnClearSelection").ClientID %>' title="清空选择">清空选择</strong>。<br />结果：移除当前选择高亮，列表项目仍然保留。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSetSelection").ClientID %>' title="设置选择">设置选择</strong>。<br />结果：按本页按钮指定的稳定项值设置选择。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnRebindSelection").ClientID %>' title="重绑并选中">重绑并选中</strong>。<br />结果：先替换列表数据，再按新集合中的稳定项值恢复本页指定选择。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableSelect</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：允许点击列表项目进行选择。 本页使用<code>true</code>。</li>
        <li><code>SelectedValueArray</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：使用稳定的项目值记录当前选择，不依赖显示顺序。</li>
        <li><code>EnableMultiSelect</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：允许选择集合包含多个项目。 本页使用<code>true</code>。</li>
        <li><code>KeepCurrentSelection</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：设为 <code>true</code>，连续点击时保留已有选择。 本页使用<code>true</code>。</li>
    </ul>
</section>
</template>
</body>
</html>
