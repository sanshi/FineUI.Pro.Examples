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
                        <f:Image runat="server" CssClass="mypic" ImageUrl="~/res/images/my_face_80.jpg"></f:Image>
                        <f:TextBox ID="tbxUserName" Label="电子邮箱" ShowLabel="false" EmptyText="请输入电子邮箱" Required="true"
                            RegexPattern="EMAIL" RegexMessage="请输入有效的邮箱地址" runat="server">
                        </f:TextBox>
                        <f:TextBox ID="tbxPassword" Label="密码" ShowLabel="false" TextMode="Password" EmptyText="请输入密码" Required="true" runat="server">
                        </f:TextBox>
                        <f:Button ID="btnLogin" Text="登录" Type="Submit" ClickHandler="onLoginClick" runat="server" OnClick="btnLogin_Click">
                        </f:Button>
                        <f:Panel runat="server" CssClass="myhyperlinkcontainer" ShowBorder="false" ShowHeader="false">
                            <Items>
                                <f:HyperLink ID="HyperLink1" runat="server" CssClass="myhyperlink" NavigateUrl="http://fineui.com/bbs/" Text="新用户注册"></f:HyperLink>
                                <f:HyperLink ID="HyperLink2" runat="server" CssClass="myhyperlink" NavigateUrl="http://fineui.com/bbs/" Text="忘记密码？"></f:HyperLink>
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
            var alertHtml = ['<ul class="myerrorlist">'], loopItem;
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
                ok: function () {
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
</body>
</html>
