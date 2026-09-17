<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="twintriggerbox_clearicon.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.twintriggerbox_clearicon" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10" EnableCollapse="false" Title="表单" ShowHeader="true" runat="server">
            <Items>
                <f:TwinTriggerBox ID="TwinTriggerBox1" ShowLabel="false" Trigger1Icon="Clear" ShowTrigger1="false" EmptyText="搜索用户名" Trigger2Icon="Search"
                    OnTrigger1Click="TwinTriggerBox1_Trigger1Click" OnTrigger2Click="TwinTriggerBox1_Trigger2Click" AutoShowClearIcon="true" runat="server">
                    <Listeners>
                        <f:Listener Event="change" Handler="onTwinTriggerBox1Change"></f:Listener>
                    </Listeners>
                </f:TwinTriggerBox>
            </Items>
        </f:SimpleForm>
    </form>
    <script>
        var TwinTriggerBox1ClientID = '<%= TwinTriggerBox1.ClientID %>';

        // 记录上一次 TwinTriggerBox1 的值
        var __lastTriggerBoxValue;
        var __changeTimer;

        function onTwinTriggerBox1Change(event) {
            if (__changeTimer) {
                window.clearTimeout(__changeTimer);
                __changeTimer = undefined;
            }
            __changeTimer = window.setTimeout(postBackTriggerBoxChange, 1000);
        }

        function postBackTriggerBoxChange() {
            var value = F(TwinTriggerBox1ClientID).getValue();
            // 值改变时才回发
            if (value !== __lastTriggerBoxValue) {
                __lastTriggerBoxValue = value;

                // 触发后台事件
                F.customEvent('TwinTriggerBox1Change');
            }
        }

        function updateLastTriggerBoxValue(text) {
            __lastTriggerBoxValue = text;
        }

        // 设置 __lastTriggerBoxValue 初始值
        F.ready(function () {
            // 设置 TwinTriggerBox1 初始值
            __lastTriggerBoxValue = F(TwinTriggerBox1ClientID).getValue();
        });

    </script>
</body>
</html>
