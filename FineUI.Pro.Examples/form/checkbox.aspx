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
</body>
</html>
