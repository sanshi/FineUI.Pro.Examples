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
                <f:Toolbar ID="ToolbarExample1" Position="Bottom" runat="server">
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


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示将文件选择按钮放进<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ToolbarExample1").ClientID %>'
                    title="工具栏">工具栏</strong>，选定后直接更新头像预览。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-upload" aria-hidden="true"></i>先上传头像</h3>
            <ol>
                <li>
                    点击<strong>上传个人头像</strong>，选择一张合格图片。<br />
                    结果：文件选中事件立即回发；后台校验并保存图片，头像区域由空白图变为新头像，同时清空文件选择。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：</p>
            <ul>
                <li>上传个人头像通过 <code>AcceptFileTypes</code>="<code>image</code>/*" 来控制默认显示的文件类型 </li>
                <li> <a href="http://stackoverflow.com/questions/181214/file-input-accept-attribute-is-it-useful" target="_blank">AcceptFileTypes 的有效值</a> </li>
                <li><code>IE9</code>以及更早的版本不支持 <code>input</code> 标签的 <code>accept</code> 属性 </li>
                <li>尽量避免使用此属性，应该在服务器端验证上传文件的类型 </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ButtonOnly</code>（<strong class="example-control-reference" data-example-control="<%= filePhoto.ClientID %>"
                        title="上传控件">上传控件</strong>）：只显示上传按钮，不显示文件路径输入框。 本页声明值为 <code>true</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
