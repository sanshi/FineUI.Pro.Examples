<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkboxlist_at_least_one.aspx.cs" Inherits="FineUI.Pro.Examples.form.checkboxlist_at_least_one" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" EnableCollapse="false" BodyPadding="10px" ShowBorder="true" ShowHeader="true"
            Title="复选框列表（至少选中一项）">
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

            // 当前操作是：取消选中
            if (!isChecked) {
                // 如果一项都没选中，则本次取消操作无效
                if (!me.getValue().length) {
                    // 重新选中本项
                    me.setValue(checkbox.getInputValue());
                }
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
            <p>通过变化事件阻止复选框列表取消最后一个选中项。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check-box-checked" aria-hidden="true"></i>保留至少一个选择</h3>
            <ol>
                <li>
                    取消初始选中的“可选项 <code>2</code>”。<br />
                    结果：取消动作被客户端撤销，第二项仍选中。
                </li>
                <li>
                    先勾选<code>可选项 1</code>，再取消“可选项 <code>2</code>”。<br />
                    结果：仍有第一项选中，因此允许取消第二项；提示反映当前选择。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Listener Event=&quot;change&quot;</code>（<strong class="example-control-reference"
                        data-example-control="<%= CheckBoxList1.ClientID %>" title="列表一">列表一</strong>）：取消后先检查当前值数组；若已经为空，立即重新选中刚取消的项。此页允许多选，只限制至少保留一项。</li>
                <li><code>SelectedValueArray</code>（<strong class="example-control-reference" data-example-control="<%= CheckBoxList1.ClientID %>"
                        title="列表一">列表一</strong>）：后台收到变化通知后读取当前选中值数组并显示提示，实际限制逻辑由客户端完成。</li>
            </ul>
        </section>
    </template>
</body>
</html>
