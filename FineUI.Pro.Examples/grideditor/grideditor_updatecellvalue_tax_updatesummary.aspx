<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_updatecellvalue_tax_updatesummary.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_updatecellvalue_tax_updatesummary" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-row-summary .f-grid-cell-text {
            font-weight: bold;
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="false" Height="350px"
            runat="server" AllowCellEditing="true" ClicksToEdit="1" EnableSummary="true" SummaryPosition="Bottom">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnNew" Text="新增数据" Icon="Add" runat="server" ClickHandler="onNewClick"></f:Button>
                        <f:Button ID="btnDelete" Text="删除选中行" Icon="Delete" runat="server" ClickHandler="onDeleteClick"></f:Button>
                        <f:ToolbarFill runat="server">
                        </f:ToolbarFill>
                        <f:Button ID="btnReset" Text="重置表格数据" runat="server" ClickHandler="onResetClick"></f:Button>
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
                <f:RenderField ColumnID="TaxPercent" DataField="TaxPercent" FieldType="Float" HeaderText="征收率">
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="Price" DataField="Price" FieldType="Float"
                    HeaderText="金额（不含税）">
                    <Editor>
                        <f:NumberBox ID="TextBox1" NoDecimal="false" NoNegative="true" Required="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="PriceWithTax" DataField="PriceWithTax" FieldType="Float"
                    HeaderText="金额（含税）">
                    <Editor>
                        <f:NumberBox ID="NumberBox1" NoDecimal="false" NoNegative="true" Required="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="Tax" DataField="Tax" FieldType="Float"
                    HeaderText="税额">
                    <Editor>
                        <f:NumberBox ID="NumberBox2" NoDecimal="false" NoNegative="true" Required="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:LinkButtonField ColumnID="Delete"
                    Icon="Delete" />
            </Columns>
            <Listeners>
                <f:Listener Event="afteredit" Handler="onGridAfterEdit" />
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
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
        <br />
        本示例的很多功能都在客户端完成：
        <ul>
            <li>[新增数据]按钮的操作</li>
            <li>[删除选中行]按钮的操作</li>
            <li>[重置表格数据]按钮的操作</li>
            <li>表格行中删除图标的操作</li>
            <li>表格行中姓名列的编辑器TriggerBox，其点击触发按钮的操作</li>
            <li>更新合计行操作（如下两种情况下触发：1.更新单元格值时  2.表格的 dataload 客户端事件）</li>
        </ul>
    </form>
    <script>

        var grid1ClientID = '<%= Grid1.ClientID %>';

        function onNewClick(event) {
            F(grid1ClientID).addNewRecord({
                "Name": "技术服务",
                "TaxPercent": 0.03,
                'Delete': '<a href="#"><img src="../res/icon/delete.png"/></a>'
            }, true);
        }

        function onDeleteClick(event) {
            var grid = F(grid1ClientID);

            // 如果没有选中项，弹出提示信息
            if (!grid.hasSelection()) {
                F.alert('请至少选择一项！');
                return;
            }

            // 删除选中行之前先弹出确认对话框
            F.confirm({
                message: '删除选中行？',
                ok: function () {
                    // 删除选中行
                    grid.deleteSelectedRows();
                }
            });
        }


        function onResetClick(event) {
            F.confirm({
                message: '确定要重置表格数据？',
                ok: function () {
                    F(grid1ClientID).rejectChanges();
                }
            });
        }

        function onGridAfterEdit(event, value, params) {
            var me = this, columnId = params.columnId, rowId = params.rowId;

            // 本次操作过程中禁止触发事件（防止循环事件）
            F.noEvent(function () {
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

                // 更新合计行
                updateSummary();
            });
        }


        function updateSummary() {
            var me = F(grid1ClientID), priceTotal = 0, priceWithTaxTotal = 0, taxTotal = 0;
            me.getRowEls().each(function (index, tr) {
                var price = me.getCellValue(tr, 'Price');
                var priceWithTax = me.getCellValue(tr, 'PriceWithTax');
                var tax = me.getCellValue(tr, 'Tax');

                price = isNaN(price) ? 0 : price;
                priceWithTax = isNaN(priceWithTax) ? 0 : priceWithTax;
                tax = isNaN(tax) ? 0 : tax;

                priceTotal += price;
                priceWithTaxTotal += priceWithTax;
                taxTotal += tax;
            });

            // 第三个参数 true，强制更新，不显示左上角的更改标识
            me.updateSummaryCellValue('Price', priceTotal.toFixed(2), true);
            me.updateSummaryCellValue('PriceWithTax', priceWithTaxTotal.toFixed(2), true);
            me.updateSummaryCellValue('Tax', taxTotal.toFixed(2), true);
        }


        // 表格数据加载后，重新计算合计行
        function onGridDataLoad(event) {
            updateSummary();
        }

        F.ready(function () {

            var grid = F(grid1ClientID);
            // 注册点击行中删除图片的事件处理函数
            grid.el.on('click', '.f-grid-cell-Delete a', function (event) {
                event.preventDefault();
                // 删除选中行之前先弹出确认对话框
                F.confirm({
                    message: '删除选中行？',
                    ok: function () {
                        // 删除选中行
                        grid.deleteSelectedRows();
                    }
                });
            });

            // 初始增加一个空白行
            onNewClick();

        });

        
    </script>
</body>
</html>
