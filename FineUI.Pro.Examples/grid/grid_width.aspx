<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_width.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_width" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Grid1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" ShowBorder="true" Margin="24px" ShowHeader="true" Title="表格（各列宽度固定）(改变页面大小来观察每列宽度的变化)" runat="server">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" Width="60px" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField Width="60px" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField Width="60px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" Width="200px" HeaderText="所学专业" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField Width="600px" DataField="Desc" HeaderText="个人简介" RendererFunction="renderTooltip1" />
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
            <p>为各列设置固定宽度，容器较窄时通过横向滚动查看右侧内容。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>调整可用宽度核对列宽</h3>
            <ol>
                <li>缩窄再放宽<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（各列宽度固定）(改变页面大小来观察每列宽度的变化)">表格（各列宽度固定）(改变页面大小来观察每列宽度的变化)</strong>所在区域，并向右滚动。<br />结果：固定列宽保持原配置，总列宽超过容器时出现横向滚动条，可滚到<strong>个人简介</strong>列。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Width</code>（<strong>本页固定宽度列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（各列宽度固定）(改变页面大小来观察每列宽度的变化)">表格（各列宽度固定）(改变页面大小来观察每列宽度的变化)</strong>）：各列使用显式宽度，专业与简介等较宽列可能使内容区需要横向滚动。</li>
            </ul>
        </section>
    </template>
</body>
</html>
