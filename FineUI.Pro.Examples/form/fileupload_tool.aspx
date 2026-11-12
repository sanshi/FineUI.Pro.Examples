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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示由工具图标触发隐藏的文件选择框。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-upload" aria-hidden="true"></i>先上传头像</h3>
            <ol>
                <li>
                    点击表单标题栏的“上传头像”工具图标，选择一张合格图片。<br />
                    结果：文件选中事件立即回发；后台校验并保存图片，头像区域由空白图变为新头像，同时清空文件选择。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Hidden</code>（<strong class="example-control-reference" data-example-control="<%= filePhoto.ClientID %>" title="上传控件">上传控件</strong>）：隐藏上传字段，由工具图标触发系统选择对话框。 本页声明值为 <code>true</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
