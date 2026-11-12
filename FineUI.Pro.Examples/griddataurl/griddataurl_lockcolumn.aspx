<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_lockcolumn.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_lockcolumn" %>

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
            DataIDField="Id" DataUrl="~/griddataurl/griddataurl.ashx" AllowColumnLocking="true">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField EnableLock="true" Locked="true" ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField EnableLock="true" ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                </f:RenderField>
                <f:RenderField EnableLock="true" ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                </f:RenderField>
                <f:RenderCheckField EnableLock="true" ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField EnableLock="true" ColumnID="Major" DataField="Major" RendererFunction="renderMajor" Width="400px" HeaderText="所学专业">
                </f:RenderField>
                <f:RenderField EnableLock="true" ColumnID="Group" DataField="Group" RendererFunction="renderGroup" HeaderText="分组">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在网址数据加载完成后保持姓名列锁定，横向滚动仍可识别记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>数据加载后核对锁定列</h3>
            <ul>
                <li>等待<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>记录出现，再横向滚动。<br />结果：<strong>姓名</strong>保持在锁定区域，其余列随滚动移动，列头、正文与当前行对应。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataUrl</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>~/griddataurl/griddataurl.ashx</code>，异步提供正文记录。
                </li>
                <li><code>AllowColumnLocking</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，为异步数据使用锁定区域。
                </li>
                <li><code>Locked</code>（<strong>姓名列</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：<strong>姓名</strong>列初始锁定，配置不依赖数据先在后台绑定。</li>
            </ul>
        </section>
    </template>
</body>
</html>
