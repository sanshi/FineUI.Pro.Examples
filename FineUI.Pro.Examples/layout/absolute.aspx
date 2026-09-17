<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="absolute.aspx.cs" Inherits="FineUI.Pro.Examples.layout.absolute" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel2" IsFluid="true" runat="server" Height="500px" ShowBorder="true" EnableCollapse="false"
            Layout="Absolute" ShowHeader="true" Title="面板（Height=450px Width=750px Layout=Absolute）">
            <Items>
                <f:Panel ID="Panel1" Width="300px" Title="Panel1" Height="300px" AbsoluteX="100px"
                    BodyPadding="10px" AbsoluteY="50px" runat="server"
                    ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" EncodeText="false" Text="Width=300px <br/>Height=300px <br/>AbsoluteX=100px <br/>AbsoluteY=50px"
                            runat="server">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel3" Title="Panel2" Width="150px" Height="150px" AbsoluteX="450px"
                    BodyPadding="10px" AbsoluteY="150px" runat="server"
                    ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" EncodeText="false" Text="Width=150px <br/>Height=150px <br/>AbsoluteX=450px <br/>AbsoluteY=150px"
                            runat="server">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
