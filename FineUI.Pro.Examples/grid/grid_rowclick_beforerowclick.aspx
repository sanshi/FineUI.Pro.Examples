<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowclick_beforerowclick.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowclick_beforerowclick" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" DataKeyNames="Id,Name" EnableMultiSelect="false" EnableRowClickEvent="true" OnRowClick="Grid1_RowClick">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField HeaderText="所学专业" ColumnID="Major" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
            <Listeners>
                <f:Listener Event="beforerowclick" Handler="onGrid1BeforeRowClick" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onGrid1BeforeRowClick(event, rowId) {
            if ($(event.target).closest('.f-grid-cell-Group').length) {
                // 如果当前点击的单位格属于 “分组” 列，则阻止行点击事件
                return false; // 阻止行点击事件
            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在行点击发生前拦截分组列，其他单元格仍可触发行点击处理。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>对照被拦截的列</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的分组列，再点击同一行的姓名列。<br />结果：分组列的点击在浏览器被取消，不执行后续行点击处理；姓名列仍正常触发并显示该行信息。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：通过 beforerowclick 事件阻止 “分组” 列的行点击事件。</p>
            <p>注：通过 beforerowclick 事件阻止 “分组” 列的行点击事件。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>beforerowclick</code>（<strong>页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：检查当前点击单元格所属列，命中分组列时返回
                    false，取消本次行点击。</li>
            </ul>
        </section>
    </template>
</body>
</html>
