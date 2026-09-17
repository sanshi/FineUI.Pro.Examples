<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_updatecellvalue_tax.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_updatecellvalue_tax" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="false" Height="350px"
            runat="server" AllowCellEditing="true" ClicksToEdit="1" IncludeMergedData="true">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnNew" Text="新增数据" Icon="Add" runat="server" ClickHandler="onNewClick">
                        </f:Button>
                        <f:Button ID="btnDelete" Text="删除选中行" Icon="Delete" runat="server" ClickHandler="onDeleteClick">
                        </f:Button>
                        <f:ToolbarFill runat="server">
                        </f:ToolbarFill>
                        <f:Button ID="btnReset" Text="重置表格数据" runat="server" ClickHandler="onResetClick">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="应税名称" ExpandUnusedSpace="true" MinWidth="150px">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="Price" DataField="Price" FieldType="Float" HeaderText="金额（不含税）">
                    <Editor>
                        <f:NumberBox ID="TextBox1" NoDecimal="false" NoNegative="true" Required="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="PriceWithTax" DataField="PriceWithTax" FieldType="Float" HeaderText="金额（含税）">
                    <Editor>
                        <f:NumberBox ID="NumberBox1" NoDecimal="false" NoNegative="true" Required="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="TaxPercent" DataField="TaxPercent" FieldType="Float" HeaderText="征收率">
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="Tax" DataField="Tax" FieldType="Float" HeaderText="税额">
                    <Editor>
                        <f:NumberBox ID="NumberBox2" NoDecimal="false" NoNegative="true" Required="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Delete" Width="50px" TextAlign="Center" EnableHeaderMenu="false">
                    <Commands>
                        <f:Command CommandName="Delete" Icon="Delete" ConfirmText="删除选中行？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="afteredit" Handler="onGridAfterEdit" />
                <f:Listener Event="rowcommand" Handler="onGrid1RowCommand" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        注：编辑[金额（不含税）]、[金额（含税）]、[税额]中的任一列，其他两列的值都会相应的改变。
    </form>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';

        // 删除工具栏中选中的行（先确认）。
        function deleteSelectedRows() {
            F.confirm({
                message: '删除选中行？',
                messageIcon: 'question',
                ok: function() {
                    F(Grid1ClientID).deleteSelectedRows(false);
                }
            });
        }

        function onNewClick(event) {
            F(Grid1ClientID).addNewRecord({
                    "Name": "技术服务",
                    "TaxPercent": 0.03
                },
                true);
        }

        function onGrid1RowCommand(event, rowId, rowIndex, columnId, commandName) {
            if (commandName === 'Delete') {
                F(Grid1ClientID).deleteRow(rowId);
            }
        }

        function onDeleteClick(event) {
            if (!F(Grid1ClientID).hasSelection()) {
                F.alert({
                    message: '请至少选择一项！',
                    messageIcon: 'information'
                });
                return false;
            }
            deleteSelectedRows();
        }

        function onResetClick(event) {
            F.confirm({
                message: '确定要重置表格数据？',
                ok: function() {
                    F(Grid1ClientID).rejectChanges();
                },
                messageIcon: 'question'
            });
        }


        function onGridAfterEdit(event, value, params) {
            var me = this,
                columnId = params.columnId,
                rowId = params.rowId;

            // 本次操作过程中禁止触发事件（防止循环事件）
            F.noEvent(function() {
                if (columnId === 'Price') {
                    var priceWithTax = (value * 1.03).toFixed(2);
                    var tax = (parseFloat(priceWithTax) - value).toFixed(2);

                    me.updateCellValue(rowId, 'PriceWithTax', priceWithTax);
                    me.updateCellValue(rowId, 'Tax', tax);
                } else if (columnId === 'PriceWithTax') {
                    var price = (value / 1.03).toFixed(2);
                    var tax = (value - parseFloat(price)).toFixed(2);

                    me.updateCellValue(rowId, 'Price', price);
                    me.updateCellValue(rowId, 'Tax', tax);
                } else if (columnId === 'Tax') {
                    var price = (value / 0.03).toFixed(2);
                    var priceWithTax = (value + parseFloat(price)).toFixed(2);

                    me.updateCellValue(rowId, 'Price', price);
                    me.updateCellValue(rowId, 'PriceWithTax', priceWithTax);
                }
            });
        }

    </script>
</body>
</html>
