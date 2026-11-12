<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="table.aspx.cs" Inherits="FineUI.Pro.Examples.layout.table" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        .mytable td.f-layout-table-cell {
            padding: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel2" IsFluid="true" CssClass="mytable" runat="server" Height="500px" ShowBorder="true"
            Layout="Table" TableConfigColumns="3" ShowHeader="true" Title="面板（Height=450px Width=750px Layout=Table）">
            <Items>
                <f:Panel ID="Panel1" Title="Panel1" Width="300px" Height="210px"
                    TableRowspan="2" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="Width=300px Height=210px TableRowspan=2">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel3" Title="Panel2" Width="430px" Height="100px"
                    TableColspan="2" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label2" runat="server" Text="Width=430px Height=100px TableColspan=2">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel4" Title="Panel3" Width="200px" Height="100px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="Width=200px Height=100px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel5" Title="Panel4" Width="220px" Height="100px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label4" runat="server" Text="Width=220px Height=100px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel6" Title="Panel5" Width="300px" Height="100px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label5" runat="server" Text="Width=300px Height=100px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel7" Title="Panel6" Width="200px" Height="100px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label6" runat="server" Text="Width=200px Height=100px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel8" Title="Panel6" Width="220px" Height="100px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label7" runat="server" Text="Width=220px Height=100px">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示按表格行列安排子面板，并组合跨行和跨列项目。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照布局与尺寸变化</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel2").ClientID %>' title="面板（Height=450px Width=750px Layout=Table）">面板（Height=450px Width=750px Layout=Table）</strong>中对照各面板的格位与占用行列数。<br />结果：普通项目依次填入表格，跨行或跨列项目占据对应多个格位。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Layout</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel2").ClientID %>' title="面板（Height=450px Width=750px Layout=Table）">面板（Height=450px Width=750px Layout=Table）</strong>）：设为<code>Table</code>，父容器使用本页对应的布局方式，决定其直接子项的排列。</li>
        <li><code>TableConfigColumns</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel2").ClientID %>' title="面板（Height=450px Width=750px Layout=Table）">面板（Height=450px Width=750px Layout=Table）</strong>）：设为<code>3</code>，规定表格布局每行的列数。</li>
        <li><code>RowSpan</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel2").ClientID %>' title="面板（Height=450px Width=750px Layout=Table）">面板（Height=450px Width=750px Layout=Table）</strong>）：当前子项占用多行。</li>
        <li><code>ColSpan</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel2").ClientID %>' title="面板（Height=450px Width=750px Layout=Table）">面板（Height=450px Width=750px Layout=Table）</strong>）：当前子项占用多列。</li>
    </ul>
</section>
</template>
</body>
</html>
