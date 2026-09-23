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
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" EnableCheckBoxSelect="true"
            runat="server" DataIDField="Id" DataTextField="Name" DataUrl="~/griddataurl/griddataurl.ashx">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int"
                    RendererFunction="renderGender" HeaderText="性别">
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor"
                    ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                </f:RenderField>
                <f:RenderField ColumnID="Group" DataField="Group" RendererFunction="renderGroup" HeaderText="分组">
                </f:RenderField>
                <f:RenderField Width="50px" ColumnID="Actions" RendererFunction="renderActions" HeaderText="">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <f:Window ID="Window1" Title="审批" Hidden="true" EnableIFrame="true" runat="server"
            EnableMaximize="true" EnableResize="true" Target="Top" OnClose="Window1_Close"
            IsModal="true" Width="850px" Height="500px">
        </f:Window>
        <br />
    </form>
	<script src="../res/js/grid.js"></script>
    <script>


        function renderActions(value, params) {
            //return '<a class="action editit" href="#">' +
            //            '<img class="f-grid-imagefield" src="../res/icon/pencil.png">' +
            //       '</a>';
            return $('<a>', {
                'class': 'action editit',
                'href': '#'
            }).append($('<img>').addClass('f-grid-imagefield').attr('src', '../res/icon/pencil.png'));
        }


        var basePath = '<%= PageContext.ResolveUrl("~/grid/") %>';
        var grid1ClientID = '<%= Grid1.ClientID %>';
        var window1ClientID = '<%= Window1.ClientID %>';

        F.ready(function () {

            var grid1 = F(grid1ClientID);
            var window1 = F(window1ClientID);

            grid1.el.on('click', '.f-grid-cell-Actions .action.editit', function (event) {
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
</body>
</html>
