<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="region.aspx.cs" Inherits="FineUI.Pro.Examples.layout.region" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" Margin="24px" runat="server" ShowBorder="false" ShowHeader="false" Layout="Region">
            <Items>
                <f:Panel runat="server" ID="panelTopRegion" RegionPosition="Top" RegionSplit="true" EnableCollapse="true"
                    Title="顶部面板" ShowBorder="true" ShowHeader="true" BodyPadding="10px" IconFont="_PullUp" Collapsed="true">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="顶部面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelLeftRegion" RegionPosition="Left" RegionSplit="true" EnableCollapse="true"
                    Width="250px" Title="左侧面板（有提示信息）" TitleToolTip="左侧面板（有提示信息）" ShowBorder="true" ShowHeader="true" 
                    BodyPadding="10px" IconFont="_PullLeft" Collapsed="true">
                    <Items>
                        <f:Label ID="Label2" runat="server" Text="左侧面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelCenterRegion" RegionPosition="Center" AutoScroll="true"
                    Title="中间面板" ShowBorder="true" ShowHeader="true" BodyPadding="10px" IconFont="_RoundPlus">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="中间面板的内容">
                        </f:Label>
                        <f:Label ID="Label6" runat="server">
                        </f:Label>
                        <f:Button ID="Button4" Text="更新左侧面板的标题" runat="server" OnClick="Button4_Click">
                        </f:Button>
                        <f:Label ID="Label7" runat="server">
                        </f:Label>
                        <f:Button ID="btnHideBottomRegion" Text="隐藏/显示底部面板" runat="server" OnClick="btnHideBottomRegion_Click">
                        </f:Button>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelRightRegion" RegionPosition="Right" RegionSplit="true" EnableCollapse="true"
                    Width="200px" Title="右侧面板" ShowBorder="true" ShowHeader="true" BodyPadding="10px" IconFont="_PullRight">
                    <Items>
                        <f:Label ID="Label4" runat="server" Text="右侧面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelBottomRegion" RegionPosition="Bottom" RegionSplit="true" EnableCollapse="true" Height="100px"
                    Title="底部面板" ShowBorder="true" ShowHeader="true" BodyPadding="10px" IconFont="_PullDown">
                    <Items>
                        <f:Label ID="Label5" runat="server" Text="底部面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
