<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_align.aspx.cs" Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_align" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="150px" ShowBorder="true" ActiveTabIndex="0"
            runat="server">
            <Tabs>
                <f:Tab Title="标签一" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab4" Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label4" Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip2" IsFluid="true" Height="150px" ShowBorder="true" TabAlign="Center" ActiveTabIndex="1"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab1" Title="标签一" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label1" Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab2" Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label2" Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab3" Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label3" Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab8" Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label8" Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip3" IsFluid="true" Height="150px" ShowBorder="true" TabAlign="Right" ActiveTabIndex="2"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab5" Title="标签一" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label5" Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab6" Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label6" Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab7" Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label7" Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab9" Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label9" Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
    </form>
</body>
</html>
