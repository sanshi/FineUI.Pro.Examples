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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对比客户端变化回调继续回发与返回 false 阻止回发的效果。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-send" aria-hidden="true"></i>决定是否继续后台处理</h3>
            <ul>
                <li>
                    切换第一个复选框。<br />
                    结果：先写入客户端结果，再由后台更新；最终结果以“【服务端】复选框1的状态”开头。
                </li>
                <li>
                    切换第二个复选框。<br />
                    结果：客户端回调返回 false，停留在“【客户端】复选框2的状态”结果，不执行后台事件。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>OnCheckedChanged</code>：后台变化事件；客户端对应回调返回 false 时不会请求。 本页声明值为 CheckBox1_CheckedChanged。</li>
            </ul>
        </section>
    </template>
</body>
</html>
