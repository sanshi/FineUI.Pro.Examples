<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_simulate_tree_checkboxfield.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_simulate_tree_checkboxfield" %>

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
                <f:RenderField DataField="Name" DataSimulateTreeLevelField="TreeLevel" EncodeText="true" HeaderText="地区" ExpandUnusedSpace="true"
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
            <li>选中（或取消）父级的复选框，会同时选中（或取消）所有的子级复选框。</li>
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
                isChecked: grid.getRowData(rowId).values.CheckBoxField1
            });
        }

        F.ready(function() {
            bindGridCheckChange(F('<%= Grid1.ClientID %>'), 'CheckBoxField1');
        });

    </script>
</body>
</html>
