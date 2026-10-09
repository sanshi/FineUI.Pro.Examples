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
</body>
</html>
