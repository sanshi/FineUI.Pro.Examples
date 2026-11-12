<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="triggerbox_triggerboxurl.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.triggerbox_triggerboxurl" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false"
            Title="表单" ShowHeader="true" runat="server" LabelWidth="150px">
            <Items>
                <f:TriggerBox ID="tbxMyBox1" Label="TriggerBox" TriggerIconUrl="~/res/icon/application_edit.png"
                    OnTriggerClick="tbxMyBox1_TriggerClick" EmptyText="打开弹出窗口" runat="server">
                </f:TriggerBox>
                <f:TwinTriggerBox ID="ttbxMyBox2" Label="TwinTriggerBox" OnTrigger1Click="ttbxMyBox2_Trigger1Click" OnTrigger2Click="ttbxMyBox2_Trigger2Click"
                    ShowTrigger1="false" EmptyText="搜索用户名" Trigger1IconUrl="~/res/icon/bullet_cross.png" Trigger2IconUrl="~/res/icon/zoom.png"
                    runat="server">
                </f:TwinTriggerBox>
            </Items>
        </f:SimpleForm>

        <f:Window ID="Window1" Title="弹出窗口" BodyPadding="10px" IsModal="true" Hidden="true"
            Target="Top" Width="450px" Height="300px"
            runat="server">
            <Items>
                <f:Button ID="btnCloseWindow" Text="关闭当前窗口" OnClick="btnCloseWindow_Click" runat="server">
                </f:Button>
            </Items>
        </f:Window>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示给单触发器和双触发器指定自定义图片图标。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照自定义图标</h3>
            <ol>
                <li>
                    对照单触发器图片；在第二个输入框输入关键词并点击搜索，查看显示的取消图标。<br />
                    结果：单触发器、搜索和取消使用本页指定的图片，原有触发动作继续可用。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>TriggerIconUrl</code>：单触发器使用 application_edit.png。</li>
                <li><code>Trigger1IconUrl</code>：第一个图标使用 bullet_cross.png。</li>
                <li><code>Trigger2IconUrl</code>：第二个图标使用 zoom.png。</li>
            </ul>
        </section>
    </template>
</body>
</html>
