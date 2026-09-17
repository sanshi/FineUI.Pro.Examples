<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_in_layout.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_in_layout" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel2" IsFluid="true" runat="server" Height="500px" ShowBorder="true" EnableCollapse="false"
            Layout="HBox" BodyPadding="10px" BoxConfigChildMargin="0 5 0 0" ShowHeader="true"
            Title="面板">
            <Items>
                <f:Panel ID="Panel1" BoxFlex="1" runat="server" ShowBorder="true" ShowHeader="false"
                    Layout="VBox" BodyPadding="10px" BoxConfigChildMargin="0 0 5 0">
                    <Items>
                        <f:Button ID="btnIcon1" Text="图标在左侧" BoxFlex="1" Icon="Email" runat="server" />
                        <f:Button ID="btnIcon2" Text="图标在右侧" BoxFlex="1" IconAlign="Right" Icon="Star" runat="server" />
                        <f:Button ID="btnIcon3" Text="图标在上面" BoxFlex="1" IconAlign="Top" Icon="Email" runat="server" />
                        <f:Button ID="btnIcon4" Text="图标在下面" BoxFlex="1" IconAlign="Bottom" Icon="Star" runat="server" />
                        <f:Button ID="Button1" IconUrl="~/res/images/16/1.png" BoxFlex="1" runat="server" />
                        <f:Button ID="Button2" IconUrl="~/res/images/16/8.png" BoxFlex="1" Margin="0" runat="server" />
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel3" BoxFlex="1" runat="server" ShowBorder="true"
                    Layout="VBox" BodyPadding="10px" BoxConfigChildMargin="0 0 5 0" ShowHeader="false">
                    <Items>
                        <f:Button ID="Button23" Size="Large" Text="图标在左侧" BoxFlex="1" Icon="Email" runat="server" />
                        <f:Button ID="Button24" Size="Large" Text="图标在右侧" BoxFlex="1" IconAlign="Right" Icon="Star" runat="server" />
                        <f:Button ID="Button25" Size="Large" Text="图标在上面" BoxFlex="1" IconAlign="Top" Icon="Email" runat="server" />
                        <f:Button ID="Button26" Size="Large" Text="图标在下面" BoxFlex="1" Margin="0" IconAlign="Bottom" Icon="Star" runat="server" />
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel4" BoxFlex="1" runat="server" ShowBorder="true" ShowHeader="false"
                    Layout="VBox" BodyPadding="10px" BoxConfigChildMargin="0 0 5 0">
                    <Items>
                        <f:Button ID="Button7" Text="图标在左侧" BoxFlex="1" IconFont="_Home" runat="server" />
                        <f:Button ID="Button8" Text="图标在右侧" BoxFlex="1" IconAlign="Right" IconFont="_Car" runat="server" />
                        <f:Button ID="Button9" Text="图标在上面" BoxFlex="1" IconAlign="Top" IconFont="_Camera" runat="server" />
                        <f:Button ID="Button10" Text="图标在下面" BoxFlex="1" IconAlign="Bottom" IconFont="_Phone" runat="server" />
                        <f:Button ID="Button11" IconFont="_Android" BoxFlex="1" runat="server" />
                        <f:Button ID="Button12" IconFont="_Apple" BoxFlex="1" Margin="0" runat="server" />
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel5" BoxFlex="1" runat="server" Margin="0" ShowBorder="true" ShowHeader="false"
                    Layout="VBox" BodyPadding="10px" BoxConfigChildMargin="0 0 5 0">
                    <Items>
                        <f:Button ID="Button19" Size="Large" Text="图标在左侧" BoxFlex="1" IconFont="_Home" runat="server" />
                        <f:Button ID="Button20" Size="Large" Text="图标在右侧" BoxFlex="1" IconAlign="Right" IconFont="_Car" runat="server" />
                        <f:Button ID="Button21" Size="Large" Text="图标在上面" BoxFlex="1" IconAlign="Top" IconFont="_Camera" runat="server" />
                        <f:Button ID="Button22" Size="Large" Text="图标在下面" BoxFlex="1" Margin="0" IconAlign="Bottom" IconFont="_Phone" runat="server" />
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
