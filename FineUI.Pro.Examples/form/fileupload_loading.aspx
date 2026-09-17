<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fileupload_loading.aspx.cs" Inherits="FineUI.Pro.Examples.form.fileupload_loading" %>

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
                <f:FileUpload runat="server" ID="filePhoto" EmptyText="请选择一张照片" Label="个人头像" Required="true" ButtonIcon="Add"
                    ShowRedStar="true">
                </f:FileUpload>
                <f:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" ValidateForms="SimpleForm1"
                    Text="提交" AjaxLoadingType="Mask" ShowAjaxLoadingMaskText="true" AjaxLoadingMaskText="正在导入数据，请稍后...">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <f:Label ID="labResult" CssClass="result" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：为了观察Ajax提示信息，提交按钮动作在后台都会睡眠 1 秒钟。
    </form>
</body>
</html>
