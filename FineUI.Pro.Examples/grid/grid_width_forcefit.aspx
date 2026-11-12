<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_width_forcefit.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_width_forcefit" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Grid1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" ShowBorder="true" Margin="24px" ShowHeader="true" Title="表格（ForceFit=true，各列宽度自适应）(改变页面大小来观察每列宽度的变化)"
            ForceFit="true" runat="server">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" Width="60px" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField Width="60px" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField Width="60px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" Width="300px" HeaderText="所学专业" DataField="Major" RendererFunction="renderMajor" />
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
            <p>按原有列宽比例分配表格空间，使各列随容器宽度一起变化。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>调整可用宽度核对列宽</h3>
            <ol>
                <li>缩窄再放宽<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（ForceFit=true，各列宽度自适应）(改变页面大小来观察每列宽度的变化)">表格（ForceFit=true，各列宽度自适应）(改变页面大小来观察每列宽度的变化)</strong>所在区域。<br />结果：各列按原宽度比例一起伸缩，内容区随容器重新分配。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ForceFit</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（ForceFit=true，各列宽度自适应）(改变页面大小来观察每列宽度的变化)">表格（ForceFit=true，各列宽度自适应）(改变页面大小来观察每列宽度的变化)</strong>）：初始为
                    <code>true</code>，开启各列随容器宽度按比例调整。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
