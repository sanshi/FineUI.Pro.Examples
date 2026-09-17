<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.window.window" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigChildMargin="0 0 5px 0" BodyPadding="10px" runat="server">
            <Items>
                <f:Button runat="server" ID="btnOpenWindow" Text="打开登陆窗体" ClickHandler="onOpenWindowClick"></f:Button>
            </Items>
        </f:Panel>
        <f:Window runat="server" ID="Window1" Title="登陆窗体" Hidden="true" IsModal="true" EnableClose="true" 
            Layout="Fit" BodyPadding="15px" Width="300px">
            <Items>
                <f:SimpleForm ID="SimpleForm1" runat="server" ShowBorder="false" ShowHeader="false" Layout="VBox" MessageTarget="None">
                    <Items>
                        <f:TextBox ID="tbxUserName" Label="用户名" ShowLabel="false" EmptyText="请输入用户名" Required="true" runat="server">
                        </f:TextBox>
                        <f:TextBox ID="tbxPassword" Label="密码" ShowLabel="false" TextMode="Password" EmptyText="请输入密码" Required="true" runat="server">
                        </f:TextBox>
                        <f:Button ID="btnLogin" Text="登录" Type="Submit" BoxFlex="1" ValidateForms="Window1" ValidateMessageBoxPlain="true" runat="server" OnClick="btnLogin_Click">
                        </f:Button>
                    </Items>
                </f:SimpleForm>
            </Items>
        </f:Window>
    </form>
    <script>

        var window1ClientID = '<%= Window1.ClientID %>';
        
        function onCancelClick() {
            F(window1ClientID).hide();
        }

        function onOpenWindowClick(event) {
            F(window1ClientID).show();

        }

    </script>
</body>
</html>
