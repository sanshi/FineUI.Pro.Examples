<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_autoheight.aspx.cs" Inherits="FineUI.Pro.Examples.panel.panel_autoheight" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" Title="面板"
            BodyPadding="10px" EnableCollapse="false">
            <Items>
                <f:GroupPanel runat="server" Title="分组面板一">
                    <Items>
                        <f:Label runat="server" EncodeText="false" CssStyle="margin-bottom:0;" ID="labContent"></f:Label>
                    </Items>
                </f:GroupPanel>
            </Items>
        </f:Panel>
        <br />
        <f:Button ID="Button2" CssClass="marginr" Text="增加内容" runat="server" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button4" Text="减少内容" runat="server" OnClick="Button4_Click">
        </f:Button>
        <br />
        <br />
    </form>
</body>
</html>
