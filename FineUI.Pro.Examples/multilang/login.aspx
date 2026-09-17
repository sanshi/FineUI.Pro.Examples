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
</body>
</html>
