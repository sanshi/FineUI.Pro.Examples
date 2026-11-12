<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_width_forcefit_minwidth.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_width_forcefit_minwidth" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Grid1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" ShowBorder="true" Margin="24px" ShowHeader="true"
            Title="表格（ForceFit=true，各列宽度自适应）(改变页面大小来观察每列宽度的变化)（注意对比[性别]和[姓名]列的区别）" ForceFit="true" runat="server" MinColumnWidth="50px">
            <Columns>
                <f:RowNumberField />
                <f:RenderField MinWidth="100px" MaxWidth="150px" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" Width="300px" MinWidth="100px" HeaderText="所学专业" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField Width="600px" MinWidth="100px" DataField="Desc" HeaderText="个人简介" RendererFunction="renderTooltip1" />
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
            <p>按表格宽度压缩各列，同时用最小和最大宽度限制姓名列。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>调整可用宽度核对列宽</h3>
            <ol>
                <li>缩窄再放宽<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（ForceFit=true，各列宽度自适应）(改变页面大小来观察每列宽度的变化)（注意对比[性别]和[姓名]列的区别）">表格（ForceFit=true，各列宽度自适应）(改变页面大小来观察每列宽度的变化)（注意对比[性别]和[姓名]列的区别）</strong>所在区域。<br />结果：<strong>姓名</strong>列宽保持在本页的
                    100 到 150 范围内，其他列继续分配剩余空间；达到宽度限制后不再无限压缩<strong>姓名</strong>。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ForceFit</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（ForceFit=true，各列宽度自适应）(改变页面大小来观察每列宽度的变化)（注意对比[性别]和[姓名]列的区别）">表格（ForceFit=true，各列宽度自适应）(改变页面大小来观察每列宽度的变化)（注意对比[性别]和[姓名]列的区别）</strong>）：初始为
                    <code>true</code>，按可用空间重新分配列宽。
                </li>
                <li><code>MinWidth / MaxWidth</code>（<strong>姓名列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（ForceFit=true，各列宽度自适应）(改变页面大小来观察每列宽度的变化)（注意对比[性别]和[姓名]列的区别）">表格（ForceFit=true，各列宽度自适应）(改变页面大小来观察每列宽度的变化)（注意对比[性别]和[姓名]列的区别）</strong>）：<strong>姓名</strong>列初始分别为
                    <code>100</code> 与 <code>150</code>，约束自动分配后的宽度。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
