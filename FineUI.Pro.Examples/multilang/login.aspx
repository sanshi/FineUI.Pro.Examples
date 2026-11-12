<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="FineUI.Pro.Examples.multilang.login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" EncodeText="true" />
        <div>
            <%= GetLocalResourceObject("Notice") %>
        </div>

        <f:Window Width="350px" WindowPosition="GoldenSection" EnableClose="false" IsModal="false" Title="<%$ Resources:WindowTitle %>" ID="Window1" runat="server">
            <Items>
                <f:SimpleForm ShowHeader="false" BodyPadding="10" ShowBorder="false" ID="SimpleForm1" runat="server">
                    <Items>
                        <f:TextBox ShowRedStar="true" Required="true" Label="<%$ Resources:UserName %>" ID="tbxUserName" runat="server"></f:TextBox>
                        <f:TextBox ShowRedStar="true" Required="true" TextMode="Password" Label="<%$ Resources:Password %>" ID="tbxPassword" runat="server"></f:TextBox>
                    </Items>
                </f:SimpleForm>
            </Items>
            <Toolbars>
                <f:Toolbar Position="Bottom" ToolbarAlign="Right" ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button Type="Submit" ID="btnLogin" Text="<%$ Resources:Login %>" ValidateTarget="Top" ValidateForms="SimpleForm1" ButtonColor="Primary"
                            OnClick="btnLogin_Click" runat="server">
                        </f:Button>
                        <f:Button Type="Reset" Text="<%$ Resources:Reset %>" ID="btnReset" runat="server"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>

    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>从本地化资源生成界面文字，对照同一页面的中文和英文。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>切换界面语言</h3>
    <ul>
        <li>使用页面提供的中文、英文语言链接分别进入本页。<br />结果：<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("SimpleForm1").ClientID %>' title="表单">表单</strong>的标题、字段标签或列头、按钮文字按所选语言重新生成；此操作重新加载页面。</li>
        <li>在英文界面清空必填字段，再点击登录。<br />结果：验证提示也使用当前语言；标签翻译和验证消息保持一致。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>_R()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("SimpleForm1").ClientID %>' title="表单">表单</strong>）：读取当前语言的资源文字，分别用于标题、字段、按钮或节点。</li>
        <li><code>语言参数</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("SimpleForm1").ClientID %>' title="表单">表单</strong>）：语言链接重新请求当前页面，由本端语言设置选择资源，不是仅替换一段可见文本。</li>
    </ul>
</section>
</template>
</body>
</html>
