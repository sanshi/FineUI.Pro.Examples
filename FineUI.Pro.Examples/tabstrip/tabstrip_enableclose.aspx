<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_enableclose.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_enableclose" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="350px" EnableTabCloseMenu="true" 
            ShowBorder="true" ActiveTabIndex="1" runat="server">
            <Tabs>
                <f:Tab ID="Tab1" Title="标签一" EnableClose="false" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label5" Text="标签一中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab2" Title="标签二" BodyPadding="10px" EnableClose="true" runat="server">
                    <Items>
                        <f:Label ID="Label4" Text="标签二中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab3" Title="标签三" Hidden="true" BodyPadding="10px" EnableClose="true" runat="server">
                    <Items>
                        <f:Label ID="Label3" Text="标签三中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab4" Title="标签四" BodyPadding="10px" EnableClose="true" runat="server">
                    <Items>
                        <f:Label ID="Label2" Text="标签四中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab5" EnableClose="true" Title="标签五" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label1" Text="标签五中的文本" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <br />
        <f:Button ID="btnShowInClient" Text="显示标签三（客户端代码）" CssClass="marginr"
 runat="server" ClickHandler="onShowInClientClick">
        </f:Button>
        <f:Button ID="btnShowActiveInClient" Text="显示并激活标签三（客户端代码）" CssClass="marginr"
 runat="server" ClickHandler="onShowActiveInClientClick">
        </f:Button>
        <f:Button ID="btnHideInClient" Text="隐藏标签三（客户端代码）" runat="server" ClickHandler="onHideInClientClick">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnShowInServer" Text="显示标签三（服务端代码）" CssClass="marginr"
            runat="server" OnClick="btnShowInServer_Click">
        </f:Button>
        <f:Button ID="btnShowActiveInServer" Text="显示并激活标签三（服务端代码）" CssClass="marginr"
            runat="server" OnClick="btnShowActiveInServer_Click">
        </f:Button>
        <f:Button ID="btnHideInServer" Text="隐藏标签三（服务端代码）" runat="server" OnClick="btnHideInServer_Click">
        </f:Button>
        <br />
        <br />
        <br />
        <f:Button ID="btnShowMoveToEnd" Text="显示标签三（客户端代码，移动到尾部）" CssClass="marginr"
 runat="server" ClickHandler="onShowMoveToEndClick">
        </f:Button>
        <f:Button ID="btnShowActiveMoveToEnd" Text="显示并激活标签三（客户端代码，移动到尾部）" CssClass="marginr"
 runat="server" ClickHandler="onShowActiveMoveToEndClick">
        </f:Button>
        <br />
    </form>
    <script>

        var Tab3ClientID = '<%= Tab3.ClientID %>';

        function onShowInClientClick(event) {
            F(Tab3ClientID).show();
        }

        function onShowActiveInClientClick(event) {
            F(Tab3ClientID).activate();
        }

        function onHideInClientClick(event) {
            F(Tab3ClientID).hide();
        }

        function onShowMoveToEndClick(event) {
            F(Tab3ClientID).show(true);
        }

        function onShowActiveMoveToEndClick(event) {
            F(Tab3ClientID).activate(true);
        }

    </script>
</body>
</html>
