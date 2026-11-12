<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_hidecolumn.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_hidecolumn" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" EnableHeaderMenu="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField Hidden="true" EnableColumnHide="false" ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button3" runat="server" Text="显示/隐藏[性别]列" CssClass="marginr" OnClick="Button3_Click">
        </f:Button>
        <f:Button ID="Button4" runat="server" Text="获得隐藏列列表" OnClick="Button4_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button1" runat="server" Text="改变[入学年份]的表头菜单隐藏列功能" CssClass="marginr" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br /><br />
        <br />
        <f:Label runat="server" EncodeText="false" ID="labHiddenColumns">
        </f:Label>
        <br />
        <br />
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>切换性别列的显示状态，并读取当前被隐藏的列。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>切换可见性后核对隐藏列表</h3>
            <ol>
                <li>从初始状态点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>'
                        title="显示/隐藏[性别]列">显示/隐藏[性别]列</strong>。<br />结果：后台把初始隐藏的<strong>性别</strong>列显示出来，原有记录与其他列保留；再点一次切回原状态。</li>
                <li>在<strong>性别</strong>列隐藏时点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button4").ClientID %>'
                        title="获得隐藏列列表">获得隐藏列列表</strong>。<br />结果：后台读取并在下方列出当前隐藏列，其中包含<strong>性别</strong>；显示<strong>性别</strong>列后重新读取，它不再列为隐藏。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>切换表头菜单的隐藏能力</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="改变[入学年份]的表头菜单隐藏列功能">改变[入学年份]的表头菜单隐藏列功能</strong>，再打开<strong><strong>入学年份</strong></strong>的表头菜单。<br />结果：该列是否允许通过菜单隐藏随配置切换；这与后台直接设置
                    Hidden 是两种不同操作。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：性别列设置了EnableColumnHide=false，所以不能通过标题栏菜单隐藏，但仍然可以通过后台代码隐藏。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Hidden</code>（<strong>性别列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：<strong>性别</strong>列初始隐藏；本页按钮只改变可见性，不删除列或字段数据。</li>
                <li><code>Columns / Hidden</code>（<strong>读取隐藏列的处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：后台遍历列集合读取隐藏状态，并输出列名。</li>
                <li><code>EnableColumnHide</code>（<strong>性别与入学年份列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：<strong>性别</strong>列初始为
                    false，不能通过表头菜单隐藏，但仍可通过后台切换可见性；<strong>入学年份</strong>列的该能力由本页按钮切换。</li>
            </ul>
        </section>
    </template>
</body>
</html>
