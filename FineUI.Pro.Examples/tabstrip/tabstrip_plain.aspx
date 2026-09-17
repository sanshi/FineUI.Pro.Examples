<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_plain.aspx.cs" Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_plain" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip4" IsFluid="true" Height="150px" ShowBorder="false" TabBorderColor="true" TabPlain="true" ActiveTabIndex="0"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab10" Title="标签一" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label10" Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab11" Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label11" Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab12" Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label12" Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab13" Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label13" Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip5" IsFluid="true" Height="150px" ShowBorder="true" TabAlign="Center" TabBorderColor="true" TabPlain="true" ActiveTabIndex="1"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab14" Title="标签一" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label14" Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab15" Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label15" Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab16" Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label16" Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab17" Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label17" Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip6" IsFluid="true" Height="150px" ShowBorder="true" TabAlign="Right" TabBorderColor="true" TabPlain="true" ActiveTabIndex="2"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab18" Title="标签一" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label18" Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab19" Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label19" Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab20" Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label20" Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab21" Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label21" Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <br />
        <br />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="150px" TabFill="true" TabBorderColor="true" ShowBorder="true" TabPlain="true" ActiveTabIndex="0"
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
                <f:Tab ID="Tab7" Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label7" Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <br />
        <f:TabStrip ID="TabStrip2" IsFluid="true" Height="150px" TabFill="true" TabSpace="0" TabBorderColor="true" TabPlain="true" ShowBorder="true" ActiveTabIndex="1"
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
        <br />
        <f:TabStrip ID="TabStrip3" IsFluid="true" Height="150px" TabFill="true" TabSpace="-1" TabBorderColor="true" TabPlain="true" ShowBorder="true" ActiveTabIndex="2"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab4" Title="标签一" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label4" Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab5" Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label5" Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab6" Title="标签三" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label6" Text="第三个标签的内容" runat="server" />
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
