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
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="表单" ShowHeader="true">
            <Items>
                <f:TextBox runat="server" Label="用户名" ID="tbxUserName" EmptyText="请输入用户名" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:FileUpload runat="server" ID="filePhotos" EmptyText="请选择多张照片" Label="个人照片" Required="true" ButtonIcon="Add" ShowRedStar="true"
                    Multiple="true">
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
            <p>演示一次选择多张照片，提交后逐个校验并保存合格文件，显示图片预览和跳过原因。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-upload" aria-hidden="true"></i>多选并上传照片</h3>
            <ol>
                <li>
                    填写<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>，点击<strong class="example-control-reference" data-example-control="<%= filePhotos.ClientID %>" title="个人照片">个人照片</strong>的文件选择按钮，在系统对话框中选中多张图片。<br />
                    结果：文件框保存这一批选择；<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>和照片均为必填。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnSubmit.ClientID %>" title="提交">提交</strong>。<br />
                    结果：浏览器检查必填项，通过后后台遍历上传文件集合，逐个检查扩展名和大小；合格文件保存后在下方显示文件名和图片预览。
                </li>
                <li>
                    查看提交后的表单。<br />
                    结果：<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>和文件选择被清空，避免再次提交同一批照片；已显示的图片结果保留。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>处理不合格文件</h3>
            <ul>
                <li>
                    重新填写<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>，在一批文件中同时选择合格图片和不符合类型或大小限制的文件，再点击<strong class="example-control-reference" data-example-control="<%= btnSubmit.ClientID %>" title="提交">提交</strong>。<br />
                    结果：合格文件仍会处理；不合格文件被跳过，提示列出跳过数量、文件名及原因。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：本示例支持的浏览器版本为：<code>Edge</code>、<code>Chrome</code>、<code>Firefox</code>、<code>Safari</code>、<code>IE10</code>+。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Multiple</code>（<strong class="example-control-reference" data-example-control="<%= filePhotos.ClientID %>" title="个人照片">个人照片</strong>）：初始为 <code>true</code>，允许在系统文件对话框中一次选择多个文件。</li>
                <li><code>PostedFiles</code>（<strong class="example-control-reference" data-example-control="<%= filePhotos.ClientID %>" title="个人照片">个人照片</strong>）：后台取得本次提交的全部文件，逐个检查并保存；保存目录位于可直接访问的静态资源目录之外。</li>
            </ul>
        </section>
    </template>
</body>
</html>
