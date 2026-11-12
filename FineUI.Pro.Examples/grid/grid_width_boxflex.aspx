<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_width_boxflex.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_width_boxflex" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Grid1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" ShowBorder="true" Margin="24px" ShowHeader="true" Title="表格（[所学专业]占据空余空间1/3；[个人简介]占据空余空间2/3；）(改变页面大小来观察每列宽度的变化)"
            runat="server">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" Width="60px" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField Width="60px" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField Width="60px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" MinWidth="200px" BoxFlex="1" HeaderText="所学专业（BoxFlex=1）" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField MinWidth="200px" BoxFlex="2" DataField="Desc" HeaderText="个人简介（BoxFlex=2）" RendererFunction="renderTooltip1" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function renderTooltip1(value, params) {
            return $('<span>').text(value).attr('data-qtip', F.htmlEncode(value));
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把剩余宽度按比例分给两列，而不是平均分配给所有列。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>调整可用宽度核对列宽</h3>
            <ol>
                <li>缩窄再放宽<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（[所学专业]占据空余空间1/3；[个人简介]占据空余空间2/3；）(改变页面大小来观察每列宽度的变化)">表格（[所学专业]占据空余空间1/3；[个人简介]占据空余空间2/3；）(改变页面大小来观察每列宽度的变化)</strong>所在区域。<br />结果：专业与个人简介按
                    1:2 分配剩余空间，其他固定列先保留自己的宽度。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>BoxFlex</code>（<strong>专业与个人简介列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（[所学专业]占据空余空间1/3；[个人简介]占据空余空间2/3；）(改变页面大小来观察每列宽度的变化)">表格（[所学专业]占据空余空间1/3；[个人简介]占据空余空间2/3；）(改变页面大小来观察每列宽度的变化)</strong>）：专业初始为
                    <code>1</code>，个人简介初始为 <code>2</code>，分配扣除固定列后的剩余宽度。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
