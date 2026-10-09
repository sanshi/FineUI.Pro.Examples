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
</body>
</html>
