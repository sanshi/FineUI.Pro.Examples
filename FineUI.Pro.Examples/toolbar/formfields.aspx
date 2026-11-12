<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="formfields.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.formfields" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" FormMessageTarget="Qtip" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" Height="500px" runat="server" EnableCollapse="false">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Right">
                    <Items>
                        <f:DatePicker runat="server" Required="true" DateFormatString="yyyy-MM-dd" LabelWidth="120px" LabelAlign="Right" Label="销毁统计时间段"
                            EmptyText="请选择开始日期" ID="dpStartDate" EnableEdit="false">
                        </f:DatePicker>
                        <f:DatePicker ID="dpEndDate" Width="180px" Required="true" Readonly="false" CompareControl="dpStartDate" DateFormatString="yyyy-MM-dd"
                            CompareOperator="GreaterThan" CompareMessage="结束日期应该大于开始日期" EmptyText="请选择结束日期" ShowLabel="false" Label="销毁统计时间段" runat="server"
                            EnableEdit="false">
                        </f:DatePicker>
                        <f:Button runat="server" ID="btnClearDate" Text="重置起止时间" OnClick="btnClearDate_Click"></f:Button>
                        <f:ToolbarSeparator runat="server"></f:ToolbarSeparator>
                        <f:Button runat="server" ID="btnSearch" Text="查询" ValidateForms="Toolbar1" OnClick="btnSearch_Click"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示把起止日期字段放在表格工具栏中，先验证日期再加载示例数据。</p>
    <h3><i class="f-iconfont f-iconfont-check" aria-hidden="true"></i>验证日期并加载数据</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSearch").ClientID %>' title="查询">查询</strong>。<br />结果：日期为空或结束日期不大于开始日期时显示验证错误，不继续执行查询按钮处理。</li>
        <li>将<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("dpStartDate").ClientID %>' title="第 1 个日期选择框（销毁统计时间段）">第 1 个日期选择框（销毁统计时间段）</strong>设为<code>2026-06-10</code>，将第二个日期字段设为<code>2026-06-11</code>，再点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSearch").ClientID %>' title="查询">查询</strong>。<br />结果：验证通过后才回发，后台把示例数据绑定到表格；本页未按日期条件查询数据库。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnClearDate").ClientID %>' title="重置起止时间">重置起止时间</strong>。<br />结果：两个日期恢复初始状态，同时清空本页表格数据。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>CompareControl</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("dpEndDate").ClientID %>' title="第 2 个日期选择框（销毁统计时间段）">第 2 个日期选择框（销毁统计时间段）</strong>）：设为<code>dpStartDate</code>，结束日期以开始日期为比较对象。</li>
        <li><code>CompareOperator</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("dpEndDate").ClientID %>' title="第 2 个日期选择框（销毁统计时间段）">第 2 个日期选择框（销毁统计时间段）</strong>）：设为<code>GreaterThan</code>，结束日期必须大于开始日期。</li>
        <li><code>ValidateForms</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSearch").ClientID %>' title="查询">查询</strong>）：设为<code>Toolbar1</code>，查询按钮先验证工具栏中的日期字段。</li>
    </ul>
</section>
</template>
</body>
</html>
