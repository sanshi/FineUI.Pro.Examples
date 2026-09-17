<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="textbox_autocomplete.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.textbox_autocomplete" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false"
            Title="登录表单" ShowHeader="true">
            <Items>
                <f:TextBox runat="server" Label="用户名" EmptyText="请输入用户名" ID="tbxUserName" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:TextBox ID="tbxEmail" Required="true" ShowRedStar="true" Label="电子邮箱" RegexPattern="EMAIL"
                    RegexMessage="请输入有效的邮箱地址" runat="server">
                </f:TextBox>
                <f:Button ID="btnSubmit" CssClass="marginr" runat="server" OnClick="btnSubmit_Click" ValidateForms="SimpleForm1" EnableAjax="true"
                    Text="提交表格">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" ShowLabel="false" runat="server">
        </f:Label>
        注：这个功能不支持，HTMl的autocomplete只有在正常的表单提交时才记忆（非AJAX），在AJAX场景中不起作用。
    </form>

    <script>

        var tbxUserNameClientID = '<%= tbxUserName.ClientID %>';

        F.ready(function () {

            // 开启 用户名 的自动完成功能
            F(tbxUserNameClientID).el.find('input').attr('autocomplete', 'on');

        });

    </script>
</body>
</html>
