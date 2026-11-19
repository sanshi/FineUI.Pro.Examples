<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tablestyle_simpleform.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.tablestyle_simpleform" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" ShowHeader="false" ShowBorder="false" EnableTableStyle="true" MessageTarget="Qtip">
            <Items>
                <f:TextBox ID="tbxUserName" runat="server" Label="用户名" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:TextBox ID="tbxPassword" runat="server" Label="密码" Required="true" ShowRedStar="true" TextMode="Password">
                </f:TextBox>
            </Items>
        </f:SimpleForm>
        <f:Button ID="btnRegister" runat="server" Text="注册" OnClick="btnRegister_Click" ValidateForms="SimpleForm1" ValidateTarget="Top" MarginTop="5px">
        </f:Button>


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
            <p>注：<strong>启用EnableTableStyle时，必须去除BodyPadding属性</strong>，并建议设置<code>MessageTarget</code>=<code>Qtip</code>。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableTableStyle</code>（<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>"
                        title="表单">表单</strong>）：启用表格风格；表单去掉正文内边距，避免单元格与外框错开。</li>
                <li><code>MessageTarget</code>（<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>"
                        title="表单">表单</strong>）：使用 <code>Qtip</code> 提示错误，避免错误文字挤占表格布局。</li>
            </ul>
        </section>
    </template>
</body>
</html>
