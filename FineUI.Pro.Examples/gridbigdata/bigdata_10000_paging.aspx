<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bigdata_10000_paging.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridbigdata.bigdata_10000_paging" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（10000行）" EnableCollapse="false" Height="500px"
            EnableCheckBoxSelect="true" runat="server" DataIDField="Id" EnableBigData="true" FixedRowHeight="true" AllowPaging="true" IsDatabasePaging="false"
            PageSize="120" EnableBigDataRowTip="false" PagingToolbarVisible="false">
            <Columns>
                <f:RowNumberField Width="50px" EnablePagingNumber="true"></f:RowNumberField>
                <f:RenderField Width="150px" ColumnID="Name" DataField="Name" HeaderText="姓名">
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
        <f:Button ID="Button1" runat="server" CssClass="marginr" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在大数据虚拟渲染基础上使用客户端分页，区分当前页加载范围。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>分页与虚拟渲染共同工作</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（10000行）">表格（10000行）</strong>下一页，再在当前页内滚动。<br />结果：完整 10000 条数据已加载，浏览器按页大小切换当前页，再按视口渲染本页内容；普通换页不重新读取全部记录。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：启用大数据，启用分页，每页显示 120 条记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>IsDatabasePaging</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（10000行）">表格（10000行）</strong>）：初始为
                    <code>false</code>，完整数据在浏览器中分页。
                </li>
                <li><code>PageSize</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（10000行）">表格（10000行）</strong>）：初始为
                    <code>120</code>，确定每页最大记录数，与视口中实际渲染行数是不同概念。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
