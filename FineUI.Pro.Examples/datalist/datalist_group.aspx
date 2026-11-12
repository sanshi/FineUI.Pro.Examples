<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="datalist_group.aspx.cs" Inherits="FineUI.Pro.Examples.datalist.datalist_group" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>分组与模板</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" runat="server" IsFluid="true" MaxWidth="700" Title="分组与模板" BodyPadding="10">
            <Items>
                <f:DataList ID="DataList1" runat="server" EnableGroup="true" EnableSelect="true">
                    <Items>
                        <f:DataListItem Text="北京" Value="beijing" Group="华北" NavigateUrl="#details" ShowArrow="true" />
                        <f:DataListItem Text="天津" Value="tianjin" Group="华北" NavigateUrl="#details" ShowArrow="true" />
                        <f:DataListItem Text="上海" Value="shanghai" Group="华东" NavigateUrl="#details" ShowArrow="true" />
                        <f:DataListItem Text="杭州" Value="hangzhou" Group="华东" NavigateUrl="#details" ShowArrow="true" />
                    </Items>
                    <Listeners>
                        <f:Listener Event="itemclick" Handler="onDataListItemClick" />
                    </Listeners>
                </f:DataList>
            </Items>
        </f:Panel>
        <f:Label ID="labResult" runat="server" Text="请点击城市。" />
        <p>分组、右侧箭头和列表项 HTML 模板均属于 DataList 自身能力。点击城市更新下方结果，不使用移动布局或切页动画。</p>
    </form>
    <script>
        function onDataListItemClick(event, itemValue) {
            event.preventDefault();
            F('labResult').setValue('当前项：' + itemValue);
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示数据列表按区域分组，使用固定 HTML 模板展示标题和说明，并处理项目点击。</p>
    <h3><i class="f-iconfont f-iconfont-list" aria-hidden="true"></i>从分组项目读取编号</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>点击<code>北京</code>，再点击<code>上海</code>。<br />结果：列表保留华北、华东分组，结果标签显示当前项目的稳定编号；本页阻止链接默认跳转，不切换移动面板。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableGroup</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：开启列表分组。 本页使用<code>true</code>。</li>
        <li><code>Group</code>（<strong>列表项目</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：指定项目所属的区域分组。</li>
        <li><code>Text</code>（<strong>列表项目</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：本页使用固定可信 HTML 提供标题和业务说明；外部输入应先编码。</li>
        <li><code>itemclick</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：读取当前项值并更新结果，同时阻止默认导航。</li>
    </ul>
</section>
</template>
</body>
</html>
