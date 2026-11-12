<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridrowgroup_renderer.aspx.cs" Inherits="FineUI.Pro.Examples.gridrowgroup.gridrowgroup_renderer" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Height="500px" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" DataIDField="Id"
            DataTextField="Name" EnableRowGroup="true" DataRowGroupField="EntranceYear" RowGroupRendererFunction="onGrid1RowGroupRenderer">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onGrid1RowGroupRenderer(groupValue, rowData) {
            var maleCount = 0,
                total = rowData.children.length;
            for (var i = 0; i < total; i++) {
                var childData = rowData.children[i];
                var genderVaue = childData.values['Gender'];
                if (String(genderVaue) === '1') {
                    maleCount++;
                }
            }
            return F.formatString('入学年份：{0}，男：{1}，女：{2}', groupValue, maleCount, total - maleCount);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>自定义年份分组标题，在标题中同时显示该组男女人数。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>把分组信息写入标题</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>各组标题并对照该组<strong>性别</strong>记录。<br />结果：标题显示<strong>入学年份</strong>及本组男女人数，例如首组 2000 年对应男 1、女
                    2；<strong>分组</strong>标题不是后台返回的一条普通学生记录。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RowGroupRendererFunction</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>onGrid1RowGroupRenderer</code>，取得当前组的数据，生成年份与人数等标题文字。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
