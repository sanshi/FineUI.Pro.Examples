<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_validatemessageboxplain.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.form.login_validatemessageboxplain" %>

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
                        <f:TextBox ID="tbxUserName" Label="用户名" ShowLabel="false" EmptyText="请输入用户名" Required="true" runat="server">
                        </f:TextBox>
                        <f:TextBox ID="tbxPassword" Label="密码" ShowLabel="false" TextMode="Password" EmptyText="请输入密码" Required="true" runat="server">
                        </f:TextBox>
                        <f:Button ID="btnLogin" Text="登录" Type="Submit" ValidateForms="SimpleForm1" ValidateMessageBoxPlain="true" runat="server" OnClick="btnLogin_Click">
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
</body>
</html>
