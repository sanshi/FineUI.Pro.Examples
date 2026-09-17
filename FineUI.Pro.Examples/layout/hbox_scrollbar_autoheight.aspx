<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hbox_scrollbar_autoheight.aspx.cs" Inherits="FineUI.Pro.Examples.layout.hbox_scrollbar_autoheight" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel5" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="false"
            Layout="HBox" AutoScroll="true"
            ShowHeader="true" Title="面板（Layout=HBox AutoScroll=true），宽度变小时可能出现横向滚动条"
            BoxConfigChildMargin="0 5 0 0" BodyPadding="5">
            <Items>
                <f:Panel ID="Panel1" Title="面板1" Width="600px" runat="server"
                    BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="Width=600">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel2" Title="面板2" BoxFlex="1" MinWidth="600px" Margin="0"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="BoxFlex=1 Margin=0 MinWidth=600">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        注：反复缩小页面宽度，使得面板出现横向滚动条，此时面板的高度应保持不变。

    </form>
</body>
</html>
