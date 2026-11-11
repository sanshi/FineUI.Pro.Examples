<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkbox.aspx.cs" Inherits="FineUI.Pro.Examples.form.checkbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false" Title="简单表单" runat="server">
            <Items>
                <f:CheckBox ID="CheckBox1" ShowLabel="false" runat="server" Text="复选框" MessageTarget="Qtip" Checked="true">
                </f:CheckBox>
                <f:Button ID="btnSelectCheckBox" CssClass="marginr" Text="选择/反选复选框" OnClick="btnSelectCheckBox_Click" runat="server">
                </f:Button>
                <f:Button ID="btnChangeCheckStatus" CssClass="marginr" Text="选择/反选复选框（客户端脚本）" runat="server" ClickHandler="onChangeCheckStatusClick"></f:Button>
                <f:Button ID="btnChangeText" Text="改变复选框文本" CssClass="marginr" OnClick="btnChangeText_Click" runat="server">
                </f:Button>
                <f:Button ID="btnDisable" CssClass="marginr" Text="启用/禁用复选框" OnClick="btnDisableCheckBox_Click" runat="server">
                </f:Button>
                <f:Label ID="Label1" runat="server">
                </f:Label>
                <f:CheckBox ID="CheckBox2" ShowLabel="false" runat="server" Text="声明变化事件后自动回发的复选框" OnCheckedChanged="CheckBox2_CheckedChanged" Checked="true">
                </f:CheckBox>
                <f:Label ID="labResult" runat="server" ShowLabel="false">
                </f:Label>
            </Items>
        </f:SimpleForm>

    </form>
    <script>
        var cbxClientID = '<%= CheckBox1.ClientID %>';

        function onChangeCheckStatusClick(event) {
            var checkbox = F(cbxClientID);
            checkbox.setValue(!checkbox.getValue());
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示复选框的选中、文字和可用状态修改，并对比客户端操作与后台回发。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check-box" aria-hidden="true"></i>反选、改文字和禁用</h3>
            <ul>
                <li>
                    点击“选择/反选复选框”。<br />
                    结果：回发后由后台反转第一个复选框的选中状态，再点一次恢复。
                </li>
                <li>
                    点击“选择/反选复选框（客户端脚本）”。<br />
                    结果：浏览器直接反选第一个复选框，无需回发。
                </li>
                <li>
                    点击“改变复选框文本”。<br />
                    结果：回发后由后台将第一个复选框的文字改为带当前时间的文本。
                </li>
                <li>
                    点击“启用/禁用复选框”。<br />
                    结果：回发后由后台禁用第一个复选框，此时无法直接勾选；再点一次恢复可用。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>响应勾选变化</h3>
            <ul>
                <li>
                    直接勾选或取消第二个复选框（声明变化事件后自动回发的复选框）。<br />
                    结果：变化事件回发后，后台读取选中状态，下方显示“复选框的状态：选中”或“复选框的状态：未选中”。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Checked</code>：布尔值表示是否选中，第一个复选框初始为选中。</li>
                <li><code>Text</code>：复选框旁的文字，本例可改为带时间的文本。</li>
                <li><code>Enabled</code>：控制是否可用，禁用后不能由用户直接勾选。</li>
                <li><code>OnCheckedChanged</code>：第二个复选框的选中状态改变时回发，后台更新结果标签。</li>
            </ul>
        </section>
    </template>
</body>
</html>
