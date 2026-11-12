<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vbox_formgrid.aspx.cs" Inherits="FineUI.Pro.Examples.iframe.vbox_formgrid" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_iframe_window.aspx" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel7" runat="server" />
        <f:Panel ID="Panel7" Margin="24px" runat="server" BodyPadding="10px" AutoScroll="true" Title="面板（Layout=VBox AutoScroll=true），高度变小时可能出现纵向滚动条"
            ShowBorder="true" ShowHeader="true" Layout="VBox" BoxConfigSpace="10">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="Button1" Text="测试按钮" runat="server">
                        </f:Button>
                        <f:ToolbarSeparator ID="ToolbarSeparator2" runat="server">
                        </f:ToolbarSeparator>
                        <f:Button ID="Button2" Text="测试按钮" runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Form ID="Form5" ShowBorder="true" ShowHeader="true" Title="表单" BodyPadding="10" RemoveLastFieldsMargin="true" runat="server">
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox1" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox2" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox3" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox4" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox5" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox6" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox7" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox8" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox9" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox10" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox11" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox12" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox13" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox14" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox15" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox16" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox17" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox18" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox19" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox20" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox21" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox22" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
                <f:Grid DataIDField="Id" ID="Grid2" Title="表格（BoxFlex=1 MinHeight=300）" PageSize="10" ShowBorder="true" AllowPaging="true"
                    IsDatabasePaging="false" ShowHeader="true" runat="server" EnableCheckBoxSelect="true" BoxFlex="1" MinHeight="300px">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar2" runat="server">
                            <Items>
                                <f:Button ID="btnPopupWindow" Text="测试按钮" runat="server">
                                </f:Button>
                                <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                                </f:ToolbarSeparator>
                                <f:Button ID="btnCheckSelection" Text="测试按钮" runat="server">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Columns>
                        <f:RowNumberField />
                        <f:RenderField DataField="Name" HeaderText="姓名" />
                        <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                        <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                        <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                        <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
                            RendererFunction="renderMajor" />
                        <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                    </Columns>
                </f:Grid>
            </Items>
        </f:Panel>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示组合表单与表格，并让超出高度的区域纵向滚动。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照布局与尺寸变化</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel7").ClientID %>' title="面板（Layout=VBox AutoScroll=true），高度变小时可能出现纵向滚动条">面板（Layout=VBox AutoScroll=true），高度变小时可能出现纵向滚动条</strong>中在表单内填写内容，再滚动查看表格下方。<br />结果：表单和表格按纵向顺序显示，内容超出区域可滚动。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Layout</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel7").ClientID %>' title="面板（Layout=VBox AutoScroll=true），高度变小时可能出现纵向滚动条">面板（Layout=VBox AutoScroll=true），高度变小时可能出现纵向滚动条</strong>）：设为<code>VBox</code>，父容器使用本页对应的布局方式，决定其直接子项的排列。</li>
        <li><code>AutoScroll</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel7").ClientID %>' title="面板（Layout=VBox AutoScroll=true），高度变小时可能出现纵向滚动条">面板（Layout=VBox AutoScroll=true），高度变小时可能出现纵向滚动条</strong>）：设为<code>true</code>，内容超出该容器时允许滚动查看。</li>
        <li><code>BoxFlex</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid2").ClientID %>' title="表格（BoxFlex=1 MinHeight=300）">表格（BoxFlex=1 MinHeight=300）</strong>）：设为<code>1</code>，直接子项按此比例分配父容器剩余空间。</li>
    </ul>
</section>
</template>
</body>
</html>
