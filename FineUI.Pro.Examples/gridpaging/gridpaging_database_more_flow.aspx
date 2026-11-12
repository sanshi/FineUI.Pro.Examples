<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_database_more_flow.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_database_more_flow" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .morebutton {
            text-align: center;
            margin: 10px 0;
        }

        .morebutton a[disabled] {
            cursor: not-allowed !important;
            text-decoration: none;
            opacity: .5;
            filter: alpha(opacity=50);
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" AttributeDataTag="0" Height="350px">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';
        var morebuttonSelector = '.f-grid-bodyct >.morebutton a';

        function disableMoreButton() {
            var grid1 = F(Grid1ClientID);

            // 禁用链接
            var morebuttonEl = grid1.el.find(morebuttonSelector);
            morebuttonEl.attr('disabled', true).removeAttr('href').text('全部加载完毕');
        }

        F.ready(function() {
            var grid1 = F(Grid1ClientID);

            var tableEl = grid1.el.find('.f-grid-bodyct .f-grid-table');
            tableEl.after('<div class="morebutton"><a href="#">加载更多...</a></div>');


            grid1.el.on('click', morebuttonSelector, function(event) {
                event.preventDefault();
                var morebuttonEl = $(this);
                if (morebuttonEl.attr('disabled')) {
                    return;
                }

                F.customEvent('MoreClick');
            });

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在固定高度的表格内部追加记录，滚动查看数据时保留表头。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>逐批追加记录</h3>
            <ol>
                <li>滚动<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>到末尾，点击<strong>加载更多...</strong>。<br />结果：触发本页加载处理，后台读取下一批记录并追加，已显示的记录仍保留。</li>
                <li>继续加载，直到没有剩余记录。<br />结果：加载入口变为不可继续加载的状态；不会重复追加最后一批记录。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AppendData</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：把新一批数据追加到表格；区别于重新绑定时替换现有记录。
                </li>
                <li><code>Height</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>350px</code>，限制表格高度，使数据在表格内部滚动，表头保持可见。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
