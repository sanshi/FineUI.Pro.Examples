<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_notitle.aspx.cs" Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_notitle" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="150px" ShowBorder="true" TabPosition="Top" ActiveTabIndex="0"
            runat="server">
            <Tabs>
                <f:Tab IconFont="_Windows" TitleToolTip="标签一的提示文本" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Icon="Accept" TitleToolTip="标签二的提示文本" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab IconFont="_Apple" TitleToolTip="标签三的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Icon="Clock" TitleToolTip="标签四的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab IconFont="_Android" TitleToolTip="标签五的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第五个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Icon="Computer" TitleToolTip="标签六的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第六个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab IconFont="_Google" TitleToolTip="标签七的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第七个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <br />
        <f:TabStrip ID="TabStrip2" IsFluid="true" Height="150px" ShowBorder="true" TabPosition="Bottom" ActiveTabIndex="3"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab1" IconFont="_Windows" TitleToolTip="标签一的提示文本" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label1" Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab2" Icon="Accept" TitleToolTip="标签二的提示文本" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label2" Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab3" IconFont="_Apple" TitleToolTip="标签三的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label3" Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab4" Icon="Clock" TitleToolTip="标签四的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label4" Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab5" IconFont="_Android" TitleToolTip="标签五的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label5" Text="第五个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab6" Icon="Computer" TitleToolTip="标签六的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label6" Text="第六个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab7" IconFont="_Google" TitleToolTip="标签七的提示文本" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label7" Text="第七个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <br />
        注：
        <ul>
            <li>选项卡的标题栏文本为空</li>
            <li>选项卡标题栏有提示信息</li>
        </ul>
    </form>
</body>
</html>
