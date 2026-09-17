<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vbox.aspx.cs" Inherits="FineUI.Pro.Examples.layout.vbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel2" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="true"
            Layout="VBox" BodyPadding="10px"
            BoxConfigChildMargin="0 0 5 0" ShowHeader="true" Title="面板（Layout=VBox Height=350px）（默认值：BoxConfigAlign=Stretch BoxConfigPosition=Start）">
            <Items>
                <f:Panel ID="Panel1" Title="面板1" BoxFlex="1" runat="server"
                    BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="BoxFlex=1">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel3" Title="面板2" Height="60px" runat="server"
                    BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label2" runat="server" Text="Height=60px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel4" Title="面板3" BoxFlex="2" Margin="0"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="BoxFlex=2 Margin=0">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel5" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="true"
            Layout="VBox" BoxConfigAlign="Stretch" BoxConfigPosition="End" BodyPadding="10px"
            BoxConfigChildMargin="0 0 5 0" ShowHeader="true" Title="面板（Layout=VBox Height=350px BoxConfigAlign=Stretch BoxConfigPosition=End）">
            <Items>
                <f:Panel ID="Panel6" Title="面板1" Height="60px" runat="server"
                    BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label4" runat="server" Text="Height=60px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel7" Title="面板2" Height="60px" runat="server"
                    BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label5" runat="server" Text="Height=60px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel8" Title="面板3" Height="60px" Margin="0"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label6" runat="server" Text="Height=60px Margin=0">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel9" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="true"
            Layout="VBox" BoxConfigAlign="Stretch" BoxConfigPosition="Center" BodyPadding="10px"
            BoxConfigChildMargin="0 0 5 0" ShowHeader="true" Title="面板（Layout=VBox Height=350px BoxConfigAlign=Stretch BoxConfigPosition=Center）">
            <Items>
                <f:Panel ID="Panel10" Title="面板1" Height="60px" runat="server"
                    BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label7" runat="server" Text="Height=60px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel11" Title="面板2" Height="60px" runat="server"
                    BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label8" runat="server" Text="Height=60px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel12" Title="面板3" Height="60px" Margin="0"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label9" runat="server" Text="Height=60px Margin=0">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel13" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="true"
            Layout="VBox" BoxConfigAlign="Start" BoxConfigPosition="Center" BodyPadding="10px"
            BoxConfigChildMargin="0 0 5 0" ShowHeader="true" Title="面板（Layout=VBox Height=350px BoxConfigAlign=Start BoxConfigPosition=Center）">
            <Items>
                <f:Panel ID="Panel14" Title="面板1" Width="200px" Height="60px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label10" runat="server" Text="Width=200px Height=60px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel15" Title="面板2" Width="400px" Height="60px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label11" runat="server" Text="Width=400px Height=60px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel16" Title="面板3" Width="600px" Margin="0"
                    Height="60px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label12" runat="server" Text="Width=600px Height=60px Margin=0">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel21" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="true"
            Layout="VBox" BoxConfigAlign="Center" BoxConfigPosition="End" BodyPadding="10px"
            BoxConfigChildMargin="0 0 5 0" ShowHeader="true" Title="面板（Layout=VBox Height=350px BoxConfigAlign=Center BoxConfigPosition=End）">
            <Items>
                <f:Panel ID="Panel22" Title="面板1" Width="200px" Height="60px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label16" runat="server" Text="Width=200px Height=60px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel23" Title="面板2" Width="400px" Height="60px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label17" runat="server" Text="Width=400px Height=60px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel24" Title="面板3" Width="600px" Margin="0"
                    Height="60px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label18" runat="server" Text="Width=600px Height=60px Margin=0">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel25" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="true"
            Layout="VBox" BoxConfigAlign="End" BoxConfigPosition="Center" BodyPadding="10px"
            BoxConfigChildMargin="0 0 5 0" ShowHeader="true" Title="面板（Layout=VBox Height=350px BoxConfigAlign=End BoxConfigPosition=Center）">
            <Items>
                <f:Panel ID="Panel26" Title="面板1" Width="200px" Height="60px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label19" runat="server" Text="Width=200px Height=60px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel27" Title="面板2" Width="400px" Height="60px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label20" runat="server" Text="Width=400px Height=60px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel28" Title="面板3" Width="600px" Margin="0"
                    Height="60px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label21" runat="server" Text="Width=600px Height=60px Margin=0">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel17" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="true"
            Layout="VBox" BoxConfigAlign="StretchMax" BoxConfigPosition="Center" BodyPadding="10px"
            BoxConfigChildMargin="0 0 5 0" ShowHeader="true" Title="面板（Layout=VBox Height=350px BoxConfigAlign=StretchMax BoxConfigPosition=Center）">
            <Items>
                <f:Panel ID="Panel18" Title="面板1" Width="200px" Height="60px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label13" runat="server" Text="Width=200px Height=60px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel19" Title="面板2" Width="400px" Height="60px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label14" runat="server" Text="Width=400px Height=60px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel20" Title="面板3" Width="600px" Margin="0"
                    Height="60px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label15" runat="server" Text="Width=600px Height=60px Margin=0">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel31" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="true"
            Layout="VBox" BoxConfigAlign="StretchMaxCenter" BoxConfigPosition="Center" BodyPadding="10px"
            BoxConfigChildMargin="0 0 5 0" ShowHeader="true" Title="面板（Layout=VBox Height=350px BoxConfigAlign=StretchMaxCenter BoxConfigPosition=Center）">
            <Items>
                <f:Panel ID="Panel32" Title="面板1" Width="200px" Height="60px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label23" runat="server" Text="Width=200px Height=60px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel33" Title="面板2" Width="400px" Height="60px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label24" runat="server" Text="Width=400px Height=60px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel34" Title="面板3" Width="600px" Margin="0"
                    Height="60px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label25" runat="server" Text="Width=600px Height=60px Margin=0">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel35" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="true"
            Layout="VBox" BoxConfigAlign="StretchMaxEnd" BoxConfigPosition="Center" BodyPadding="10px"
            BoxConfigChildMargin="0 0 5 0" ShowHeader="true" Title="面板（Layout=VBox Height=350px BoxConfigAlign=StretchMaxEnd BoxConfigPosition=Center）">
            <Items>
                <f:Panel ID="Panel36" Title="面板1" Width="200px" Height="60px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label26" runat="server" Text="Width=200px Height=60px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel37" Title="面板2" Width="400px" Height="60px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label27" runat="server" Text="Width=400px Height=60px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel38" Title="面板3" Width="600px" Margin="0"
                    Height="60px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label28" runat="server" Text="Width=600px Height=60px Margin=0">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel29" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="true"
            Layout="VBox" BoxConfigAlign="Center" BoxConfigPosition="Center" BodyPadding="10px" ShowHeader="true" 
            Title="面板（Layout=VBox Height=350px BoxConfigAlign=Center BoxConfigPosition=Center）">
            <Items>
                <f:Panel ID="Panel30" Title="面板（居中显示）" Width="200px" Height="100px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label22" runat="server" Text="Width=200px Height=100px">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
