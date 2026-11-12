<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_text_top.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_text_top" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" Height="400px"
            RowVerticalAlign="Top" runat="server" EnableCheckBoxSelect="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" Width="150px" HeaderText="分组" DataField="Group" RendererFunction="renderSizedImage1" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function renderSizedImage1(value, params) {
            return renderGroup(value, params).css({
                width: '48px',
                height: '48px'
            });
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>让不同行高中的单元格内容垂直靠上排列。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>对照本页样式规则</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>中较高的数据行，对照<strong>姓名</strong>与多行内容的上边缘。<br />结果：单元格内容从行顶部排列，不再垂直居中；高度仍由本页内容与行高设置决定。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RowVerticalAlign</code>（<strong>本页列与样式</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>Top</code>，统一本页单元格内容的垂直位置。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
