<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkbox_client_server_event.aspx.cs" Inherits="FineUI.Pro.Examples.form.checkbox_client_server_event" %>

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
                <f:CheckBox ID="CheckBox1" ShowLabel="false" runat="server" Text="复选框1（先执行客户端事件，再执行服务端事件）" OnCheckedChanged="CheckBox1_CheckedChanged"
                    Checked="true">
                    <Listeners>
                        <f:Listener Event="change" Handler="onCheckBox1Changed" />
                    </Listeners>
                </f:CheckBox>
                <f:CheckBox ID="CheckBox2" ShowLabel="false" runat="server" Text="复选框2（只执行客户端事件）" OnCheckedChanged="CheckBox2_CheckedChanged" Checked="true">
                    <Listeners>
                        <f:Listener Event="change" Handler="onCheckBox2Changed" />
                    </Listeners>
                </f:CheckBox>
                <f:Label ID="labResult" runat="server" ShowLabel="false">
                </f:Label>
            </Items>
        </f:SimpleForm>

    </form>
    <script>
        var labResultID = '<%= labResult.ClientID %>';

        function onCheckBox1Changed(event, checked) {
            F(labResultID).setValue("【客户端】复选框1的状态：" + (checked ? "选中" : "未选中"));
        }

        function onCheckBox2Changed(event, checked) {
            F(labResultID).setValue("【客户端】复选框2的状态：" + (checked ? "选中" : "未选中"));

            // 客户端事件（change）显式返回false，用于阻止服务端事件的执行（OnCheckedChanged）
            return false;
        }

    </script>
</body>
</html>
