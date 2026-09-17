<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="textbox.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.textbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false"
            Title="登录表单" ShowHeader="true" runat="server">
            <Items>
                <f:TextBox runat="server" Label="用户名" EmptyText="请输入用户名" ID="tbxUserName" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:TextBox runat="server" ID="tbxPassword" Label="密码" EmptyText="请输入密码" TextMode="Password" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:Button ID="btnSubmit" CssClass="marginr" runat="server" OnClick="btnSubmit_Click" ValidateForms="SimpleForm1"
                    Text="登录">
                </f:Button>
                <f:Button ID="btnReset" runat="server" Text="重置" ClickHandler="onResetClick">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" ShowLabel="false" runat="server">
        </f:Label>
    </form>
    <script>

        var SimpleForm1ClientID = '<%= SimpleForm1.ClientID %>';

        function onResetClick(event) {
            F(SimpleForm1ClientID).reset();
        }

    </script>
</body>
</html>
