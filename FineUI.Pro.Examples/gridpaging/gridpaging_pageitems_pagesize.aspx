<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_pageitems_pagesize.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_pageitems_pagesize" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格（内存分页）" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" AllowSorting="true" IsDatabasePaging="false" runat="server" EnableCheckBoxSelect="true" Height="350px">
            <Columns>
                <f:RowNumberField EnablePagingNumber="true" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" ColumnID="Year" SortField="EntranceYear" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
            <PageItems>
                <f:ToolbarText runat="server" Text="每页记录数：">
                </f:ToolbarText>
                <f:DropDownList runat="server" ID="ddlPageSize" Width="100px" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                    <f:ListItem Text="5" Value="5" />
                    <f:ListItem Text="10" Value="10" />
                    <f:ListItem Text="15" Value="15" />
                    <f:ListItem Text="20" Value="20" />
                </f:DropDownList>
            </PageItems>
        </f:Grid>
        <br />
        <f:Button ID="Button2" runat="server" CssClass="marginr" Text="重新绑定表格" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
        <strong>出于性能考虑，请在实际项目中使用数据库分页（不要使用内存分页）！</strong>
        <f:Button CssClass="marginr" ID="btnServerPage" Text="服务端切到第二页" runat="server" OnClick="btnServerPage_Click"></f:Button>
        <f:Button ID="btnServerSort" Text="服务端按入学年份降序并回首页" runat="server" OnClick="btnServerSort_Click"></f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>使用自定义下拉列表修改页大小，对照浏览器对已有记录重新分页的结果。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>修改每页记录数</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlPageSize").ClientID %>'
                        title="下拉列表">每页记录数</strong>中选择另一项，例如从 5 改为 10 或从 10 改为 20。<br />结果：浏览器按新的页大小重新分页，当前页可显示的记录数和总页数一起变化。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>后台切页与排序</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnServerPage").ClientID %>'
                        title="服务端切到第二页">服务端切到第二页</strong>。<br />结果：后台切换到第二页，当前页记录和分页栏一致更新。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnServerSort").ClientID %>'
                        title="服务端按入学年份降序并回首页">服务端按入学年份降序并回首页</strong>。<br />结果：后台按入学年份降序排列数据，并回到第一页显示结果。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>PageSize</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（内存分页）">表格（内存分页）</strong>）：初始为
                    <code>5</code>，指定每页最多显示的记录数。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
