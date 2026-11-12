<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridrowgroup.aspx.cs" Inherits="FineUI.Pro.Examples.gridrowgroup.gridrowgroup" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Height="500px" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" DataIDField="Id"
            DataTextField="Name" EnableRowGroup="true" DataRowGroupField="EntranceYear" EnableCheckBoxSelect="true">
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
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>按入学年份把学生组织成行分组，可逐组展开折叠查看成员。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>按年份查看成员</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>年份<strong>分组</strong>标题，点击其中一组的折叠入口，再展开。<br />结果：同年份记录位于相应组标题下；折叠只收起该组明细，组标题本身不是可选学生行。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：表格启用行分组后不支持单元格编辑、行扩展列、树表格、列锁定和内存分页。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableRowGroup</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，启用行<strong>分组</strong>显示。
                </li>
                <li><code>DataRowGroupField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>EntranceYear</code>，从 EntranceYear 读取<strong>分组</strong>键，相同年份归入同一组。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
