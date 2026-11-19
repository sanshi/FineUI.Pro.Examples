<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tablestyle_fileupload.aspx.cs" Inherits="FineUI.Pro.Examples.form.tablestyle_fileupload" %>

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
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="表单" ShowHeader="true"
            MessageTarget="Qtip">
            <Items>
                <f:SimpleForm ID="SimpleFormExample2" runat="server" ShowBorder="false" ShowHeader="false" EnableTableStyle="true">
                    <Items>
                        <f:TextBox runat="server" Label="用户名" ID="tbxUserName" EmptyText="请输入用户名" Required="true" ShowRedStar="true">
                        </f:TextBox>
                        <f:FileUpload runat="server" ID="filePhoto" EmptyText="请选择一张照片" Label="个人头像" Required="true" ShowRedStar="true">
                        </f:FileUpload>
                    </Items>
                </f:SimpleForm>
            </Items>
        </f:SimpleForm>
        <f:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" ValidateForms="SimpleForm1" Text="提交" MarginTop="5px">
        </f:Button>
        <br />
        <f:Label ID="labResult" CssClass="result" EncodeText="false" runat="server">
        </f:Label>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示表格风格中标签、输入区域和单元格边线的对齐。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照表格风格的字段排列</h3>
            <ol>
                <li>
                    对照本页各组字段的标签区域、输入区域与单元格边线。<br />
                    结果：不同字段放在各自单元格中，标签与输入区按表格布局对齐；操作按钮保留在原来的位置。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：由于浏览器安全限制，部分浏览器下只显示文件名（<code>1</code>.<code>png</code>）或者假路径（<code>C</code>:\<code>fakepath</code>\<code>1</code>.<code>png</code>）。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableTableStyle</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("SimpleFormExample2").ClientID %>' title="第 2 个表单">第 2
                        个表单</strong>）：使输入和上传字段显示在表格风格的单元格中。</li>
            </ul>
        </section>
    </template>
</body>
</html>
