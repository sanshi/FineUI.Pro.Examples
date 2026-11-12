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


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示上传请求期间使用自定义遮罩文字，结束后自动收起。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>观察请求期间的上传提示</h3>
            <ol>
                <li>
                    填写<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>并选择合格图片，点击提交按钮。<br />
                    结果：请求处理期间显示本页设置的上传提示，处理完成后收起；后台特意等待一秒，便于观察。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：为了观察<code>Ajax</code>提示信息，提交按钮动作在后台都会睡眠 <code>1</code> 秒钟。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AjaxLoadingType</code>（<strong class="example-control-reference" data-example-control="<%= btnSubmit.ClientID %>" title="提交">提交</strong>）：控制等待请求时使用遮罩。 本页声明值为 <code>Mask</code>。</li>
                <li><code>ShowAjaxLoadingMaskText</code>（<strong class="example-control-reference" data-example-control="<%= btnSubmit.ClientID %>" title="提交">提交</strong>）：在遮罩中显示提示文字。 本页声明值为 <code>true</code>。</li>
                <li><code>AjaxLoadingMaskText</code>（<strong class="example-control-reference" data-example-control="<%= btnSubmit.ClientID %>" title="提交">提交</strong>）：请求等待期间显示的文字。 本页声明值为 正在导入数据，请稍后...。</li>
            </ul>
        </section>
    </template>
</body>
</html>
