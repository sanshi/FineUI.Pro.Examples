<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_edit_cart.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_edit_cart" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .totalpanel {
            border-width: 1px 0;
        }

    </style>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel2" runat="server" />
        <f:Panel ID="Panel2" Margin="24px" runat="server" ShowBorder="true" Layout="VBox" ShowHeader="false">
            <Items>
                <f:Grid DataIDField="Id" ID="Grid1" ShowBorder="false" BoxFlex="1" ShowHeader="true" Title="购物车" EnableCollapse="false" runat="server"
                    EnableCheckBoxSelect="true" DataKeyNames="Id,Code,Name" EnableTextSelection="true" KeepCurrentSelection="true" DataAttributeFields="Price">
                    <Columns>
                        <f:RowNumberField />
                        <f:RenderField Width="150px" DataField="Code" HeaderText="商品代码" />
                        <f:RenderField DataField="Name" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="商品名称" />
                        <f:RenderField Width="150px" DataField="Price" HeaderText="商品单价" EnableColumnHide="false" RendererFunction="renderPrice3" />
                        <f:RenderField HeaderText="数量" EnableColumnHide="false" Width="150px" DataField="Number" RendererFunction="renderInput1" />
                        <f:RenderField HeaderText="小计" EnableColumnHide="false" Width="150px" DataField="Number" RendererFunction="renderSubtotal2" />
                    </Columns>
                    <Listeners>
                        <f:Listener Event="selectionchange" Handler="onGridSelectionchange" />
                    </Listeners>
                </f:Grid>
                <f:ContentPanel runat="server" CssClass="totalpanel" ShowBorder="true" ShowHeader="false">
                    <div style="text-align: right; padding: 10px;">
                        <div style="margin-bottom: 10px;">
                            <input type="hidden" id="TOTAL_NUMBER" name="TOTAL_NUMBER" />
                            <span id="totalNumber" style="color: red;"></span>
                            件商品
                        </div>
                        <div style="margin-bottom: 10px;">
                            <input type="hidden" id="TOTAL_PRICE" name="TOTAL_PRICE" />
                            总计：<span id="totalPrice" style="color: red; font-size: 1.5em; font-weight: bold;"></span>
                        </div>
                        <div>
                            <f:Button runat="server" Text="去结算" Enabled="false" Size="Large" ID="btnGotoPay" OnClick="btnGotoPay_Click"></f:Button>
                        </div>
                    </div>
                </f:ContentPanel>
            </Items>
        </f:Panel>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        function renderInput1(value, params) {
            params.grid = this;
            var price = $('<input>').attr({
                type: 'hidden',
                value: params.rowData.attrs.Price
            }).addClass('price');
            return $('<span>').append(price, createGridTextInput(value, params, {
                id: 'tbxNumber',
                cssClass: 'number',
                width: '60px'
            }));
        }

        function renderSubtotal2(value, params) {
            return $('<span>').addClass('xiaoji').text('¥' + (Number(params.rowData.attrs.Price) * Number(value)).toFixed(2));
        }

        function renderPrice3(value, params) {
            return '¥' + Number(value).toFixed(2);
        }

    </script>
    <script type="text/javascript">
        var gridClientID = '<%= Grid1.ClientID %>';
        var btnGotoPayClientID = '<%= btnGotoPay.ClientID %>';
        var numberSelector = '.f-grid-cell input.number';
        var priceSelector = '.f-grid-cell input.price';

        function getRowNumber(row) {
            var num = parseInt(row.find(numberSelector).val(), 10);
            if (isNaN(num)) {
                num = 0;
            }
            return num;
        }

        function getRowPrice(rowEl) {
            return parseFloat(rowEl.find(priceSelector).val()) || 0;
        }

        function updateTotal() {
            var grid = F(gridClientID);
            var selectedRows = grid.getSelectedRows();

            var total = 0;
            $.each(selectedRows, function(index, rowId) {
                var rowEl = grid.getRowEl(rowId);
                total += getRowNumber(rowEl) * getRowPrice(rowEl);
            });

            $('#totalNumber').text(selectedRows.length);
            $('#totalPrice').text("¥" + total.toFixed(2));

            $('#TOTAL_NUMBER').val(selectedRows.length);
            $('#TOTAL_PRICE').val(total.toFixed(2));

            var gotoPayBtn = F(btnGotoPayClientID);
            if (total === 0) {
                gotoPayBtn.disable();
            } else {
                gotoPayBtn.enable();
            }
        }

        // 选中行改变时更新合计
        function onGridSelectionchange(event) {
            updateTotal();
        }

        // 过滤数字输入框中的无效字符
        function filterNumberInput(inputNode) {
            // 仅保留数字、点号和负号
            //var filterRegex = /[^0-9\.\-]/g;
            // 仅保留数字
            var filterRegex = /[^0-9]/g;

            var originalValue = inputNode.val();
            var filteredValue = originalValue.replace(filterRegex, '');
            if (originalValue !== filteredValue) {
                inputNode.val(filteredValue);
            }
        }

        function registerNumberChangeEvents() {
            var grid = F(gridClientID);

            // 数量改变事件
            // http://stackoverflow.com/questions/17384218/jquery-input-event
            grid.el.find(numberSelector).on('input propertychange', function(event) {
                var cnode = $(this);

                filterNumberInput(cnode);

                var rowEl = cnode.parents('.f-grid-row');
                var number = getRowNumber(rowEl);
                var price = getRowPrice(rowEl);
                var resultNode = rowEl.find('.f-grid-cell span.xiaoji');

                resultNode.text("¥" + (number * price).toFixed(2));

                updateTotal();

            }).on('click', function(event) {
                $(this).select();
                // 点击行内文本框时不会改变行的选中状态
                event.stopPropagation();
            });
        }


        // 页面第一次加载完成后调用的函数
        F.ready(function() {
            registerNumberChangeEvents();
            updateTotal();
        });

    </script>
</body>
</html>
