<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fileupload_dragdrop.aspx.cs" Inherits="FineUI.Pro.Examples.form.fileupload_dragdrop" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>拖放上传图片</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" runat="server" IsFluid="true" MaxWidth="620px" BodyPadding="10px"
            LabelAlign="Top" Title="拖放上传图片">
            <Items>
                <f:FileUpload ID="filePhoto" runat="server" Label="单张图片"
                    EnableDragDrop="true" AcceptFileTypes=".jpg,.jpeg,.png,.gif"></f:FileUpload>
                <f:FileUpload ID="filePhotos" runat="server" Label="多张图片"
                    EnableDragDrop="true" Multiple="true" AcceptFileTypes=".jpg,.jpeg,.png,.gif"></f:FileUpload>
                <f:Button ID="btnSubmit" runat="server" Text="提交文件" OnClick="btnSubmit_Click"></f:Button>
            </Items>
        </f:SimpleForm>
        <f:Label ID="labPhotoResult" runat="server"></f:Label>
        <f:Label ID="labPhotosResult" runat="server"></f:Label>
        <p>拖入 JPG、JPEG、PNG 或 GIF 图片，也可以点击拖放区选择。每次选择会替换该区域中上一次选择的图片，提交前可逐项移除。</p>
        <p>点击「提交文件」后，服务器按字段分别校验并回显文件名。</p>
    </form>
</body>
</html>
