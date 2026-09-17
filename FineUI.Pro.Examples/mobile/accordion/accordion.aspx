<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accordion.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.accordion.accordion" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Accordion1" runat="server" />
        <f:Accordion ID="Accordion1" runat="server" ShowHeader="false" ShowBorder="false" ActivePaneIndex="1">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" Title="手风琴控件" HeaderStyle="true">
                </f:Toolbar>
            </Toolbars>
            <Panes>
                <f:AccordionPane ID="AccordionPane1" runat="server" Title="面板一" IconUrl="~/res/images/16/1.png"
                    BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label1" Text="面板一中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane2" runat="server" Title="面板二（列表）" IconUrl="~/res/images/16/4.png"
                    Layout="Fit">
                    <Items>
                        <f:DataList runat="server" ID="DataList1">
                            <f:DataListItem Text="列表项1" />
                            <f:DataListItem Text="列表项2" />
                            <f:DataListItem Text="列表项3" />
                            <f:DataListItem Text="列表项4" />
                            <f:DataListItem Text="列表项5" />
                        </f:DataList>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane3" runat="server" Title="面板三（IFrame）" IconUrl="~/res/images/16/7.png"
                    EnableIFrame="true" IFrameUrl="~/mobile/button/button.aspx">
                </f:AccordionPane>
            </Panes>
        </f:Accordion>
    </form>
</body>
</html>
