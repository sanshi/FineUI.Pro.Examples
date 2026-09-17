<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="region_regionpercent.aspx.cs" Inherits="FineUI.Pro.Examples.layout.region_regionpercent" %>

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
                <f:Panel runat="server" ID="panelTopRegion" RegionPosition="Top" RegionSplit="true" EnableCollapse="true" RegionPercent="20%"
                    Title="顶部面板" ShowBorder="true" ShowHeader="false" BodyPadding="10px" IconFont="_PullUp">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="顶部面板的内容（RegionPercent=20%）">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelLeftRegion" RegionPosition="Left" RegionSplit="true" EnableCollapse="true"
                    RegionPercent="30%" Title="左侧面板（有提示信息）" TitleToolTip="左侧面板（有提示信息）" ShowBorder="true" ShowHeader="false"
                    BodyPadding="10px" IconFont="_PullLeft">
                    <Items>
                        <f:Label ID="Label2" runat="server" EncodeText="false" Text="左侧面板的内容<br>（RegionPercent=30%）">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelCenterRegion" RegionPosition="Center"
                    Title="中间面板" ShowBorder="true" ShowHeader="false" BodyPadding="10px" IconFont="_RoundPlus">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="中间面板的内容">
                        </f:Label>
                        <f:Label ID="Label6" runat="server">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelRightRegion" RegionPosition="Right" RegionSplit="true" EnableCollapse="true"
                    RegionPercent="30%" Title="右侧面板" ShowBorder="true" ShowHeader="false" BodyPadding="10px" IconFont="_PullRight">
                    <Items>
                        <f:Label ID="Label4" runat="server" EncodeText="false" Text="右侧面板的内容<br>（RegionPercent=30%）">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelBottomRegion" RegionPosition="Bottom" RegionSplit="true" EnableCollapse="true" RegionPercent="20%"
                    Title="底部面板" ShowBorder="true" ShowHeader="false" BodyPadding="10px" IconFont="_PullDown">
                    <Items>
                        <f:Label ID="Label5" runat="server" Text="底部面板的内容（RegionPercent=20%）">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
