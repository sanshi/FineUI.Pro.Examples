<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_tooltip.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_tooltip" %>

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
                <f:RenderField HeaderText="所学专业" DataField="Major" Width="150px" RendererFunction="renderTooltip2" />
                <f:RenderField HeaderText="所学专业" DataField="Major" RendererFunction="renderMajor" Width="150px" />
                <f:RenderField HeaderText="所学专业" DataField="Major" RendererFunction="renderMajorLink" ExpandUnusedSpace="true" MinWidth="150px" />
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
            return $('<span>').text(value).attr('data-qtip', F.htmlEncode(value));
        }

    </script>
    <script>
        function renderMajor(value) {
            //return F.formatString('<span data-qtip="{0}">{0}</span>', F.htmlEncode(value));
            var encodedValue = F.htmlEncode(value);
            return $('<span>', {
                'data-qtip': encodedValue,
                'html': encodedValue
            });
        }

        function renderMajorLink(value) {
            //var url = 'http://gsa.ustc.edu.cn/search?q=' + F.urlEncode(value);
            //return F.formatString('<a href="{0}" data-qtip="{1}" target="_blank">{1}</a>', url, F.htmlEncode(value));
            var encodedValue = F.htmlEncode(value);
            return $('<a>', {
                'target': '_blank',
                'href': 'http://gsa.ustc.edu.cn/search?q=' + F.urlEncode(value),
                'data-qtip': encodedValue,
                'html': encodedValue
            });
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在自定义列内容上设置提示属性，悬停时补充显示文字。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>悬停查看单元格提示</h3>
            <ul>
                <li>把鼠标移到<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的专业等提示单元格文字上。<br />结果：自定义内容上的 data-qtip 决定提示文字；提示由浏览器显示，链接仍保留自身跳转行为。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>data-qtip</code>（<strong>列渲染函数</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：附在渲染结果的文字或链接元素上，提示内容与实际显示元素对应。</li>
            </ul>
        </section>
    </template>
</body>
</html>
