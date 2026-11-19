<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_validate_blur.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.form_validate_blur" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" BodyPadding="10px" EnableCollapse="false" Title="用户注册表单">
            <Items>
                <f:TextBox ID="tbxUserName" runat="server" Label="用户名" Required="true" NextFocusControl="tbxPassword" EnableBlurEvent="true"
                    OnBlur="tbxUserName_Blur" ShowRedStar="true" Text="admin">
                </f:TextBox>
                <f:TextBox ID="tbxPassword" runat="server" Label="密码" Required="true" ShowRedStar="true" NextClickControl="btnRegister" TextMode="Password">
                </f:TextBox>
                <f:Button ID="btnRegister" runat="server" Text="注册" OnClick="btnRegister_Click" ValidateForms="SimpleForm1" ValidateTarget="Top">
                </f:Button>
            </Items>
        </f:SimpleForm>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示离开<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                    title="用户名">用户名</strong>输入框时立即进行后台校验，并在修正错误后聚焦密码框。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>离开字段时校验，再提交</h3>
            <ol>
                <li>
                    先点击<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>输入框，保持为<code>admin</code>，再点击密码框。<br />
                    结果：<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>失去焦点后回发，后台将<strong
                        class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>标为无效，提示 <code>admin</code>
                    是保留字。
                </li>
                <li>
                    回到<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>框，改为<code>demo</code>，再点击页面空白处。<br />
                    结果：再次回发校验，后台清除<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>错误，并将焦点移到密码框。
                </li>
                <li>
                    密码输入<code>123456</code>，点击<strong class="example-control-reference" data-example-control="<%= btnRegister.ClientID %>"
                        title="注册">注册</strong>或在密码框按 <code>Enter</code>。<br />
                    结果：先检查必填项，回发后再次校验<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>，通过后提示“表单提交成功！”；本例没有实际创建账号。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：</p>
            <ul>
                <li>[<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>]失去焦点，如果为
                    <code>admin</code>，则标记为无效；否则去除无效标记
                </li>
                <li>[<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>]按下 <code>Enter</code>
                    键，如果为 <code>admin</code>，则标记为无效；否则去除无效标记，并跳转到[密码] </li>
                <li>[密码]按下 <code>Enter</code> 键，提交表单 </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>OnBlur</code>（<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>）：绑定 <code>tbxUserName</code><code>_Blur</code>，在<strong class="example-control-reference"
                        data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>失去焦点时回发校验。</li>
                <li><code>MarkInvalid()</code>（<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>）：将 <code>admin</code> 的保留字错误标记到<strong class="example-control-reference"
                        data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>框。</li>
                <li><code>ClearInvalid()</code>（<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>）：<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>有效时清除之前的错误。</li>
                <li><code>GetFocusReference()</code>（<strong class="example-control-reference" data-example-control="<%= tbxPassword.ClientID %>"
                        title="密码">密码</strong>）：后台校验通过后，让浏览器聚焦密码框。</li>
            </ul>
        </section>
    </template>
</body>
</html>
