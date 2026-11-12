<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_rowbutton.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_rowbutton" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/griddataurl/griddataurl.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" EnableCheckBoxSelect="true" runat="server"
            DataIDField="Id" DataTextField="Name" DataUrl="~/griddataurl/griddataurl.ashx">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
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
                <f:RenderField ColumnID="Actions" RendererFunction="renderActions" HeaderText="">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function renderActions(value, params) {
            return '<a class="action editit" href="#">' +
                '<img class="f-grid-imagefield" src="<%= PageContext.ResolveUrl("~/res/icon/pencil.png") %>">' +
                '</a>&nbsp;&nbsp;&nbsp;&nbsp;' +
                '<a class="action deleteit" href="#">' +
                '<img class="f-grid-imagefield" src="<%= PageContext.ResolveUrl("~/res/icon/delete.png") %>">' +
                '</a>';
        }


        var grid1ClientID = '<%= Grid1.ClientID %>';

        F.ready(function() {

            var grid1 = F(grid1ClientID);

            grid1.el.on('click', '.f-grid-cell-Actions .action.editit', function(event) {
                event.preventDefault();
                var targetEl = $(this);
                var rowEl = targetEl.parents('.f-grid-row');
                var rowData = grid1.getRowData(rowEl);

                F.customEvent('Grid1_CustomEvent', {
                    eventType: 'edit',
                    rowIndex: rowEl.index(),
                    rowId: rowData.id,
                    rowText: rowData.text
                });
            });


            grid1.el.on('click', '.f-grid-cell-Actions .action.deleteit', function(event) {
                event.preventDefault();
                var targetEl = $(this);
                var rowEl = targetEl.parents('.f-grid-row');
                var rowData = grid1.getRowData(rowEl);

                F.confirm({
                    message: '删除选中行？',
                    messageIcon: 'warning',
                    target: '_top',
                    ok: function() {
                        F.customEvent('Grid1_CustomEvent', {
                            eventType: 'delete',
                            rowIndex: rowEl.index(),
                            rowId: rowData.id,
                            rowText: rowData.text
                        });
                    }
                });

            });

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>为异步加载的每行绑定编辑与删除入口，用事件委托读取本次操作行资料。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>把行内入口交给后台处理</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>首行的编辑图标。<br />结果：页面从入口所属行取得标识和<strong>姓名</strong>，经自定义回发由后台显示操作信息。</li>
                <li>点击该行删除图标，先取消，再重新点击并确认。<br />结果：取消不提交删除事件；确认后后台显示本次删除动作及行资料，本示例不实际从数据源删除学生。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RendererFunction / click / F.customEvent</code>（<strong>网址数据加载与页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：先生成行内入口，再由表格容器接收点击并找到当前行；异步重绘后仍可使用同一处理。</li>
            </ul>
        </section>
    </template>
</body>
</html>
