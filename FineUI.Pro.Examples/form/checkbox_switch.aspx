<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkbox_switch.aspx.cs" Inherits="FineUI.Pro.Examples.form.checkbox_switch" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .mycheckbox .f-field-checkbox-switch .f-field-checkbox-switch-text {
            min-width: 40px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false" Title="简单表单" runat="server" LabelWidth="200px">
            <Items>
                <f:CheckBox ID="CheckBox1" ShowLabel="false" runat="server" Text="复选框" DisplayType="Switch" Checked="true">
                </f:CheckBox>
                <f:Button ID="btnSelectCheckBox" CssClass="marginr" Text="选择/反选复选框" OnClick="btnSelectCheckBox_Click" runat="server">
                </f:Button>
                <f:Button ID="btnChangeCheckStatus" CssClass="marginr" Text="选择/反选复选框（客户端脚本）" runat="server" ClickHandler="onChangeCheckStatusClick"></f:Button>
                <f:Button ID="btnChangeEnabled" CssClass="marginr" Text="禁用/启用复选框（客户端脚本）" runat="server" ClickHandler="onChangeEnabledClick"></f:Button>
                <f:Button ID="btnDisable" CssClass="marginr" Text="启用/禁用复选框" OnClick="btnDisableCheckBox_Click" runat="server">
                </f:Button>
                <f:Label ID="Label1" runat="server">
                </f:Label>
                <f:CheckBox ID="CheckBox2" Label="自动回发" runat="server" DisplayType="Switch" OnCheckedChanged="CheckBox2_CheckedChanged" Checked="true">
                </f:CheckBox>
                <f:Label ID="Label2" runat="server">
                </f:Label>
                <f:CheckBox ID="CheckBox3" Label="开关文本" runat="server" Checked="true" DisplayType="Switch" SwitchTextVisible="true">
                </f:CheckBox>
                <f:CheckBox ID="CheckBox4" Label="开关文本（自定义）" runat="server" DisplayType="Switch" SwitchTextVisible="true" SwitchOnText="1" SwitchOffText="0">
                </f:CheckBox>
                <f:CheckBox ID="CheckBox5" Label="开关文本（图标字体）" runat="server" DisplayType="Switch" SwitchTextVisible="true">
                </f:CheckBox>
                <f:CheckBox ID="CheckBox6" CssClass="mycheckbox" Label="开关文本（自定义）" Text="自定义开关" runat="server" DisplayType="Switch" SwitchTextVisible="true"
                    SwitchOnText="开启" SwitchOffText="关闭">
                </f:CheckBox>
            </Items>
        </f:SimpleForm>
    </form>
    <script>
        var cbxClientID = '<%= CheckBox1.ClientID %>';

        function onChangeCheckStatusClick(event) {
            var checkbox = F(cbxClientID);
            checkbox.setValue(!checkbox.getValue());
        }

        function onChangeEnabledClick(event) {
            var checkbox = F(cbxClientID);
            checkbox.setDisabled(!checkbox.isDisabled());
        }

    </script>
</body>
</html>
