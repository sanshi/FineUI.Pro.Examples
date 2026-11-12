<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="datalist_databind.aspx.cs" Inherits="FineUI.Pro.Examples.datalist.datalist_databind" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>数据绑定与追加</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" runat="server" IsFluid="true" MaxWidth="700" Title="数据绑定与追加" BodyPadding="10">
            <Items>
                <f:DataList ID="DataList1" runat="server" DataTextField="Name" DataValueField="Id" />
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" Position="Bottom">
                    <Items>
                        <f:Button ID="btnReload" runat="server" Text="重新加载" OnClick="btnReload_Click" CssClass="marginr" />
                        <f:Button ID="btnAppend" runat="server" Text="追加数据" OnClick="btnAppend_Click" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
        <f:Label ID="labResult" runat="server" Text="数据数量：3" />
        <p>首次加载三座城市。重新加载会倒序绑定原始数据并重置追加批次；每次追加两座城市，各批次使用不同的业务值。</p>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示把对象数据绑定为列表，重新加载时替换项目，追加时保留已有项目。</p>
    <h3><i class="f-iconfont f-iconfont-refresh" aria-hidden="true"></i>区分重新加载与追加</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnReload").ClientID %>' title="重新加载">重新加载</strong>。<br />结果：用重新准备的三项数据替换列表，并把数量与追加批次重置。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>DataTextField</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：使用 <code>Name</code> 字段作为显示文字。 本页使用<code>Name</code>。</li>
        <li><code>DataValueField</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：使用 <code>Id</code> 字段作为稳定的项目值。 本页使用<code>Id</code>。</li>
        <li><code>AppendData()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：在末尾追加项目，不清除已有列表。</li>
    </ul>
</section>
</template>
</body>
</html>
