<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rownumber_paging.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rownumber_paging" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格（内存分页，切换分页时序号连续）" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="false" runat="server" EnableCheckBoxSelect="true">
            <Columns>
                <f:RowNumberField EnablePagingNumber="true" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
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
            <p>跨页连续显示行序号，采用浏览器对完整记录分页。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>翻页核对序号连续性</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（内存分页，切换分页时序号连续）">表格（内存分页，切换分页时序号连续）</strong>下一页，再返回第一页。<br />结果：第二页的序号接在第一页末尾之后，不重新从 1 开始；行号由页索引与页大小计算，不作为业务主键。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>数据量较大时，建议采用数据库分页，避免首次加载与传输全部记录；本页保留内存分页用于对照。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnablePagingNumber</code>（<strong>序号列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（内存分页，切换分页时序号连续）">表格（内存分页，切换分页时序号连续）</strong>）：初始为 <code>true</code>，把页偏移量计入显示序号。</li>
            </ul>
        </section>
    </template>
</body>
</html>
