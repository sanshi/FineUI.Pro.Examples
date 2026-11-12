<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_centercolumn.aspx.cs"
    Inherits="FineUI.Pro.Examples.data.grid_centercolumn" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="false">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField Width="150px" TextAlign="Center" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校（居中）" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业（居中）" TextAlign="Center" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
                    RendererFunction="renderMajor" />
                <f:RenderField Width="250px" ColumnID="Group" TextAlign="Right" HeaderTextAlign="Left" HeaderText="分组（内容靠右，标题靠左）" DataField="Group"
                    RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>分别设置列标题与数据文字的水平对齐方式，允许同一列两者不同。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>对照本页样式规则</h3>
            <ul>
                <li>比较<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的居中列、靠右列，以及分组列的标题和内容。<br />结果：指定数据列按各自配置居中或靠右；分组列的数据靠右而标题靠左，标题与正文对齐互不替代。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>TextAlign / HeaderTextAlign</code>（<strong>本页列与样式</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：分别决定数据文字与表头文字的位置；仅修改一种不会自动覆盖另一种。</li>
            </ul>
        </section>
    </template>
</body>
</html>
