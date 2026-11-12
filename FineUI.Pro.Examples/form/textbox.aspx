<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="textbox.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.textbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false" Title="登录表单" ShowHeader="true" runat="server">
            <Items>
                <f:TextBox runat="server" Label="用户名" EmptyText="请输入用户名" ID="tbxUserName" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:TextBox runat="server" ID="tbxPassword" Label="密码" EmptyText="请输入密码" TextMode="Password" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:Button ID="btnSubmit" CssClass="marginr" runat="server" OnClick="btnSubmit_Click" ValidateForms="SimpleForm1" Text="登录">
                </f:Button>
                <f:Button ID="btnReset" runat="server" Text="重置" ClickHandler="onResetClick">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" ShowLabel="false" runat="server">
        </f:Label>
    </form>
    <script>
        var SimpleForm1ClientID = '<%= SimpleForm1.ClientID %>';

        function onResetClick(event) {
            F(SimpleForm1ClientID).reset();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>通过<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>" title="登录表单">登录表单</strong>演示文本输入、必填验证、读取当前值和重置表单。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>填写并提交</h3>
            <ol>
                <li>
                    保持<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>和密码为空，点击<strong class="example-control-reference" data-example-control="<%= btnSubmit.ClientID %>" title="登录">登录</strong>。<br />
                    结果：两个必填字段显示错误，按钮后续处理不会执行。
                </li>
                <li>
                    关闭验证提示，<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>输入<code>demo</code>，密码输入<code>123456</code>，再次点击<strong class="example-control-reference" data-example-control="<%= btnSubmit.ClientID %>" title="登录">登录</strong>。<br />
                    结果：后台读取两个文本框的当前值，页面下方显示“用户名：<code>demo</code> 密码：<code>123456</code>”；密码输入框内仍显示掩码。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>恢复初始值</h3>
            <ul>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnReset.ClientID %>" title="重置">重置</strong>。<br />
                    结果：<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>和密码恢复为空，字段上的验证错误被清除；重置在浏览器完成，无需回发。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Required</code>（<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>、<strong class="example-control-reference" data-example-control="<%= tbxPassword.ClientID %>" title="密码">密码</strong>）：初始为 <code>true</code>，<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>和密码都必须填写。</li>
                <li><code>EmptyText</code>（<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>、<strong class="example-control-reference" data-example-control="<%= tbxPassword.ClientID %>" title="密码">密码</strong>）：输入为空时显示<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">请输入用户名</strong>或<strong class="example-control-reference" data-example-control="<%= tbxPassword.ClientID %>" title="密码">请输入密码</strong>。</li>
                <li><code>TextMode</code>（<strong class="example-control-reference" data-example-control="<%= tbxPassword.ClientID %>" title="密码">密码</strong>）：密码框设为 <code>Password</code>，以掩码显示输入。</li>
                <li><code>ValidateForms</code>（<strong class="example-control-reference" data-example-control="<%= btnSubmit.ClientID %>" title="登录">登录</strong>）：登录按钮指定 <code>SimpleForm1</code>，在回发前验证整个<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>" title="登录表单">登录表单</strong>。</li>
                <li><code>ClickHandler</code>（<strong class="example-control-reference" data-example-control="<%= btnReset.ClientID %>" title="重置">重置</strong>）：重置按钮绑定客户端处理函数，调用表单的 <code>reset()</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
