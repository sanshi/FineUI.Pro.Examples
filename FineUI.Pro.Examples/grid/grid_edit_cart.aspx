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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在表格中修改商品数量并勾选商品，实时计算所选商品合计，再把结算明细交给后台读取。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>数量、选择与结算联动</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="购物车">购物车</strong>修改一个商品<strong>数量</strong>为<code>2</code>，再勾选该商品。<br />结果：这一行<strong>小计</strong>按单价乘<strong>数量</strong>更新，底部只累计已选商品；输入框过滤非数字字符。
                </li>
                <li>再勾选另一件商品，或取消已有商品的勾选。<br />结果：商品数按选中行数计算，总价按选中商品及其当前<strong>数量</strong>重新累计；没有可结算金额时结算按钮禁用。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnGotoPay").ClientID %>'
                        title="去结算">去结算</strong>。<br />结果：客户端收集所选行的商品标识、名称、单价和输入<strong>数量</strong>，后台显示结算明细；本页不创建订单或完成支付。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableCheckBoxSelect</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="购物车">购物车</strong>）：初始为
                    <code>true</code>，勾选行决定哪些商品参与合计与结算。
                </li>
                <li><code>selectionchange / input</code>（<strong>行内输入与页面脚本</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="购物车">购物车</strong>）：行选择和<strong>数量</strong>输入变化时重新计算<strong>小计</strong>与所选总价。</li>
                <li><code>OnClick / GridInputUtil.GetValue</code>（<strong>行内输入与页面脚本</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="购物车">购物车</strong>）：将本次选择及输入<strong>数量</strong>提交到示例结算处理，不把浏览器计算结果当作真实支付结果。</li>
            </ul>
        </section>
    </template>
</body>
</html>
