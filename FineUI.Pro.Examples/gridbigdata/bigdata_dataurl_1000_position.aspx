<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bigdata_dataurl_1000_position.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridbigdata.bigdata_dataurl_1000_position" %>

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
            FixedRowHeight="true" EnableBigDataRowTip="true" BigDataRowTipPosition="PagingToolbar" PagingToolbarVisible="true">
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
        <br /><br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把大数据可见行范围提示放到分页工具栏，滚动时直接更新栏中文字。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>在底栏查看当前范围</h3>
            <ul>
                <li>滚动<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（网址数据源，1000行）">表格（网址数据源，1000行）</strong>到中间位置。<br />结果：分页工具栏的显示起止行号随视口变化，总数仍为本页全部记录；不再依靠悬浮位置显示该提示。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：行数提示显式在分页工具栏中（需启用EnableBigDataRowTip和PagingToolbarVisible，并设置BigDataRowTipPosition=PagingToolbar）。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>BigDataRowTipPosition</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（网址数据源，1000行）">表格（网址数据源，1000行）</strong>）：初始为
                    <code>PagingToolbar</code>，采用 PagingToolbar，把范围信息放在表格底栏。
                </li>
                <li><code>PagingToolbarVisible</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（网址数据源，1000行）">表格（网址数据源，1000行）</strong>）：初始为
                    <code>true</code>，显示承载范围文字的工具栏。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
