<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fileupload.aspx.cs" Inherits="FineUI.Pro.Examples.form.fileupload" %>

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
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="表单" ShowHeader="true">
            <Items>
                <f:TextBox runat="server" Label="用户名" ID="tbxUserName" EmptyText="请输入用户名" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:FileUpload runat="server" ID="filePhoto" EmptyText="请选择一张照片" Label="个人头像" Required="true" ButtonIcon="Add" ShowRedStar="true">
                </f:FileUpload>
                <f:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" ValidateForms="SimpleForm1" Text="提交">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <f:Label ID="labResult" CssClass="result" EncodeText="false" runat="server">
        </f:Label>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>填写<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>并上传<strong
                    class="example-control-reference" data-example-control="<%= filePhoto.ClientID %>" title="个人头像">个人头像</strong>，后台校验文件后显示图片结果。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-upload" aria-hidden="true"></i>校验并上传头像</h3>
            <ol>
                <li>
                    <strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>输入
                    <code>tom</code>，选择一张合格图片，再点击<strong class="example-control-reference" data-example-control="<%= btnSubmit.ClientID %>"
                        title="提交">提交</strong>。<br />
                    结果：后台校验并保存图片，下方显示<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>
                    <code>tom</code>、文件名和头像，成功后清空表单和文件选择。
                </li>
                <li>
                    重新填写<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>，选择不符合类型或大小限制的文件，再提交。<br />
                    结果：后台提示具体校验错误，清空无效文件选择，不把该文件保存为头像。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：由于浏览器安全限制，部分浏览器下只显示文件名（<code>1</code>.<code>png</code>）或者假路径（<code>C</code>:\<code>fakepath</code>\<code>1</code>.<code>png</code>）。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Required</code>（<strong class="example-control-reference" data-example-control="<%= filePhoto.ClientID %>"
                        title="个人头像">个人头像</strong>）：限制为空时能否通过表单验证。 本页<strong class="example-control-reference" data-example-control="<%= filePhoto.ClientID %>"
                        title="个人头像">个人头像</strong>声明值为 <code>true</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
