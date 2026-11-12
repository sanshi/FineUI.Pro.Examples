<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_tooltip_showtooltip.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_tooltip_showtooltip" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderField DataField="AtSchool" HeaderText="是否在校" RendererFunction="renderInverseCheck1" />
                <f:RenderField HeaderText="所学专业" ToolTipPosition="TopStart" DataField="Major" Width="150px" RendererFunction="renderTooltip2" />
                <f:RenderField HeaderText="所学专业" DataField="Major" ShowToolTip="true" ToolTipPosition="TopStart" Width="150px" />
                <f:RenderField HeaderText="所学专业" DataField="Major" ShowToolTip="true" ToolTipPosition="TopStart" RendererFunction="renderMajorLink"
                    ExpandUnusedSpace="true" MinWidth="150px" />
            </Columns>
        </f:Grid>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function renderInverseCheck1(value, params) {
            var checked = String(value).toLowerCase() === 'false';
            return $('<i>').addClass('f-icon f-iconfont f-grid-static-checkbox').toggleClass('f-checked', checked);
        }

        function renderTooltip2(value, params) {
            return $('<span>').text(value).attr('data-qtip', F.htmlEncode(value)).attr('data-qposition', 'topstart');
        }

    </script>
    <script>
        function renderMajorLink(value) {
            //var url = 'http://gsa.ustc.edu.cn/search?q=' + F.urlEncode(value);
            //return F.formatString('<a href="{0}" target="_blank">{1}</a>', url, F.htmlEncode(value));
            var encodedValue = F.htmlEncode(value);
            return $('<a>', {
                'target': '_blank',
                'href': 'http://gsa.ustc.edu.cn/search?q=' + F.urlEncode(value),
                'html': encodedValue
            });
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>使用列的自动提示能力显示完整单元格文字，并设置提示位置。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>悬停查看单元格提示</h3>
            <ul>
                <li>把鼠标移到<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的专业等提示单元格文字上。<br />结果：浏览器读取当前显示文字并弹出提示，位置采用本列配置；没有额外回发。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ShowToolTip / ToolTipPosition</code>（<strong>启用提示的列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：启用自动提示，并指定相对单元格的弹出位置。</li>
            </ul>
        </section>
    </template>
</body>
</html>
