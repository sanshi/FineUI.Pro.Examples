<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fileupload_dragdrop.aspx.cs" Inherits="FineUI.Pro.Examples.form.fileupload_dragdrop" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>拖放上传图片</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" runat="server" IsFluid="true" MaxWidth="620px" BodyPadding="10px" LabelAlign="Top" Title="拖放上传图片">
            <Items>
                <f:FileUpload ID="filePhoto" runat="server" Label="单张图片" EnableDragDrop="true" AcceptFileTypes=".jpg,.jpeg,.png,.gif"></f:FileUpload>
                <f:FileUpload ID="filePhotos" runat="server" Label="多张图片" EnableDragDrop="true" Multiple="true" AcceptFileTypes=".jpg,.jpeg,.png,.gif">
                </f:FileUpload>
                <f:Button ID="btnSubmit" runat="server" Text="提交文件" OnClick="btnSubmit_Click"></f:Button>
            </Items>
        </f:SimpleForm>
        <f:Label ID="labPhotoResult" runat="server"></f:Label>
        <f:Label ID="labPhotosResult" runat="server"></f:Label>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示拖放选择单张或<strong class="example-control-reference" data-example-control="<%= filePhotos.ClientID %>" title="多张图片">多张图片</strong>，移除待选文件后统一提交。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-upload" aria-hidden="true"></i>拖入并移除文件</h3>
            <ol>
                <li>
                    将 <code>cover.png</code> 拖入<strong class="example-control-reference" data-example-control="<%= filePhoto.ClientID %>"
                        title="单张图片">单张图片</strong>，将 <code>first.jpg</code>、<code>second.png</code> 一起拖入<strong class="example-control-reference"
                        data-example-control="<%= filePhotos.ClientID %>" title="多张图片">多张图片</strong>。<br />
                    结果：两个区域分别显示当前待提交的文件；重复选择会替换该区域上一批文件。
                </li>
                <li>
                    在<strong class="example-control-reference" data-example-control="<%= filePhotos.ClientID %>" title="多张图片">多张图片</strong>列表中移除
                    <code>first.jpg</code>。<br />
                    结果：仅剩 <code>second.png</code> 等待提交。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnSubmit.ClientID %>" title="提交文件">提交文件</strong>。<br />
                    结果：后台分别显示收到的单张和多张文件名，并清空两个区域的选择；本页核验文件，不生成图片预览。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>拖入 <code>JPG</code>、<code>JPEG</code>、<code>PNG</code> 或 <code>GIF</code> 图片，也可以点击拖放区选择。每次选择会替换该区域中上一次选择的图片，提交前可逐项移除。</p>
            <p>点击「<strong class="example-control-reference" data-example-control="<%= btnSubmit.ClientID %>" title="提交文件">提交文件</strong>」后，服务器按字段分别校验并回显文件名。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableDragDrop</code>（<strong class="example-control-reference" data-example-control="<%= filePhoto.ClientID %>"
                        title="单张图片">单张图片</strong>）：可将本地文件拖入选择区域。 本页<strong class="example-control-reference" data-example-control="<%= filePhoto.ClientID %>"
                        title="单张图片">单张图片</strong>声明值为 <code>true</code>。</li>
                <li><code>Multiple</code>（<strong class="example-control-reference" data-example-control="<%= filePhotos.ClientID %>"
                        title="多张图片">多张图片</strong>）：是否允许一次选择多个文件。 本页<strong class="example-control-reference" data-example-control="<%= filePhotos.ClientID %>"
                        title="多张图片">多张图片</strong>声明值为 <code>true</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
