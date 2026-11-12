<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_rowdoubleclick_custompostback.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_rowdoubleclick_custompostback" %>

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
            </Columns>
            <Listeners>
                <f:Listener Event="rowdblclick" Handler="onRowDblClick" />
            </Listeners>
        </f:Grid>
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onRowDblClick(event, rowId) {
            var grid1 = this;

            var rowData = grid1.getRowData(rowId);

            // 第几行
            var rowIndex = grid1.getRowEl(rowId).index();

            F.customEvent('Grid1_RowDblClick', {
                rowIndex: rowIndex,
                rowId: rowData.id,
                rowText: rowData.text
            });
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>双击通过网址加载的记录，把当前行标识与文字提交到后台事件。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>从当前异步记录读取事件参数</h3>
            <ul>
                <li>双击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>首行<strong>姓名</strong>。<br />结果：后台提示本次行号、行标识与<strong>姓名</strong>；参数来自当前加载记录，不是把显示序号当作业务主键。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>rowdblclick / F.customEvent</code>（<strong>网址数据加载与页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：按当前节点的行对象或提交键值取得主键与<strong>姓名</strong>；本页只显示收到的事件参数。</li>
            </ul>
        </section>
    </template>
</body>
</html>
