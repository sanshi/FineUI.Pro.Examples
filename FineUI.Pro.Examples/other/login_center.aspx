<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_center.aspx.cs" Inherits="FineUI.Pro.Examples.other.login_center" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>

        /* margin 属性不能设置到 #SimpleForm1，因为 SimpleForm1 的宽度设置包含了 margin */
        #SimpleForm1_wrapper {
            margin: 100px auto 0 auto;
            width: 350px;    
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />


        
        <f:SimpleForm ID="SimpleForm1" runat="server" ShowBorder="true" BodyPadding="10px" IsFluid="true"
            ShowHeader="true" Title="登录表单" Width="350px">
            <Items>
                <f:TextBox ID="tbxUserName" Label="用户名" Required="true" ShowRedStar="true" runat="server">
                </f:TextBox>
                <f:TextBox ID="tbxPassword" Label="密码" TextMode="Password" Required="true" ShowRedStar="true" runat="server">
                </f:TextBox>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Center" Position="Bottom">
                    <Items>
                        <f:Button ID="btnLogin" Text="登录" Type="Submit" ValidateForms="SimpleForm1" ValidateTarget="Top"
                            runat="server" OnClick="btnLogin_Click">
                        </f:Button>
                        <f:Button ID="btnReset" Text="重置" Type="Reset"
                            runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>

    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示通过页面 CSS 将固定宽度的<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>" title="登录表单">登录表单</strong>居中。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>调整页面后观察表单位置</h3>
            <ol>
                <li>
                    调整浏览器的宽度和高度。<br />
                    结果：<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>" title="登录表单">登录表单</strong>按页面的居中样式重新定位，表单仍使用本页指定的宽度。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p><strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>：<code>admin</code> <br /> 密码：<code>admin</code> <br /> <br /> <br /> 注：</p>
            <ul>
                <li> 通过CSS设置<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>" title="登录表单">登录表单</strong>居中显示（CSS属性不能直接设置到 <strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>" title="登录表单">SimpleForm1</strong>，因为其 <code>Width</code> 已经包含了 <code>margin</code> ）。 </li>
                <li> 设置表单属性 <code>CssClass</code>="<code>f</code>-<code>shadow</code>"，增加其边框阴影。 </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Width</code>（<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>" title="登录表单">登录表单</strong>）：<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>" title="登录表单">登录表单</strong>宽度为 <code>350</code> 像素。</li>
                <li><code>CssClass</code>（<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>、<strong class="example-control-reference" data-example-control="<%= tbxPassword.ClientID %>" title="密码">密码</strong>）：<code>f</code>-<code>shadow</code> 为表单增加阴影，页面样式负责居中。</li>
            </ul>
        </section>
    </template>
</body>
</html>
