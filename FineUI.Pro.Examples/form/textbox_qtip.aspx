<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="textbox_qtip.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.textbox_qtip" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false"
            Title="登录表单" ShowHeader="true" LabelAlign="Right" runat="server">
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
        <br />
        <br />
        <ul>
            <li>【用户名】的提示信息，在鼠标移动到标签和输入框时都会显示</li>
            <li>【密码】的提示信息，仅在鼠标移动到标签时才会显示</li>
        </ul>
    </form>
    <script>
        var SimpleForm1ClientID = '<%= SimpleForm1.ClientID %>';

        function onResetClick(event) {
            F(SimpleForm1ClientID).reset();
        }


        var tbxPasswordClientID = '<%= tbxPassword.ClientID %>';

        F.ready(function () {

            F(tbxPasswordClientID).el.find('.f-field-fieldlabel').attr({
                'data-qtitle': '密码',
                'data-qtip': '通过 JavaScript 设置的提示信息，鼠标移动到标签时才会提示'
            });

        });

    </script>
</body>
</html>
