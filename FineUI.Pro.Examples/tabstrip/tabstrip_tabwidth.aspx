<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_tabwidth.aspx.cs" Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_tabwidth" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-tab-header.tab-maxwidth {
            max-width: 150px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="350px" ShowBorder="true" TabPosition="Top"
            EnableTabCloseMenu="false" ActiveTabIndex="1" runat="server">
            <Tabs>
                <f:Tab CssClass="tab-maxwidth" Title="标签一（这个标签的标题文字超长，真的很长很长很长很长很长很长很长，非常非常长，够长了吧）"
                    TitleToolTip="标签一（这个标签的标题文字超长，真的很长很长很长很长很长很长很长，非常非常长，够长了吧）" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label1" Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签二，这个标题也很长，但是没有截断" BodyPadding="10px"
                    runat="server">
                    <Items>
                        <f:Label ID="Label2" Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签三" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label3" Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
    </form>
</body>
</html>
