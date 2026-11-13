<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowsort.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowsort" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>行拖拽排序</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Title="学生信息" DataIDField="Id" DataTextField="Name" EnableRowMove="true" runat="server">
            <Columns>
                <f:RowNumberField ColumnID="RowNumber" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="LogTime" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
            <Listeners>
                <f:Listener Event="rowmove" Handler="onRowOrderChanged" />
                <f:Listener Event="dataload" Handler="onRowOrderChanged" />
            </Listeners>
        </f:Grid>
        <f:Button ID="btnSaveToDB" runat="server" Text="保存数据" CssClass="marginr" ClickHandler="onSaveToDBClick" />
        <f:Button ID="btnRefresh" runat="server" Text="刷新本页面（请先点击保存按钮）" ClickHandler="onRefreshClick" />

        <p id="rowSortResult" aria-live="polite"></p>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onRowOrderChanged(event) {
            const rowIds = this.data.map(row => row.id);
            document.getElementById('rowSortResult').textContent = '当前顺序：' + rowIds.join('、');
        }

        function onSaveToDBClick(event) {
            // 提交行 ID 的排列，刷新时按这组 ID 重新读取学生数据。
            const rowIds = F('<%= Grid1.ClientID %>').data.map(row => row.id);
            F.customEvent('Grid1_RowSort', {
                rowIds: rowIds
            });
        }

        function onRefreshClick(event) {
            window.location.reload();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>拖动行调整记录顺序，先在浏览器重排，再按本页保存入口确认顺序。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>拖动后保存或恢复顺序</h3>
            <ol>
                <li>拖动<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="学生信息">学生信息</strong>一行的拖动手柄到另一行之前或之后。<br />结果：记录顺序随落点改变，行标识和这一行的字段值保留，不把单元格内容拆到其他行。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSaveToDB").ClientID %>'
                        title="保存数据">保存数据</strong>后再刷新页面。<br />结果：客户端提交当前行标识顺序，后台在当前会话保存；刷新按该顺序重新绑定。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>拖动表格最左列的六点手柄调整行顺序。点击保存数据后，刷新页面会加载最近一次保存的顺序。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableRowMove</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="学生信息">学生信息</strong>）：初始为
                    <code>true</code>，显示可用于重排行的拖动入口。
                </li>
                <li><code>rowmove / data</code>（<strong>页面移动脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="学生信息">学生信息</strong>）：移动结束后遍历实际行记录的 id
                    取得顺序，不把显示序号当作稳定业务主键。</li>
            </ul>
        </section>
    </template>
</body>
</html>
