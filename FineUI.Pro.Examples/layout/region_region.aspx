<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="region_region.aspx.cs" Inherits="FineUI.Pro.Examples.layout.region_region" %>

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
                <f:Panel runat="server" ID="panelLeftRegion" RegionPosition="Left" RegionSplit="true" EnableCollapse="true"
                    Width="200px" Title="左侧面板" ShowBorder="true" ShowHeader="true"
                    BodyPadding="10px">
                    <Items>
                        <f:Label ID="Label2" runat="server" Text="左侧面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" RegionPosition="Center"
                    ShowBorder="false" ShowHeader="false" Layout="Fit">
                    <Items>
                        <f:Panel ID="Panel2" runat="server" ShowBorder="false" ShowHeader="false" Layout="Region">
                            <Items>
                                <f:Panel runat="server" ID="panel3" RegionPosition="Left" RegionSplit="true" EnableCollapse="true"
                                    Width="200px" Title="左侧面板" ShowBorder="true" ShowHeader="true"
                                    BodyPadding="10px">
                                    <Items>
                                        <f:Label ID="Label1" runat="server" Text="左侧面板的内容">
                                        </f:Label>
                                    </Items>
                                </f:Panel>
                                <f:Panel ID="Panel4" runat="server" RegionPosition="Center"
                                    ShowBorder="false" ShowHeader="false" Layout="Fit">
                                    <Items>
                                        <f:Panel ID="Panel5" runat="server" ShowBorder="false" ShowHeader="false" Layout="Region">
                                            <Items>
                                                <f:Panel runat="server" ID="panel6" RegionPosition="Left" RegionSplit="true" EnableCollapse="true"
                                                    Width="200px" Title="左侧面板" ShowBorder="true" ShowHeader="true"
                                                    BodyPadding="10px">
                                                    <Items>
                                                        <f:Label ID="Label3" runat="server" Text="左侧面板的内容">
                                                        </f:Label>
                                                    </Items>
                                                </f:Panel>
                                                <f:Panel runat="server" ID="panel7" RegionPosition="Center"
                                                    Title="中间面板" ShowBorder="true" ShowHeader="true" BodyPadding="10px">
                                                    <Items>
                                                        <f:Label ID="Label4" runat="server" Text="中间面板的内容">
                                                        </f:Label>
                                                    </Items>
                                                </f:Panel>
                                            </Items>
                                        </f:Panel>
                                    </Items>
                                </f:Panel>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
