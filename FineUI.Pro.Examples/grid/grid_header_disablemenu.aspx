<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_header_disablemenu.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_header_disablemenu" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" Height="300px" runat="server"
            EnableHeaderMenu="false" EnableColumnResize="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>同时关闭列标题菜单与拖动调整列宽的入口。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>检查被关闭的表头操作</h3>
            <ul>
                <li>把鼠标移到<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>列标题和两列之间的边缘，尝试打开菜单或拖动列宽。<br />结果：列标题不提供菜单按钮，列边缘也不能拖动改宽；数据内容仍正常显示。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：这个表格禁用表头菜单，禁用列宽度调整。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableHeaderMenu</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 <code>false</code>，初始为
                    <code>false</code>，关闭列标题菜单。
                </li>
                <li><code>EnableColumnResize</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 <code>false</code>，初始为
                    <code>false</code>，关闭列边缘拖动调宽。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
