<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_validate_alert.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.form_validate_alert" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" BodyPadding="10px" EnableCollapse="false"
            Title="用户注册表单">
            <Items>
                <f:TextBox ID="tbxUserName" runat="server" Label="用户名" Required="true" NextFocusControl="tbxPassword"
                    ShowRedStar="true" Text="admin">
                </f:TextBox>
                <f:TextBox ID="tbxPassword" runat="server" Label="密码" Required="true" ShowRedStar="true" NextFocusControl="btnRegister"
                    TextMode="Password">
                </f:TextBox>
                <f:Button ID="btnRegister" runat="server" Text="注册" OnClick="btnRegister_Click"
                    ValidateForms="SimpleForm1" ValidateTarget="Top">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <br />
        注：
        <ul>
            <li>提交表单时验证[用户名]不能为 admin，否则标记为无效
            </li>
            <li>无效时先弹出确认对话框，点击确认按钮后，[用户名]会获得输入焦点
            </li>
        </ul>
    </form>
</body>
</html>
