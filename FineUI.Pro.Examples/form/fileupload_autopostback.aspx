<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fileupload_autopostback.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.fileupload_autopostback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .photo {
            height: 150px;
            line-height: 150px;
            overflow: hidden;
        }

        .photo img {
            height: 150px;
            vertical-align: middle;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false" ShowBorder="true" Title="表单" ShowHeader="true" runat="server">
            <Items>
                <f:Image ID="imgPhoto" CssClass="photo" ImageUrl="~/res/images/blank.png" ShowEmptyLabel="true" runat="server">
                </f:Image>
                <f:FileUpload runat="server" ID="filePhoto" ShowRedStar="false" ShowEmptyLabel="true" ButtonText="上传个人头像" ButtonOnly="true" Required="false"
                    ButtonIcon="ImageAdd" OnFileSelected="filePhoto_FileSelected">
                </f:FileUpload>
                <f:TextBox runat="server" Label="用户名" ID="tbxUserName" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:TextBox runat="server" Label="邮箱" ID="tbxEmail" Required="true" RegexPattern="EMAIL" RegexMessage="请输入有效的邮箱地址" ShowRedStar="true">
                </f:TextBox>
                <f:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" ValidateForms="SimpleForm1" Text="提交表单">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
</body>
</html>
