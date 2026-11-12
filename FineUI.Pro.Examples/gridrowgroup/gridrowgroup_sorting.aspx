<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridrowgroup_sorting.aspx.cs" Inherits="FineUI.Pro.Examples.gridrowgroup.gridrowgroup_sorting" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Height="500px" Title="表格" runat="server" EnableCollapse="false" EnableCheckBoxSelect="false"
            AllowSorting="true" SortField="Gender" SortDirection="ASC" OnSort="Grid1_Sort" EnableRowGroup="true" DataRowGroupField="EntranceYear">
            <Columns>
                <f:RowNumberField />
                <f:RenderField SortField="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" SortField="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在行分组中排序记录，保留年份分组标题。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>改变同组成员顺序</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong><strong>姓名</strong>等可排序列表头切换排序。<br />结果：排序回发后，后台按字段及升降序重新读取并绑定记录；显示记录继续按<strong>入学年份</strong><strong>分组</strong>。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AllowSorting</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，允许列头发起排序，采用当前字段与方向读取记录。
                </li>
                <li><code>DataRowGroupField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>EntranceYear</code>，按 EntranceYear 生成<strong>分组</strong>标题，不把组标题当作普通数据行。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
