<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_header_column_attributes.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_header_column_attributes" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-colheader[data-header-color=color1] .f-grid-colheader-title {
            font-weight: bold;
        }

    </style>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderField DataField="AtSchool" HeaderText="是否在校" RendererFunction="renderInverseCheck1" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <%--<f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />--%>
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function renderInverseCheck1(value, params) {
            var checked = String(value).toLowerCase() === 'false';
            return $('<i>').addClass('f-icon f-iconfont f-grid-static-checkbox').toggleClass('f-checked', checked);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>给指定列标题增加自定义属性，再通过 CSS 单独设置表头样式。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>比较表头与数据单元格</h3>
            <ul>
                <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的<strong>姓名</strong>、<strong>性别</strong>标题和其下数据。<br />结果：指定表头带有本页配置的颜色样式，普通数据单元格不自动套用同一表头样式。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Attributes / CSS</code>（<strong>姓名与性别列标题</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：列标题设置
                    <code>data-header-color</code>，本页 CSS 按属性选择表头元素。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
