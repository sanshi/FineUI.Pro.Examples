<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_width_expandunusedspace.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_width_expandunusedspace" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Grid1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" ShowBorder="true" Margin="24px" ShowHeader="true" Title="表格（[个人简介]占据空余空间100%）(改变页面大小来观察每列宽度的变化)" runat="server">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" Width="60px" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField Width="60px" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField Width="60px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" Width="150px" HeaderText="所学专业" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField DataField="Desc" HeaderText="个人简介（ExpandUnusedSpace）" ExpandUnusedSpace="true" MinWidth="150px"
                    RendererFunction="renderTooltip1" />
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
            <p>让个人简介列填满其余列之后的可用宽度。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>调整可用宽度核对列宽</h3>
            <ol>
                <li>缩窄再放宽<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（[个人简介]占据空余空间100%）(改变页面大小来观察每列宽度的变化)">表格（[个人简介]占据空余空间100%）(改变页面大小来观察每列宽度的变化)</strong>所在区域。<br />结果：个人简介承担剩余空间，普通固定宽度列不按同样比例伸缩。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ExpandUnusedSpace</code>（<strong>个人简介列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（[个人简介]占据空余空间100%）(改变页面大小来观察每列宽度的变化)">表格（[个人简介]占据空余空间100%）(改变页面大小来观察每列宽度的变化)</strong>）：个人简介列开启填充剩余宽度，其他列使用自己的固定宽度。</li>
            </ul>
        </section>
    </template>
</body>
</html>
