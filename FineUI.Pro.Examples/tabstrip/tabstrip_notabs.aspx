<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_notabs.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_notabs" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="250px" EnableTabCloseMenu="true"
            ShowBorder="true" runat="server">
            <Tabs>
                <f:Tab ID="Tab1" Title="标签一" EnableClose="false" Hidden="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label5" Text="标签一中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab2" Title="标签二" BodyPadding="10px" Hidden="true" EnableClose="true" runat="server">
                    <Items>
                        <f:Label ID="Label4" Text="标签二中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab3" Title="标签三" BodyPadding="10px" Hidden="true" EnableClose="true" runat="server">
                    <Items>
                        <f:Label ID="Label3" Text="标签三中的文本" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <br />
        <f:Button ID="btnShowTab1" Text="显示标签一" CssClass="marginr"
 runat="server" ClickHandler="onShowTab1Click">
        </f:Button>
        <f:Button ID="btnShowTab2" Text="显示标签二" CssClass="marginr"
 runat="server" ClickHandler="onShowTab2Click">
        </f:Button>
        <f:Button ID="btnShowTab3" Text="显示标签三" CssClass="marginr"
 runat="server" ClickHandler="onShowTab3Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnShowActiveTab1" Text="显示并激活标签一" CssClass="marginr"
 runat="server" ClickHandler="onShowActiveTab1Click">
        </f:Button>
        <f:Button ID="btnShowActiveTab2" Text="显示并激活标签二" CssClass="marginr"
 runat="server" ClickHandler="onShowActiveTab2Click">
        </f:Button>
        <f:Button ID="btnShowActiveTab3" Text="显示并激活标签三" CssClass="marginr"
 runat="server" ClickHandler="onShowActiveTab3Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnHideTab1" Text="隐藏标签一" CssClass="marginr"
 runat="server" ClickHandler="onHideTab1Click">
        </f:Button>
        <f:Button ID="btnHideTab2" Text="隐藏标签二" CssClass="marginr"
 runat="server" ClickHandler="onHideTab2Click">
        </f:Button>
        <f:Button ID="btnHideTab3" Text="隐藏标签三" CssClass="marginr"
 runat="server" ClickHandler="onHideTab3Click">
        </f:Button>
        <br />
        <br />
        <br />
        <br />
    </form>
    <script>

        var Tab1ClientID = '<%= Tab1.ClientID %>';
        var Tab2ClientID = '<%= Tab2.ClientID %>';
        var Tab3ClientID = '<%= Tab3.ClientID %>';

        function onShowTab1Click(event) {
            F(Tab1ClientID).show();
        }

        function onShowTab2Click(event) {
            F(Tab2ClientID).show();
        }

        function onShowTab3Click(event) {
            F(Tab3ClientID).show();
        }

        function onShowActiveTab1Click(event) {
            F(Tab1ClientID).show();
            F(Tab1ClientID).activate();
        }

        function onShowActiveTab2Click(event) {
            F(Tab2ClientID).show();
            F(Tab2ClientID).activate();
        }

        function onShowActiveTab3Click(event) {
            F(Tab3ClientID).show();
            F(Tab3ClientID).activate();
        }

        function onHideTab1Click(event) {
            F(Tab1ClientID).hide();
        }

        function onHideTab2Click(event) {
            F(Tab2ClientID).hide();
        }

        function onHideTab3Click(event) {
            F(Tab3ClientID).hide();
        }

    </script>
</body>
</html>
