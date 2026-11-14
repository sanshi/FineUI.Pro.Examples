<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bigdata_dataurl_10000_location.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridbigdata.bigdata_dataurl_10000_location" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/gridbigdata/data.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（网址数据源，10000行）" EnableCollapse="false" Height="500px"
            EnableCheckBoxSelect="true" runat="server" DataIDField="Id" DataUrl="~/gridbigdata/data.ashx?total=10000&type=simple" EnableBigData="true"
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
            <Toolbars>
                <f:Toolbar runat="server" Position="Bottom">
                    <Items>
                        <f:Label runat="server" Text="转到行："></f:Label>
                        <f:NumberBox ID="nbRowNumber" runat="server" MinValue="1" MaxValue="10000" Text="1000" Increment="100" EnableCommas="true">
                        </f:NumberBox>
                        <f:Button ID="btnGoToRow" runat="server" Text="Go" ClickHandler="onGotoRow"></f:Button>
                        <f:ToolbarFill runat="server"></f:ToolbarFill>
                        <f:Label ID="labCurrentPosition" runat="server"></f:Label>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Grid>
        <br />

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var grid1ClientID = '<%= Grid1.ClientID %>';
        var nbRowNumberClientID = '<%= nbRowNumber.ClientID %>';

        // 转到行
        function onGotoRow(event) {
            // scrollToRow的参数是行索引，而 nbRowNumber 取得的是行序号
            F(grid1ClientID).scrollToRow(F(nbRowNumberClientID).getValue() - 1);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>输入从 1 开始的行号，把大数据表格滚动到指定记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>直接跳到中间记录</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("nbRowNumber").ClientID %>'
                        title="转到行">转到行</strong>输入<code>5000</code>，点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnGoToRow").ClientID %>' title="Go">Go</strong>。<br />结果：浏览器滚动到第 5000
                    行附近并渲染该位置的记录，不必逐页翻到该行。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>scrollToRow</code>（<strong>定位脚本</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（网址数据源，10000行）">表格（网址数据源，10000行）</strong>）：方法接收从 0 开始的行索引，本页把输入行号减 1 后再传入。</li>
                <li><code>EnableBigDataRowTip</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（网址数据源，10000行）">表格（网址数据源，10000行）</strong>）：初始为 <code>true</code>，本页关闭默认悬浮行数提示，定位或自定义标签按本页脚本处理。</li>
            </ul>
        </section>
    </template>
</body>
</html>
