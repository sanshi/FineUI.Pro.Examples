<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="textbox_autopostback.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.textbox_autopostback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" EnableImplicitChangeEvents="true" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" LabelAlign="Top" EnableCollapse="false" Title="简单表单" ShowHeader="true">
            <Items>
                <f:TextBox runat="server" ID="TextBox1" Label="文本框一（自动回发）" EmptyText="输入字符会立即触发TextChanged事件" AutoPostBack="true"
                    OnTextChanged="TextBox1_TextChanged">
                </f:TextBox>
                <f:TextBox ID="TextBox2" runat="server" Label="文本框二" OnTextChanged="TextBox2_TextChanged" EmptyText="输入字符后点击提交按钮，会触发TextChanged事件">
                </f:TextBox>
                <f:TextBox runat="server" ID="TextBox3" Label="文本框三（失去焦点事件）" EmptyText="输入字符后失去焦点，会触发Blur事件" EnableBlurEvent="true" OnBlur="TextBox3_Blur">
                </f:TextBox>
                <f:Button runat="server" Text="提交" EnablePostBack="true">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult1" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <f:Label ID="labResult2" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <f:Label ID="labResult3" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：本页通过 PageManager.EnableImplicitChangeEvents=true 专门保留 WebForms 的历史兼容行为：TextChanged 由回发数据变化驱动，即使本次回发由其他控件发起也可能触发。提交按钮没有服务端事件，显式 EnablePostBack=true
        只用于发起这次教学回发。请仔细考虑如下逻辑：
        <ul>
            <li>在[文本框二]输入任意文本，比如：你好</li>
            <li>点击[提交]按钮</li>
            <li>下面会显示文本[文本框二：你好]（后台触发了[文本框二]的TextChanged事件）</li>
        </ul>
    </form>
</body>
</html>
