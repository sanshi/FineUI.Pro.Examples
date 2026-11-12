<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_style_cellattributes.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_style_cellattributes" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-cell[data-color=color1] {
            color: red;
            font-weight: bold;
        }

        .f-grid-cell[data-color=color3] {
            color: green;
            font-weight: bold;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="3" ShowBorder="true" ShowHeader="true"
            OnRowDataBound="Grid1_RowDataBound" runat="server" EnableCheckBoxSelect="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="cGender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="cEntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="cMajor" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="Button2" runat="server" CssClass="marginr" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <f:Button ID="Button1" runat="server" Text="重新绑定表格" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在后台行绑定事件中按数据设置单元格属性，并由 CSS 决定外观。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>对照本页样式规则</h3>
            <ul>
                <li>比较<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>中不同<strong>入学年份</strong>的记录，同时查看<strong>性别</strong>单元格。<br />结果：2000 至 2004
                    的<strong>入学年份</strong>单元格应用一组样式，男性对应的<strong>性别</strong>单元格应用另一组样式；规则只作用于命中的单元格。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>换一组记录后重新应用规则</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="重新绑定表格">重新绑定表格</strong>。<br />结果：按钮回发后后台换入另一组记录；列配置或按数据判断的样式规则继续应用，不是仅给最初几行写死颜色。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SetCellAttribute</code>（<strong>本页列与样式</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：后台读取本行源数据，为符合年份或<strong>性别</strong>条件的单元格设置自定义属性，CSS 通过属性选择器设置样式。</li>
            </ul>
        </section>
    </template>
</body>
</html>
