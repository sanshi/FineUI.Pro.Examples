<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkboxlist_radio.aspx.cs" Inherits="FineUI.Pro.Examples.form.checkboxlist_radio" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" EnableCollapse="false" BodyPadding="10px" ShowBorder="true" ShowHeader="true"
            Title="复选框列表（最多选中一项）">
            <Items>
                <f:CheckBoxList ID="CheckBoxList1" ColumnNumber="2" Label="列表一" runat="server">
                    <Items>
                        <f:CheckItem Text="可选项 1" Value="value1" />
                        <f:CheckItem Text="可选项 2" Value="value2" Selected="true" />
                        <f:CheckItem Text="可选项 3" Value="value3" />
                        <f:CheckItem Text="可选项 4" Value="value4" />
                        <f:CheckItem Text="可选项 5" Value="value5" />
                        <f:CheckItem Text="可选项 6" Value="value6" />
                    </Items>
                    <Listeners>
                        <f:Listener Event="change" Handler="onCheckBoxListChange" />
                    </Listeners>
                </f:CheckBoxList>
            </Items>
        </f:SimpleForm>
    </form>
    <script type="text/javascript">
        // 同时只能选中一项
        function onCheckBoxListChange(event, checkbox, isChecked) {
            var me = this;

            // 当前操作是：选中
            if (isChecked) {
                // 仅选中这一项
                me.setValue(checkbox.getInputValue());
            }

            // 触发后台事件
            F.customEvent('CheckBoxList1Change');
        }


        /* 
        // 老方法，也能实现相同效果，只不过复杂了点
        function onCheckBoxListChange(event) {
            var me = this, targetEl = $(event.target);

            // event.target 可能复选框图标，也可能是文本
            var inputEl = targetEl.parents('.f-field-checkbox-wrap').find('.f-field-checkbox');

            if (inputEl.is(':checked')) {
                me.setValue(inputEl.val());
            }

            F.customEvent('CheckBoxList1Change');
        }
        */

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>通过变化事件将复选框列表限制为最多选中一项。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check-box" aria-hidden="true"></i>只保留新勾选项</h3>
            <ol>
                <li>
                    勾选<code>可选项 1</code>。<br />
                    结果：原来选中的“可选项 <code>2</code>”取消，仅保留第一项，提示中包含 <code>value1</code>。
                </li>
                <li>
                    再次取消“可选项 <code>1</code>”。<br />
                    结果：列表允许没有选中项；提示显示当前无选择。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Listener Event=&quot;change&quot;</code>（<strong class="example-control-reference"
                        data-example-control="<%= CheckBoxList1.ClientID %>" title="列表一">列表一</strong>）：勾选新项时把整个列表的选中值改为该项，取消原选择；不是使用内置单选限制属性。</li>
                <li><code>SelectedValueArray</code>（<strong class="example-control-reference" data-example-control="<%= CheckBoxList1.ClientID %>"
                        title="列表一">列表一</strong>）：后台收到变化通知后读取当前选中值数组并显示提示，实际限制逻辑由客户端完成。</li>
            </ul>
        </section>
    </template>
</body>
</html>
