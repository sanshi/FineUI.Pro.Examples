<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buttongroup_vertical.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.button.buttongroup_vertical" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigChildMargin="0 0 10px 0" BodyPadding="10px" AutoScroll="true" runat="server">
            <Items>
                <f:ButtonGroup ID="ButtonGroup2" Layout="VBox" BoxConfigAlign="StretchMax" EnablePressGroup="true" Vertical="true" runat="server">
                    <Items>
                        <f:Button ID="Button4" runat="server" Text="按钮一" Icon="Cake" EnablePress="true" Pressed="true">
                        </f:Button>
                        <f:Button ID="Button5" runat="server" Text="按钮二" IconFont="_Bank" EnablePress="true">
                        </f:Button>
                        <f:Button ID="Button6" runat="server" Text="按钮三" IconFont="_Group" EnablePress="true">
                        </f:Button>
                    </Items>
                </f:ButtonGroup>
                <f:ButtonGroup ID="ButtonGroup6" Layout="VBox" BoxConfigAlign="StretchMaxCenter" EnablePressGroup="true" Vertical="true" runat="server">
                    <Items>
                        <f:Button ID="Button16" runat="server" Text="按钮一" Icon="Cake" EnablePress="true">
                        </f:Button>
                        <f:Button ID="Button17" runat="server" Text="按钮二" IconFont="_Bank" EnablePress="true" Pressed="true">
                        </f:Button>
                        <f:Button ID="Button18" runat="server" Text="按钮三" IconFont="_Group" EnablePress="true">
                        </f:Button>
                    </Items>
                </f:ButtonGroup>
                <f:ButtonGroup ID="ButtonGroup7" Layout="VBox" BoxConfigAlign="StretchMaxEnd" EnablePressGroup="true" Vertical="true" runat="server">
                    <Items>
                        <f:Button ID="Button19" runat="server" Text="按钮一" Icon="Cake" EnablePress="true">
                        </f:Button>
                        <f:Button ID="Button20" runat="server" Text="按钮二" IconFont="_Bank" EnablePress="true">
                        </f:Button>
                        <f:Button ID="Button21" runat="server" Text="按钮三" IconFont="_Group" EnablePress="true" Pressed="true">
                        </f:Button>
                    </Items>
                </f:ButtonGroup>
                <f:ButtonGroup ID="ButtonGroup8" Layout="VBox" BoxConfigAlign="Stretch" EnablePressGroup="true" Vertical="true" runat="server">
                    <Items>
                        <f:Button ID="Button22" runat="server" Text="按钮一" Icon="Cake" EnablePress="true">
                        </f:Button>
                        <f:Button ID="Button23" runat="server" Text="按钮二" IconFont="_Bank" EnablePress="true" Pressed="true">
                        </f:Button>
                        <f:Button ID="Button24" runat="server" Text="按钮三" IconFont="_Group" EnablePress="true">
                        </f:Button>
                    </Items>
                </f:ButtonGroup>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
