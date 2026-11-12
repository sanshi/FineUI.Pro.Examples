<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bigdata_dataurl_1000.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridbigdata.bigdata_dataurl_1000" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/gridbigdata/data.ashx" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（网址数据源，1000行）" EnableCollapse="false" Height="500px"
            EnableCheckBoxSelect="true" runat="server" DataIDField="Id" DataUrl="~/gridbigdata/data.ashx?total=1000&type=simple" EnableBigData="true"
            FixedRowHeight="true" EnableBigDataRowTip="true" PagingToolbarVisible="false">
            <Columns>
                <f:RowNumberField Width="50px"></f:RowNumberField>
                <f:RenderField Width="150px" ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                </f:RenderField>
                <f:RenderField ColumnID="Group" DataField="Group" RendererFunction="renderGroup" HeaderText="分组">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <br />

        <br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>用虚拟渲染显示 1000 条记录，滚动时只绘制当前视口附近的行。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>滚动到大量记录的中后部</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（网址数据源，1000行）">表格（网址数据源，1000行）</strong>内部持续向下滚动，再返回顶部。<br />结果：视口中的行随滚动位置更新，行数提示反映当前范围与总数；数据规模为 1000 条，不需要同时为每条记录保留完整可见行 DOM。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>启用大数据表格需满足如下条件：
                    <ul>
                        <li>每行的行高相同（FixedRowHeight=true）。</li>
                        <li>表格高度固定或者位于布局中。</li>
                    </ul>
                </li>
                <li>大数据表格一般仅用于数据展示。
                    <ul>
                        <li>不支持树表格、行<strong>分组</strong>。</li>
                        <li>不支持复杂的特性（比如单元格编辑、列锁定、单元格合并...）。</li>
                        <li>不支持模板列中放置输入字段（比如文本输入框、下拉列表、复选框列表...）。</li>
                    </ul>
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableBigData</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（网址数据源，1000行）">表格（网址数据源，1000行）</strong>）：初始为
                    <code>true</code>，启用按可视位置绘制数据行的模式。
                </li>
                <li><code>FixedRowHeight</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（网址数据源，1000行）">表格（网址数据源，1000行）</strong>）：初始为
                    <code>true</code>，使用固定行高计算滚动位置及可见范围。
                </li>
                <li><code>EnableBigDataRowTip</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（网址数据源，1000行）">表格（网址数据源，1000行）</strong>）：初始为
                    <code>true</code>，滚动时提示当前显示范围和全部行数。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
