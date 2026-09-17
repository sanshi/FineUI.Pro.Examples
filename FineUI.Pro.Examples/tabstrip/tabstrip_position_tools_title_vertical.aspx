<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_position_tools_title_vertical.aspx.cs" Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_position_tools_title_vertical" %>

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
                <f:Tab Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签五" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第五个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签六" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第六个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
				<f:Tab Title="标签七" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第七个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
				<f:Tab Title="标签八" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第八个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
				<f:Tab Title="标签九" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第九个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
            <Tools>
                <f:Tool runat="server" IconFont="_Gear" ToolTip="设置图标一">
                </f:Tool>
                <f:Tool runat="server" IconFont="_Wrench" ToolTip="设置图标二">
                </f:Tool>
            </Tools>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip2" IsFluid="true" Height="150px" ShowBorder="true" TabPosition="Bottom" ActiveTabIndex="0"
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
                <f:Tab Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签五" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第五个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签六" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第六个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
				<f:Tab Title="标签七" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第七个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
				<f:Tab Title="标签八" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第八个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
				<f:Tab Title="标签九" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第九个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
            <Tools>
                <f:Tool runat="server" IconFont="_Gear" ToolTip="设置图标一">
                </f:Tool>
                <f:Tool runat="server" IconFont="_Wrench" ToolTip="设置图标二">
                </f:Tool>
            </Tools>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip3"  IsFluid="true" Height="250px" ShowBorder="true" TabPosition="Left" TabTitleVertical="true" ActiveTabIndex="0"
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
                <f:Tab Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签五" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第五个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签六" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第六个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
            <Tools>
                <f:Tool runat="server" IconFont="_Gear" ToolTip="设置图标一">
                </f:Tool>
                <f:Tool runat="server" IconFont="_Wrench" ToolTip="设置图标二">
                </f:Tool>
            </Tools>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip4"  IsFluid="true" Height="250px" ShowBorder="true" TabPosition="Right" TabTitleVertical="true" ActiveTabIndex="0"
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
                <f:Tab Title="标签四" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第四个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签五" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第五个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签六" EnableClose="true" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label Text="第六个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
            <Tools>
                <f:Tool runat="server" IconFont="_Gear" ToolTip="设置图标一">
                </f:Tool>
                <f:Tool runat="server" IconFont="_Wrench" ToolTip="设置图标二">
                </f:Tool>
            </Tools>
        </f:TabStrip>
        <br />
        <br />
        注：低版本IE浏览器不支持左侧和右侧选项卡。
        <br />
        <br />
    </form>
</body>
</html>
