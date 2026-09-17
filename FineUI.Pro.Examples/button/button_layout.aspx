<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_layout.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_layout" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <%--<f:Panel ID="Panel1" Margin="24px" IsViewPort="true" ShowBorder="false" ShowHeader="false" CssClass="f-widget-content" AutoScroll="true"
            Layout="VBox" BoxConfigAlign="Start" BoxConfigChildMargin="0 0 10px 0" BodyPadding="10px" runat="server">
            <Items>--%>
                <%--<f:Panel runat="server" Layout="HBox" ShowBorder="false" ShowHeader="false" Width="600px">
                    <Items>
                        <f:Button ID="btnIcon1" Text="图标在左侧" BoxFlex="1" Icon="Email" runat="server" />
                        <f:Button ID="btnIcon2" Text="图标在右侧" BoxFlex="1" IconAlign="Right" Icon="Star" runat="server" />
                        <f:Button ID="Button7" Text="图标在左侧" BoxFlex="1" IconFont="_Home" runat="server" />
                        <f:Button ID="Button8" Text="图标在右侧" BoxFlex="1" IconAlign="Right" IconFont="_Car" runat="server" />
                    </Items>
                </f:Panel>--%>
                <f:Panel runat="server" Layout="HBox" ShowBorder="false" ShowHeader="false" Width="600px">
                    <Items>
                        <f:Button ID="btnIcon3" Text="图标在上面" BoxFlex="1" IconAlign="Top" Icon="Email" runat="server" />
                        <f:Button ID="btnIcon4" Text="图标在下面" BoxFlex="1" IconAlign="Bottom" Icon="Star" runat="server" />
                        <f:Button ID="Button9" Text="图标在上面" BoxFlex="1" IconAlign="Top" IconFont="_Camera" runat="server" />
                        <f:Button ID="Button10" Text="图标在下面" BoxFlex="1" IconAlign="Bottom" IconFont="_Phone" runat="server" />
                    </Items>
                </f:Panel>
                <%--<f:Panel runat="server" Layout="VBox" Width="200px" ShowBorder="false" ShowHeader="false" MarginTop="50px">
                    <Items>
                        <f:Button ID="Button1" Text="图标在左侧" Icon="Email" runat="server" />
                        <f:Button ID="Button2" Text="图标在右侧" IconAlign="Right" Icon="Star" runat="server" />
                        <f:Button ID="Button3" Text="图标在左侧" IconFont="_Home" runat="server" />
                        <f:Button ID="Button4" Text="图标在右侧" IconAlign="Right" IconFont="_Car" runat="server" />
                    </Items>
                </f:Panel>
                <f:Panel runat="server" Layout="VBox" ShowBorder="false" ShowHeader="false" Width="200px">
                    <Items>
                        <f:Button ID="Button5" Text="图标在上面" IconAlign="Top" Icon="Email" runat="server" />
                        <f:Button ID="Button6" Text="图标在下面" IconAlign="Bottom" Icon="Star" runat="server" />
                        <f:Button ID="Button11" Text="图标在上面" IconAlign="Top" IconFont="_Camera" runat="server" />
                        <f:Button ID="Button12" Text="图标在下面" IconAlign="Bottom" IconFont="_Phone" runat="server" />
                    </Items>
                </f:Panel>--%>
            <%--</Items>
        </f:Panel>--%>
    </form>
</body>
</html>
