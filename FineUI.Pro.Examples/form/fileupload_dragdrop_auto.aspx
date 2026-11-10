<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fileupload_dragdrop_auto.aspx.cs" Inherits="FineUI.Pro.Examples.form.fileupload_dragdrop_auto" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>选择图片后立即上传</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" runat="server" IsFluid="true" MaxWidth="620px" BodyPadding="10px"
            LabelAlign="Top" Title="选择图片后立即上传">
            <Items>
                <f:FileUpload ID="filePhotos" runat="server" Label="图片" ButtonText="选择图片" EnableDragDrop="true" Multiple="true"
                    AcceptFileTypes=".jpg,.jpeg,.png,.gif" OnFileSelected="filePhotos_FileSelected"></f:FileUpload>
            </Items>
        </f:SimpleForm>
        <f:Label ID="labResult" runat="server"></f:Label>
        <p>拖入或点击选择 JPG、JPEG、PNG、GIF 图片后会立即上传，每张图片最多 2 MB。服务器会回显收到的文件名，校验失败时保留本次选择。</p>
    </form>
</body>
</html>
