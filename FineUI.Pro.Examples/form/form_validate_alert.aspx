<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_validate_alert.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.form_validate_alert" %>

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
                <f:TextBox ID="tbxUserName" runat="server" Label="用户名" Required="true" NextFocusControl="tbxPassword" ShowRedStar="true" Text="admin">
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
            <p>演示后台拒绝保留<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                    title="用户名">用户名</strong>时同时标记字段、弹出错误提示，并在关闭提示后重新聚焦。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>错误提示与焦点回到字段</h3>
            <ol>
                <li>
                    <strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>保持为
                    <code>admin</code>，密码输入 <code>123456</code>，点击<strong class="example-control-reference" data-example-control="<%= btnRegister.ClientID %>"
                        title="注册">注册</strong>。<br />
                    结果：后台把<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>标记无效，并弹出“<code>admin</code> 是保留字，请另外选择！”。
                </li>
                <li>
                    关闭错误提示。<br />
                    结果：延迟后焦点回到<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>输入框，便于直接修改。
                </li>
                <li>
                    <strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>改为
                    <code>bob</code>，再次注册。<br />
                    结果：不再触发保留字错误；本页没有实现真正注册和成功提示。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：</p>
            <ul>
                <li>提交表单时验证[<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>]不能为
                    <code>admin</code>，否则标记为无效
                </li>
                <li>无效时先弹出确认对话框，点击确认按钮后，[<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>]会获得输入焦点 </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>MarkInvalid()</code>（<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>）：后台给<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>标记保留字错误。</li>
                <li><code>Alert.Show()</code>（<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>）：弹出业务错误，并在关闭回调中安排<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>获取焦点。</li>
                <li><code>GetFocusReference()</code>（<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>）：本页延迟 <code>200</code> 毫秒聚焦，避免关闭提示的按键影响输入。</li>
            </ul>
        </section>
    </template>
</body>
</html>
