<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buttongroup.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.button.buttongroup" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigChildMargin="0 0 30px 0" BodyPadding="10px" AutoScroll="true" runat="server">
            <Items>
                <f:ButtonGroup ID="ButtonGroup1" EnablePressGroup="true" runat="server">
                    <Items>
                        <f:Button ID="Button1" runat="server" Text="按钮一" EnablePress="true" Pressed="true">
                        </f:Button>
                        <f:Button ID="Button2" runat="server" Text="按钮二" EnablePress="true">
                        </f:Button>
                        <f:Button ID="Button3" runat="server" Text="按钮三" EnablePress="true">
                        </f:Button>
                    </Items>
                </f:ButtonGroup>
                <f:ButtonGroup ID="ButtonGroup4" Layout="HBox" BoxConfigPosition="Center" EnablePressGroup="true" runat="server">
                    <Items>
                        <f:Button ID="Button10" runat="server" Text="按钮一" EnablePress="true">
                        </f:Button>
                        <f:Button ID="Button11" runat="server" Text="按钮二" EnablePress="true" Pressed="true">
                        </f:Button>
                        <f:Button ID="Button12" runat="server" Text="按钮三" EnablePress="true">
                        </f:Button>
                    </Items>
                </f:ButtonGroup>
                <f:ButtonGroup ID="ButtonGroup5" Layout="HBox" BoxConfigPosition="End" EnablePressGroup="true" runat="server">
                    <Items>
                        <f:Button ID="Button13" runat="server" Text="按钮一" EnablePress="true">
                        </f:Button>
                        <f:Button ID="Button14" runat="server" Text="按钮二" EnablePress="true">
                        </f:Button>
                        <f:Button ID="Button15" runat="server" Text="按钮三" EnablePress="true" Pressed="true">
                        </f:Button>
                    </Items>
                </f:ButtonGroup>
                <f:ButtonGroup ID="ButtonGroup3" Layout="HBox" EnablePressGroup="true" runat="server">
                    <Items>
                        <f:Button ID="Button7" runat="server" BoxFlex="1" Text="按钮一" EnablePress="true">
                        </f:Button>
                        <f:Button ID="Button8" runat="server" BoxFlex="1" Text="按钮二" EnablePress="true" Pressed="true">
                        </f:Button>
                        <f:Button ID="Button9" runat="server" BoxFlex="1" Text="按钮三" EnablePress="true">
                        </f:Button>
                    </Items>
                </f:ButtonGroup>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
