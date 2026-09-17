<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tablestyle_simpleform.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.tablestyle_simpleform" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server"
            ShowHeader="false" ShowBorder="false" EnableTableStyle="true" MessageTarget="Qtip">
            <Items>
                <f:TextBox ID="tbxUserName" runat="server" Label="用户名" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:TextBox ID="tbxPassword" runat="server" Label="密码" Required="true" ShowRedStar="true" TextMode="Password">
                </f:TextBox>
            </Items>
        </f:SimpleForm>
        <f:Button ID="btnRegister" runat="server" Text="注册" OnClick="btnRegister_Click"
            ValidateForms="SimpleForm1" ValidateTarget="Top" MarginTop="5px">
        </f:Button>
        <br />
        <br />
        注：<strong>启用EnableTableStyle时，必须去除BodyPadding属性</strong>，并建议设置MessageTarget=Qtip。
    </form>
</body>
</html>
