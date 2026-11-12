<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_clearselectionbeforepaging_details.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_clearselectionbeforepaging_details" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Title="表格（跨页选中行）" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true" AllowPaging="true"
            IsDatabasePaging="false" runat="server" EnableCheckBoxSelect="true" DataKeyNames="Id,Name,Major" DataTextField="Name" KeepCurrentSelection="true"
            DataIDField="Id" ClearSelectionBeforePaging="false" KeepPagedSelection="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行的详细数据" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>浏览器分页时持续显示来自不同页面的选中行。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>跨页累积并直接显示选择</h3>
            <ol>
                <li>勾选<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（跨页选中行）">表格（跨页选中行）</strong>第一页的一行，再点击下一页。<br />结果：翻页后原来选中的行仍保留在选择集合中；浏览器切换到已加载数据的下一页。</li>
                <li>再勾选第二页的一行。<br />结果：<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("labResult").ClientID %>' title="标签">标签</strong>同时显示两页选中的行，并随勾选和取消同步更新。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li><strong>出于性能考虑，请在实际项目中使用数据库分页（不要使用内存分页）！</strong></li>
                <li>注意设置属性：
                    <ul>
                        <li>DataIDField=Id：行标识符字段</li>
                        <li>ClearSelectionBeforePaging=false：分页前清空选中项（客户端）</li>
                        <li>KeepPagedSelection=true：多选时保持分页中已选中行（客户端）</li>
                        <li>KeepCurrentSelection=true：多选时保持当前已选中行（客户端）</li>
                    </ul>
                </li>
                <li>SelectedRowIndexArray属性已废弃；跨页保持选中项请使用稳定的SelectedRowIDArray属性。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataIDField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（跨页选中行）">表格（跨页选中行）</strong>）：初始为
                    <code>Id</code>，跨页选择缓存按业务主键区分记录，避免把不同页面中的相同行位置混为同一条数据。
                </li>
                <li><code>ClearSelectionBeforePaging</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（跨页选中行）">表格（跨页选中行）</strong>）：初始为
                    <code>false</code>，翻页时不清空已有选择。
                </li>
                <li><code>KeepCurrentSelection</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（跨页选中行）">表格（跨页选中行）</strong>）：初始为
                    <code>true</code>，增加选择时保留原先已选中的记录。
                </li>
                <li><code>KeepPagedSelection</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（跨页选中行）">表格（跨页选中行）</strong>）：初始为
                    <code>true</code>，保留不在当前页中的选中记录。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
