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
                <f:Grid DataIDField="Id" ID="Grid1" ShowBorder="false" BoxFlex="1" ShowHeader="true" Title="购物车"
                    EnableCollapse="false" runat="server" EnableCheckBoxSelect="true"
                    DataKeyNames="Id,Code,Name" EnableTextSelection="true" KeepCurrentSelection="true">
                    <Columns>
                        <f:RowNumberField />
                        <f:BoundField Width="150px" DataField="Code" DataFormatString="{0}" HeaderText="商品代码" />
                        <f:BoundField DataField="Name" ExpandUnusedSpace="true" MinWidth="150px" DataFormatString="{0}" HeaderText="商品名称" />
                        <f:BoundField Width="150px" DataField="Price" HeaderText="商品单价" EnableColumnHide="false" DataFormatString="¥{0:F}" />
                        <f:TemplateField HeaderText="数量" EnableColumnHide="false" Width="150px">
                            <ItemTemplate>
                                <input type="hidden" class="price" runat="server" value='<%# Eval("Price") %>' />
                                <asp:TextBox runat="server" Width="60px" ID="tbxNumber" CssClass="number"
                                    TabIndex='<%# Container.DataItemIndex + 10 %>' Text='<%# Eval("Number") %>'></asp:TextBox>
                            </ItemTemplate>
                        </f:TemplateField>
                        <f:TemplateField HeaderText="小计" EnableColumnHide="false" Width="150px">
                            <ItemTemplate>
                                <asp:Label runat="server" CssClass="xiaoji" Text='<%# "¥" + GetXiaoji(Eval("Price"), Eval("Number")) %>'></asp:Label>
                            </ItemTemplate>
                        </f:TemplateField>
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
    <script type="text/javascript">
        var gridClientID = '<%= Grid1.ClientID %>';
        var btnGotoPayClientID = '<%= btnGotoPay.ClientID %>';
        var numberSelector = '.f-grid-tpl input.number';
        var priceSelector = '.f-grid-tpl input.price';

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
            $.each(selectedRows, function (index, rowId) {
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
            grid.el.find(numberSelector).on('input propertychange', function (event) {
                var cnode = $(this);

                filterNumberInput(cnode);

                var rowEl = cnode.parents('.f-grid-row');
                var number = getRowNumber(rowEl);
                var price = getRowPrice(rowEl);
                var resultNode = rowEl.find('.f-grid-tpl span.xiaoji');

                resultNode.text("¥" + (number * price).toFixed(2));

                updateTotal();

            }).on('click', function (event) {
                $(this).select();
                // 点击行内文本框时不会改变行的选中状态
                event.stopPropagation();
            });
        }


        // 页面第一次加载完成后调用的函数
        F.ready(function () {
            registerNumberChangeEvents();
            updateTotal();
        });

    </script>
</body>
</html>
