<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="FineUI.Pro.Examples.basic.login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <div>
            用户名：admin
            <br />
            密码：admin
            <br />
            <br />
            <br />
            注意：在任意输入框内按回车键都会触发表单的提交（相当于点击【登陆】按钮）。
        </div>

        <f:Window Width="350" WindowPosition="GoldenSection" EnableClose="false" IsModal="false" Title="登录表单" ID="Window1" runat="server">
            <Items>
                <f:SimpleForm ShowHeader="false" BodyPadding="10" RemoveLastFieldsMargin="true" ShowBorder="false" ID="SimpleForm1" runat="server">
                    <Items>
                        <f:TextBox ShowRedStar="true" Required="true" Label="用户名" ID="tbxUserName" runat="server"></f:TextBox>
                        <f:TextBox ShowRedStar="true" Required="true" TextMode="Password" Label="密码" ID="tbxPassword" runat="server"></f:TextBox>
                    </Items>
                </f:SimpleForm>
            </Items>
            <Toolbars>
                <f:Toolbar Position="Bottom" ToolbarAlign="Right" ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button Type="Submit" ID="btnLogin" Text="登录" ValidateTarget="Top" ValidateForms="SimpleForm1" ButtonColor="Primary"
                            OnClick="btnLogin_Click" runat="server">
                        </f:Button>
                        <f:Button Type="Reset" Text="重置" ID="btnReset" runat="server"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>

    </form>
</body>
</html>
