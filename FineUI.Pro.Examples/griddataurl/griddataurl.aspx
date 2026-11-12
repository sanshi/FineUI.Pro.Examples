<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/griddataurl/griddataurl.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" EnableCheckBoxSelect="true" runat="server"
            DataIDField="Id" DataUrl="~/griddataurl/griddataurl.ashx">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                </f:RenderField>
                <f:RenderField ColumnID="Group" DataField="Group" RendererFunction="renderGroup" HeaderText="分组">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <br />


    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>页面先创建表格，再从 DataUrl 异步取得学生记录，按列字段显示数据。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>等待数据到达后查看记录</h3>
            <ul>
                <li>打开页面，查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong><strong>姓名</strong>、<strong>性别</strong>与专业列。<br />结果：浏览器请求配置的数据地址，返回结果装入表格；页面初始化不需要在生命周期中先绑定全部记录。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>网址数据源一般用于数据的展示，更快的页面加载速度，更少的回发传输量。</li>
                <li>由于表格在服务器端不保存数据，所以很多服务端数据不能用，比如DataKeys、Rows[0].Values；选中项请使用稳定的SelectedRowIDArray。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataUrl</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>~/griddataurl/griddataurl.ashx</code>，指定异步取得记录的地址，返回字段须与列字段及主键字段对应。
                </li>
                <li><code>DataIDField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>Id</code>，从返回记录中读取稳定的业务标识。
                </li>
                <li><code>dataload</code>（<strong>网址数据加载与页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：数据到达并加载后才进行依赖行数据的客户端处理。</li>
            </ul>
        </section>
    </template>
</body>
</html>
