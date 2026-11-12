<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_vertical_tab.aspx.cs" Inherits="FineUI.Pro.Examples.gridnav.grid_vertical_tab" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            ShowSelectedCell="true" ShowSelectedRow="false" EnableRowHoverState="false" TabVerticalNavigate="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <%--<f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />--%>
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        快捷键说明：

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>按 Tab 在同一列中纵向移动当前单元格，越过末行后转入下一列。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>使用纵向键盘导航</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>第一行<strong>姓名</strong>单元格，依次按 Tab 与 Shift+Tab。<br />结果：Tab 先移到下一行的同一列；Shift+Tab 反向移动，当前格边框随位置变化，不打开编辑器。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>方向键在单元格之间导航</li>
                <li>设置 TabVerticalNavigate=true 之后，Tab键在垂直方向上导航：
                    <ul>
                        <li>Tab键转到当前列的下一个单元格（如果当前位于某一列的最后一个单元格，则会跳转到下一列的第一个单元格）</li>
                        <li>Shift+Tab键回退到当前列的上一个单元格（如果当前位于某一列的第一个单元格，则会跳转到上一列的最后一个单元格）</li>
                    </ul>
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ShowSelectedCell</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，开启当前单元格的可见选择边框。
                </li>
                <li><code>TabVerticalNavigate</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 <code>true</code>，初始为
                    <code>true</code>，Tab 先按行方向遍历同一列。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
