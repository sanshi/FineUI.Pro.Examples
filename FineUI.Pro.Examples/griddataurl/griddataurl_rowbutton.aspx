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
                <f:RenderField ColumnID="Actions" RendererFunction="renderActions"
                    HeaderText="">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
    </form>
	<script src="../res/js/grid.js"></script>
    <script>

        function renderActions(value, params) {
            return '<a class="action editit" href="#">' +
                        '<img class="f-grid-imagefield" src="../res/icon/pencil.png">' +
                   '</a>&nbsp;&nbsp;&nbsp;&nbsp;' +
                   '<a class="action deleteit" href="#">' +
                        '<img class="f-grid-imagefield" src="../res/icon/delete.png">' +
                   '</a>';
        }


        var grid1ClientID = '<%= Grid1.ClientID %>';

        F.ready(function () {

            var grid1 = F(grid1ClientID);

            grid1.el.on('click', '.f-grid-cell-Actions .action.editit', function (event) {
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


            grid1.el.on('click', '.f-grid-cell-Actions .action.deleteit', function (event) {
                event.preventDefault();
                var targetEl = $(this);
                var rowEl = targetEl.parents('.f-grid-row');
                var rowData = grid1.getRowData(rowEl);

                F.confirm({
                    message: '删除选中行？',
                    messageIcon: 'warning',
                    target: '_top',
                    ok: function () {
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
</body>
</html>
