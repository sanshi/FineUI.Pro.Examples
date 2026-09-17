<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tablestyle_fileupload.aspx.cs" Inherits="FineUI.Pro.Examples.form.tablestyle_fileupload" %>

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
            ShowBorder="true" Title="表单" ShowHeader="true" MessageTarget="Qtip">
            <Items>
                <f:SimpleForm runat="server" ShowBorder="false" ShowHeader="false" EnableTableStyle="true">
                    <Items>
                        <f:TextBox runat="server" Label="用户名" ID="tbxUserName" EmptyText="请输入用户名" Required="true" ShowRedStar="true">
                        </f:TextBox>
                        <f:FileUpload runat="server" ID="filePhoto" EmptyText="请选择一张照片" Label="个人头像" Required="true"
                            ShowRedStar="true">
                        </f:FileUpload>
                    </Items>
                </f:SimpleForm>
            </Items>
        </f:SimpleForm>
        <f:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" ValidateForms="SimpleForm1"
            Text="提交" MarginTop="5px">
        </f:Button>
        <br />
        <f:Label ID="labResult" CssClass="result" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：由于浏览器安全限制，部分浏览器下只显示文件名（1.png）或者假路径（C:\fakepath\1.png）。
    </form>
</body>
</html>
