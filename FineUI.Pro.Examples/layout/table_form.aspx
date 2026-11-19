<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="table_form.aspx.cs" Inherits="FineUI.Pro.Examples.layout.table_form" %>

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
        <f:Form ID="Form2" IsFluid="true" CssClass="mytable" runat="server" Height="500px" ShowBorder="true" Layout="Table" TableConfigColumns="3"
            ShowHeader="true" Title="表单（Height=450px Width=750px Layout=Table）" LabelAlign="Right" LabelWidth="120px">
            <Items>
                <f:Panel ID="Panel1" Title="Panel1" Width="300px" Height="210px" TableRowspan="2" runat="server" BodyPadding="10px" ShowBorder="true"
                    ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" Label="标签（靠右）" runat="server" Text="Width=300px Height=210px TableRowspan=2">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel3" Title="Panel2" Width="430px" Height="100px" TableColspan="2" runat="server" BodyPadding="10px" ShowBorder="true"
                    ShowHeader="false">
                    <Items>
                        <f:Label ID="Label2" Label="标签（靠左）" LabelAlign="Left" runat="server" Text="Width=430px Height=100px TableColspan=2">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel4" Title="Panel3" Width="200px" Height="100px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="Width=200px Height=100px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel5" Title="Panel4" Width="220px" Height="100px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label4" runat="server" Text="Width=220px Height=100px">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Form>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示用 <code>Table</code> 布局把表单字段放入固定行列。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照布局与尺寸变化</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>'
                        title="Panel1">Panel1</strong>中在字段中输入内容，并对照标签与输入区的行列位置。<br />结果：字段保留各自输入功能，位置由表格列数和跨列设置组织。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Layout</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Form2").ClientID %>'
                        title="表单（Height=450px Width=750px Layout=Table）">表单（Height=450px Width=750px
                        Layout=Table）</strong>）：初始为<code>Table</code>，父容器使用本页对应的布局方式，决定其直接子项的排列。</li>
                <li><code>TableConfigColumns</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Form2").ClientID %>'
                        title="表单（Height=450px Width=750px Layout=Table）">表单（Height=450px Width=750px Layout=Table）</strong>）：初始为<code>3</code>，规定表格布局每行的列数。
                </li>
                <li><code>ColSpan</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="Panel1">Panel1</strong>）：当前子项占用多列。</li>
            </ul>
        </section>
    </template>
</body>
</html>
