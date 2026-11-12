<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_iframe.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_iframe" %>

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
                <f:RenderField Width="50px" ColumnID="Actions" RendererFunction="renderActions" HeaderText="">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <f:Window ID="Window1" Title="审批" Hidden="true" EnableIFrame="true" runat="server" EnableMaximize="true" EnableResize="true" Target="Top"
            OnClose="Window1_Close" IsModal="true" Width="850px" Height="500px">
        </f:Window>
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function renderActions(value, params) {
            //return '<a class="action editit" href="#">' +
            //            '<img class="f-grid-imagefield" src="<%= PageContext.ResolveUrl("~/res/icon/pencil.png") %>">' +
            //       '</a>';
            return $('<a>', {
                'class': 'action editit',
                'href': '#'
            }).append($('<img>').addClass('f-grid-imagefield').attr('src', '<%= PageContext.ResolveUrl("~/res/icon/pencil.png") %>'));
        }


        var basePath = '<%= PageContext.ResolveUrl("~/grid/") %>';
        var grid1ClientID = '<%= Grid1.ClientID %>';
        var window1ClientID = '<%= Window1.ClientID %>';

        F.ready(function() {

            var grid1 = F(grid1ClientID);
            var window1 = F(window1ClientID);

            grid1.el.on('click', '.f-grid-cell-Actions .action.editit', function(event) {
                event.preventDefault();
                var targetEl = $(this);
                var rowEl = targetEl.parents('.f-grid-row');
                var rowData = grid1.getRowData(rowEl);
                var rowId = rowData.id;
                var rowText = rowData.text;


                // grid_iframe_window.aspx?id=104&name=刘国
                var iframeUrl = basePath + 'grid_iframe_window.aspx?id=' + rowId + '&name=' + encodeURIComponent(rowText);
                // 显示窗体
                window1.show(iframeUrl, '审批 - ' + rowText);
            });



        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>从异步记录打开审批 IFrame 窗体，用当前行标识和姓名生成网址与标题。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>按当前行打开独立窗体</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>某行的铅笔图标。<br />结果：窗体标题带上这行<strong>姓名</strong>，子页网址携带对应 id 与已编码<strong>姓名</strong>；换一行打开时使用那一行参数。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableIFrame</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="审批">审批</strong>）：初始为
                    <code>true</code>，使用子页面显示当前行资料。
                </li>
                <li><code>getRowData / show</code>（<strong>网址数据加载与页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：从点击入口所属行读取数据，再显示本页窗体；不依赖整行是否事先被选中。</li>
            </ul>
        </section>
    </template>
</body>
</html>
