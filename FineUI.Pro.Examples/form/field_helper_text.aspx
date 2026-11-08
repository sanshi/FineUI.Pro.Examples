<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="field_helper_text.aspx.cs" Inherits="FineUI.Pro.Examples.form.field_helper_text" %>
<!DOCTYPE html>
<html>
<head runat="server"><title>字段帮助与下方错误提示</title></head>
<body>
<form runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
<f:SimpleForm runat="server" ID="Form1" IsFluid="true" BodyPadding="10" Title="联系信息" MessageTarget="Under">
    <Items>
        <f:TextBox runat="server" ID="tbxEmail" Label="联系邮箱" Required="true" HelperText="用于接收审批结果，请填写常用邮箱。" />
        <f:TextArea runat="server" ID="txaNotes" Label="申请说明" AutoGrowHeight="true" HelperText="请说明申请用途，内容较多时文本框自动增高。" />
        <f:FileUpload runat="server" ID="fuAttachment" Label="附件" Multiple="true" HelperText="可选择多份附件。" />
        <f:Button runat="server" ID="btnValidate" CssClass="marginr" Text="验证表单" ClickHandler="onValidateFields" />
        <f:Button runat="server" ID="btnClear" CssClass="marginr" Text="清除错误" ClickHandler="onClearErrors" />
        <f:Button runat="server" ID="btnUpdate" CssClass="marginr" Text="修改填写说明" OnClick="btnUpdate_Click" />
        <f:Button runat="server" ID="btnClearHelper" CssClass="marginr" Text="清空填写说明" OnClick="btnClearHelper_Click" />
        <f:Button runat="server" ID="btnRead" Text="读取填写说明" OnClick="btnRead_Click" />
    </Items>
</f:SimpleForm>
<br />
<f:Label runat="server" ID="labResult" ShowLabel="false" />
<p>填写说明始终显示，校验失败时错误显示在其下方。更新或清空说明会重新布局，并保留当前输入和文件选择。</p>
</form>
<script>
function onValidateFields(event) {
    F('<%= Form1.ClientID %>').isValid();
}

function onClearErrors(event) {
    F('<%= tbxEmail.ClientID %>').clearInvalid();
}

function getHelperText() {
    return F('<%= tbxEmail.ClientID %>').getHelperText();
}
</script>
</body>
</html>
