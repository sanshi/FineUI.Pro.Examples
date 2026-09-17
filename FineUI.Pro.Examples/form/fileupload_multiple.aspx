<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fileupload_multiple.aspx.cs" Inherits="FineUI.Pro.Examples.form.fileupload_multiple" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .result img {
            border: 1px solid #CCCCCC;
            max-width: 550px;
            padding: 3px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="表单" ShowHeader="true">
            <Items>
                <f:TextBox runat="server" Label="用户名" ID="tbxUserName" EmptyText="请输入用户名" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:FileUpload runat="server" ID="filePhotos" EmptyText="请选择多张照片" Label="个人照片" Required="true" ButtonIcon="Add"
                    ShowRedStar="true" Multiple="true">
                </f:FileUpload>
                <f:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" ValidateForms="SimpleForm1"
                    Text="提交">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <f:Label ID="labResult" CssClass="result" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：本示例支持的浏览器版本为：Edge、Chrome、Firefox、Safari、IE10+。
    </form>
</body>
</html>
