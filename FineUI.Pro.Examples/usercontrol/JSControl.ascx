<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JSControl.ascx.cs"
    Inherits="FineUI.Pro.Examples.usercontrol.JSControl" %>

<f:Panel runat="server" ID="Panel1" BodyPadding="10px" Title="用户控件">
    <Items>
        <f:Label runat="server" ID="labUserInfo">
        </f:Label>
        <f:Button runat="server" ID="btnClientScript" Text="当前用户控件信息"></f:Button>
    </Items>
</f:Panel>
