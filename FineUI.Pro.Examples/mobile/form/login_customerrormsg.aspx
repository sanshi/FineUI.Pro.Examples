<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_customerrormsg.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.form.login_customerrormsg" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .mypic {
            text-align: center;
        }

        .mypic img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
        }

        .myhyperlinkcontainer {
            text-align: center;
            margin-top: 20px;
        }

        .myhyperlink {
            display: inline-block !important;
            margin-right: 5px;
        }

        .myhyperlink a {
            font-size: 0.8em;
        }


        .myerrorlist {
            margin: 0;
            padding: 0 0 0 30px;
        }

        .myerrorlist li {
            margin: 10px 0;
        }

        .myerrorlist-errorfield {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .myerrorlist-errormsg {
            font-size: 14px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel runat="server" ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="Fit" BodyPadding="20px">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" Title="系统登录" HeaderStyle="true">
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:SimpleForm ID="SimpleForm1" runat="server" ShowBorder="false" ShowHeader="false" Layout="VBox" MessageTarget="None">
                    <Items>
                        <f:Image runat="server" CssClass="mypic" ImageUrl="~/res/images/my-face-80.jpg"></f:Image>
                        <f:TextBox ID="tbxUserName" Label="电子邮箱" ShowLabel="false" EmptyText="请输入电子邮箱" Required="true" RegexPattern="EMAIL"
                            RegexMessage="请输入有效的邮箱地址" runat="server">
                        </f:TextBox>
                        <f:TextBox ID="tbxPassword" Label="密码" ShowLabel="false" TextMode="Password" EmptyText="请输入密码" Required="true" runat="server">
                        </f:TextBox>
                        <f:Button ID="btnLogin" Text="登录" Type="Submit" ClickHandler="onLoginClick" runat="server" OnClick="btnLogin_Click">
                        </f:Button>
                        <f:Panel runat="server" CssClass="myhyperlinkcontainer" ShowBorder="false" ShowHeader="false">
                            <Items>
                                <f:HyperLink ID="HyperLink1" runat="server" CssClass="myhyperlink" NavigateUrl="http://fineui.com/bbs/" Text="新用户注册">
                                </f:HyperLink>
                                <f:HyperLink ID="HyperLink2" runat="server" CssClass="myhyperlink" NavigateUrl="http://fineui.com/bbs/" Text="忘记密码？">
                                </f:HyperLink>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:SimpleForm>
            </Items>
        </f:Panel>
    </form>
    <script>
        var SimpleForm1ClientID = '<%= SimpleForm1.ClientID %>';

        // 验证表单
        function validateTheForm() {
            var form1 = F(SimpleForm1ClientID);

            // 检查表单字段是否有效
            var validResult = form1.isValid();
            if (validResult[0]) {
                // 验证通过
                return true;
            }


            // 验证失败的字段（包含多个）
            var alertHtml = ['<ul class="myerrorlist">'],
                loopItem;
            for (var i = 1, count = validResult.length; i < count; i++) {
                loopItem = validResult[i];
                alertHtml.push('<li><div class="myerrorlist-errorfield">' + F.htmlEncode(loopItem.fieldLabel) + '</div>' +
                    '<div class="myerrorlist-errormsg">' + F.htmlEncode(loopItem.bodyEl.attr('data-errormsg')) + '</div></li>');
            }
            alertHtml.push('</ul>');

            // 自定义提示框
            F.alert({
                message: F.rawHtml(alertHtml.join('')),
                messageIcon: '',
                header: false,
                buttonPlain: true,
                ok: function() {
                    // 让第一个验证失败的字段获取焦点
                    validResult[1].focus(true, 200);
                }
            });

        }

        function onLoginClick(event) {
            // 校验不通过时必须显式 return false，才能中断后续的服务端回发。
            if (!validateTheForm()) {
                return false;
            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示收集移动表单各字段的错误，按自定义列表显示，并只在验证通过后处理登录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>集中列出字段错误</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnLogin").ClientID %>'
                        title="登录">登录</strong>。<br />结果：空表单显示电子邮箱和密码的必填错误列表，不继续回发。</li>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxUserName").ClientID %>'
                        title="电子邮箱">电子邮箱</strong>输入<code>x</code>，密码输入<code>y</code>，再次登录。<br />结果：错误列表改为邮箱格式错误，不把已填写的邮箱继续报告为必填错误。</li>
                <li>邮箱改为<code>admin&#64;fineui.com</code>，密码改为<code>admin</code>后登录。<br />结果：浏览器验证通过后才回发，后台读取密码并显示本页示例结果。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RegexPattern</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxUserName").ClientID %>'
                        title="电子邮箱">电子邮箱</strong>）：初始为<code>EMAIL</code>，邮箱字段使用本页邮箱格式规则。</li>
                <li><code>isValid()</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("SimpleForm1").ClientID %>' title="表单">表单</strong>）：先检查字段，再由本页处理函数收集错误信息。
                </li>
                <li><code>ClickHandler</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnLogin").ClientID %>'
                        title="登录">登录</strong>）：初始为<code>onLoginClick</code>，登录入口在浏览器控制是否继续执行后续处理。</li>
            </ul>
        </section>
    </template>
</body>
</html>
