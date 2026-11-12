<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowselect_client.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowselect_client" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格（多选）" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" EnableMultiSelect="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
            <Listeners>
                <f:Listener Event="rowselect" Handler="onGrid1RowSelect" />
                <f:Listener Event="rowdeselect" Handler="onGrid1RowDeselect" />
                <f:Listener Event="selectionchange" Handler="onGrid1SelectionChange" />
            </Listeners>
        </f:Grid>
        <br />
        事件列表（<a id="clearResult" href="#">clear</a>）：
        <ul id="result"></ul>
        <br />

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onClearResultClick(event) {
            event.preventDefault();
            $('#result').empty();
        }

        function onGrid1RowSelect(event, rowId) {
            var date = new Date();
            $('#result').append(F.formatString('<li>[{0}:{1}] rowselect：{2}</li>',
                date.getMinutes(),
                date.getSeconds(),
                rowId));
        }

        function onGrid1RowDeselect(event, rowId) {
            var date = new Date();
            $('#result').append(F.formatString('<li>[{0}:{1}] rowdeselect：{2}</li>',
                date.getMinutes(),
                date.getSeconds(),
                rowId));
        }

        function onGrid1SelectionChange(event) {
            var date = new Date();
            $('#result').append(F.formatString('<li>[{0}:{1}] selectionchange</li>',
                date.getMinutes(),
                date.getSeconds()));
        }

        F.ready(function() {
            $('#clearResult').on('click', onClearResultClick);
        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在行选中和取消选中时直接在浏览器显示对应记录的信息。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>对照选择事件</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（多选）">表格（多选）</strong>选中一行，再选择另一行。<br />结果：<strong class="example-control-reference" data-example-control="result"
                        title="事件日志">事件日志</strong>依次记录已登记的选择事件及行标识，可对照逐行事件和集合改变的顺序。</li>
                <li>取消已选记录或切换到另一条记录。<br />结果：触发取消选中处理，对应行信息出现在提示或日志中；没有改变选择时不凭普通单元格点击重复生成取消事件。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>通过键盘SHIFT，表头复选框多选时，会触发多次 rowselect 事件。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>rowselect / rowdeselect / selectionchange</code>（<strong>页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（多选）">表格（多选）</strong>）：按本页登记的客户端选择事件记录变化；逐行事件只在相应记录的状态改变时执行。</li>
            </ul>
        </section>
    </template>
</body>
</html>
