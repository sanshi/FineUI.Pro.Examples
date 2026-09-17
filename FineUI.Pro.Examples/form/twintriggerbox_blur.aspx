<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="twintriggerbox_blur.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.twintriggerbox_blur" %>

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
                    OnTrigger1Click="TwinTriggerBox1_Trigger1Click" OnTrigger2Click="TwinTriggerBox1_Trigger2Click" runat="server">
                    <Listeners>
                        <f:Listener Event="blur" Handler="onTwinTriggerBox1Blur" />
                    </Listeners>
                </f:TwinTriggerBox>
            </Items>
        </f:SimpleForm>
        <br />
        <br />
        注：文本输入框失去焦点时，触发后台搜索事件。
    </form>

    <script>

        // 记录上一次 TwinTriggerBox1 的值
        var __lastTriggerBoxValue;

        function onTwinTriggerBox1Blur(event) {
            var value = this.getValue();
            // 值改变时才回发
            if (value !== __lastTriggerBoxValue) {
                __lastTriggerBoxValue = value;

                F.customEvent('TwinTriggerBox1Blur');
            }
        }

        function updateLastTriggerBoxValue(text) {
            __lastTriggerBoxValue = text;
        }

        // 设置 __lastTriggerBoxValue 初始值
        var TwinTriggerBox1ClientID = '<%= TwinTriggerBox1.ClientID %>';
        F.ready(function () {
            __lastTriggerBoxValue = F(TwinTriggerBox1ClientID).getValue();
        });

    </script>
</body>
</html>
