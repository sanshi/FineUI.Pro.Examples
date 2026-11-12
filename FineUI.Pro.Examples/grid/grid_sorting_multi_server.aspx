<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_sorting_multi_server.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_sorting_multi_server" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" AllowSorting="true" SortingCancel="true" SortingToolTip="true"
            SortingMulti="true" SortFieldArray="Gender,ASC" runat="server" EnableCheckBoxSelect="true" OnSort="Grid1_Sort">
            <Columns>
                <f:RowNumberField />
                <f:RenderField Width="150px" SortField="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" Width="150px" SortField="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField Width="150px" SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField Width="150px" SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
            <Toolbars>
                <f:Toolbar Position="Top" runat="server">
                    <Items>
                        <f:Label ID="labSortOrderTip" runat="server"></f:Label>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick" MarginRight="5px">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="[入学年份]正序，[姓名]倒序" OnClick="Button2_Click">
        </f:Button>

    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>由后台一次设置多列排序条件，同时更新数据顺序和各列表头的方向标记。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>后台指定组合排序</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>'
                        title="[入学年份]正序，[姓名]倒序">[入学年份]正序，[姓名]倒序</strong>。<br />结果：后台先按入学年份升序排列，同一年份再按姓名降序排列；重新绑定后的记录和两个列标题标记一致。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SortFieldArray</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>Gender,ASC</code>，保存有先后顺序的字段与方向组合；本页按钮把<strong>入学年份</strong> ASC、姓名 DESC 依次写入并重新绑定数据。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
