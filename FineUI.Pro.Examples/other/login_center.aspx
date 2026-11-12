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
            <p>演示通过页面 CSS 将固定宽度的登录表单居中。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>调整页面后观察表单位置</h3>
            <ol>
                <li>
                    调整浏览器的宽度和高度。<br />
                    结果：登录表单按页面的居中样式重新定位，表单仍使用本页指定的宽度。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>用户名：admin <br> 密码：admin <br> <br> <br> 注：</p>
            <ul>
                <li> 通过CSS设置登录表单居中显示（CSS属性不能直接设置到 SimpleForm1，因为其 Width 已经包含了 margin ）。 </li>
                <li> 设置表单属性 CssClass="f-shadow"，增加其边框阴影。 </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Width</code>：登录表单宽度为 350 像素。</li>
                <li><code>CssClass</code>：f-shadow 为表单增加阴影，页面样式负责居中。</li>
            </ul>
        </section>
    </template>
</body>
</html>
