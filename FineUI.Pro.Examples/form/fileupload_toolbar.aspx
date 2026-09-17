<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fileupload_toolbar.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.fileupload_toolbar" %>

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
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false" ShowBorder="true" Title="表单" runat="server">
            <Items>
                <f:Image ID="imgPhoto" CssClass="photo" ImageUrl="~/res/images/blank.png" ShowEmptyLabel="true" runat="server">
                </f:Image>
                <f:TextBox runat="server" Label="用户名" ID="tbxUserName" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:TextBox runat="server" Label="邮箱" ID="tbxEmail" Required="true" RegexPattern="EMAIL" RegexMessage="请输入有效的邮箱地址" ShowRedStar="true">
                </f:TextBox>
            </Items>
            <Toolbars>
                <f:Toolbar Position="Bottom" runat="server">
                    <Items>
                        <f:Button runat="server" Text="测试按钮"></f:Button>
                        <f:ToolbarFill runat="server"></f:ToolbarFill>
                        <f:FileUpload runat="server" ID="filePhoto" ButtonText="上传个人头像" AcceptFileTypes="image/*" ButtonOnly="true"
                            OnFileSelected="filePhoto_FileSelected" ButtonIconFont="_Upload">
                        </f:FileUpload>
                        <f:Button runat="server" IconFont="_Save" ID="btnSubmit" OnClick="btnSubmit_Click" ValidateForms="SimpleForm1" Text="提交表单">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        注：
        <ul>
            <li>上传个人头像通过 AcceptFileTypes="image/*" 来控制默认显示的文件类型
            </li>
            <li>
                <a href="http://stackoverflow.com/questions/181214/file-input-accept-attribute-is-it-useful" target="_blank">AcceptFileTypes 的有效值</a>
            </li>
            <li>IE9以及更早的版本不支持 input 标签的 accept 属性
            </li>
            <li>尽量避免使用此属性，应该在服务器端验证上传文件的类型
            </li>
        </ul>
    </form>
</body>
</html>
