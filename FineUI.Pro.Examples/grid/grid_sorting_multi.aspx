<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_sorting_multi.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_sorting_multi" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" AllowSorting="true" SortingCancel="true" SortingToolTip="true"
            SortingMulti="true" SortFieldArray="EntranceYear,DESC,Gender,ASC" runat="server" EnableCheckBoxSelect="true" OnSort="Grid1_Sort">
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
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>

    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>保留多个列的排序条件，按它们的优先级组合排列记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>组合多个排序条件</h3>
            <ol>
                <li>依次点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的<strong>姓名</strong>和<strong>入学年份</strong>列标题。<br />结果：列头操作回发后，后台读取排序字段与方向，重新绑定排序结果；多个列保留排序标记，同一优先字段值相等时再比较后续字段。
                </li>
                <li>从已排序列的表头菜单选择<strong>取消排序</strong>。<br />结果：只移除当前列的排序条件，其他列继续参与排序；全部取消后恢复未排序顺序。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SortingMulti</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，保留多列排序条件，按字段的先后次序确定排序优先级。
                </li>
                <li><code>SortFieldArray</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>EntranceYear,DESC,Gender,ASC</code>，保存排序字段与方向的组合；移除一个字段时，其余条件仍生效。
                </li>
                <li><code>SortingCancel</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，允许移除排序条件；后台对空条件返回未排序的数据。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
