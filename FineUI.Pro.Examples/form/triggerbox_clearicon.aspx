<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="triggerbox_clearicon.aspx.cs" Inherits="FineUI.Pro.Examples.form.triggerbox_clearicon" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false"
            ShowBorder="true" Title="表单" ShowHeader="true" runat="server">
            <Items>
                <f:TriggerBox ID="tbxMyBox1" ShowLabel="false" runat="server" Text="默认值" TriggerIcon="Clear" AutoShowClearIcon="true">
                </f:TriggerBox>
                <f:Button ID="btnSubmit" Text="提交表单" OnClick="btnSubmit_Click" runat="server"></f:Button>
            </Items>
        </f:SimpleForm>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示输入框有值时自动显示清空图标，点击后清空内容并隐藏图标。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-close" aria-hidden="true"></i>清空再读取</h3>
            <ol>
                <li>
                    点击初始文字“默认值”右侧的清空图标。<br />
                    结果：浏览器立即清空输入，清空图标随之隐藏。
                </li>
                <li>
                    关闭提示后重新输入文字。<br />
                    结果：清空图标再次出现，可以继续清空。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AutoShowClearIcon</code>（<strong class="example-control-reference" data-example-control="<%= tbxMyBox1.ClientID %>" title="触发器输入框">触发器输入框</strong>）：开启随内容自动显示清空图标；清空动作在浏览器完成。</li>
            </ul>
        </section>
    </template>
</body>
</html>
