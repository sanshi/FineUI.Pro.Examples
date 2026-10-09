<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_simulate_tree_checkboxfield_clientscript.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_simulate_tree_checkboxfield_clientscript" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" DataKeyNames="Id,Name,TreeLevel" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" DataSimulateTreeLevelField="TreeLevel" HeaderText="地区" ExpandUnusedSpace="true"
                    MinWidth="150px" />
                <f:GroupField HeaderTextAlign="Center" HeaderText="这是多表头">
                    <Columns>
                        <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                        <f:RenderCheckField ColumnID="CheckBoxField1" RenderAsStaticField="false" HeaderText="复选框列" />
                        <f:RenderField ColumnID="Action1">
                            <Commands>
                                <f:Command CommandName="Action1" Text="按钮 1" />
                            </Commands>
                        </f:RenderField>
                        <f:RenderField ColumnID="Action2">
                            <Commands>
                                <f:Command ConfirmText="你确定要这么做么？" ConfirmTarget="Top" CommandName="Action2" Text="按钮 2" />
                            </Commands>
                        </f:RenderField>
                    </Columns>
                </f:GroupField>
            </Columns>
            <Listeners>
                <f:Listener Event="rowcommand" Handler="onGrid1RowCommand" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：
        <ul>
            <li>初始选中 安徽省 合肥市 黄山市 的复选框列；</li>
            <li>选中（或取消）父级的复选框，会同时选中（或取消）所有的子级复选框（客户端脚本实现）。</li>
        </ul>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        function onGrid1RowCommand(event, rowId, rowIndex, columnId, commandName) {
            var grid = F('<%= Grid1.ClientID %>');
            F.customEvent('GridRowCommand', {
                rowId: rowId,
                columnId: columnId,
                commandName: commandName,
                isChecked: grid.getRowEl(rowId).find('.f-grid-cell-CheckBoxField1 .f-grid-checkbox').hasClass('f-checked')
            });
        }

        F.ready(function() {
            var grid = F('<%= Grid1.ClientID %>');
            var checkboxSelector = '.f-grid-cell-CheckBoxField1 .f-grid-checkbox';

            function getRowLevel(rowEl) {
                return $(grid.getRowData(rowEl).values.Name).filter('.f-smtree-icon').length;
            }
            grid.el.on('click', checkboxSelector, function(event) {
                var rowEl = $(this).closest('.f-grid-row');
                var rowLevel = getRowLevel(rowEl);
                var isChecked = $(this).hasClass('f-checked');
                var childRowIDs = [];
                var nextRowEl = rowEl.next();
                while (nextRowEl.length && getRowLevel(nextRowEl) > rowLevel) {
                    childRowIDs.push(grid.getRowData(nextRowEl).id);
                    nextRowEl = nextRowEl.next();
                }
                setGridCheckColumns(grid, childRowIDs, ['CheckBoxField1'], isChecked);
            });
        });

    </script>
</body>
</html>
