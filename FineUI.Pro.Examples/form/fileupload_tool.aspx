<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fileupload_tool.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.fileupload_tool" %>

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
                <f:TextBox runat="server" Label="用户名" ID="tbxUserName" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:TextBox runat="server" Label="邮箱" ID="tbxEmail" Required="true" RegexPattern="EMAIL" RegexMessage="请输入有效的邮箱地址" ShowRedStar="true">
                </f:TextBox>
                <f:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" ValidateForms="SimpleForm1" Text="提交表单">
                </f:Button>
            </Items>
            <Tools>
                <f:Tool runat="server" IconFont="_Upload" Text="上传头像" ClickHandler="onUploadClick"></f:Tool>
            </Tools>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <f:FileUpload runat="server" ID="filePhoto" OnFileSelected="filePhoto_FileSelected" Hidden="true">
        </f:FileUpload>
    </form>
    <script>
        var filePhotoClientID = '<%= filePhoto.ClientID %>';

        function onUploadClick(event) {
            F(filePhotoClientID).el.find('.f-field-fileupload-fileinput').click();
        }

    </script>
</body>
</html>
