<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accordion_tools.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.accordion.accordion_tools" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-tool.mybadge {
            opacity: 1.0;
            filter: alpha(opacity=100);
        }

        .f-tool.mybadge .f-tool-text {
            padding: 0 4px;
            color: #fff;
            text-align: center;
            white-space: nowrap;
            background-color: #d15b47;
            font-size: 14px;
            border-radius: 12px;
            min-width: 24px;
        }


        .f-tool.mybadge-sub {
            opacity: 0.7;
            filter: alpha(opacity=70);
        }
        .f-tool.mybadge-sub .f-tool-text {
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Accordion1" runat="server" />
        <f:Accordion ID="Accordion1" runat="server" ShowHeader="false" ShowBorder="false" 
            ActivePaneIndex="1" ShowCollapseTool="false">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" Title="手风琴控件" HeaderStyle="true">
                </f:Toolbar>
            </Toolbars>
            <Panes>
                <f:AccordionPane ID="AccordionPane1" runat="server" Title="面板一" IconUrl="~/res/images/16/1.png"
                    BodyPadding="2px 5px">
                    <Tools>
                        <f:Tool runat="server" CssClass="mybadge" Text="30"></f:Tool>
                    </Tools>
                    <Items>
                        <f:Label ID="Label1" Text="面板一中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane2" runat="server" Title="面板二（列表）" IconUrl="~/res/images/16/4.png"
                    Layout="Fit">
                    <Tools>
                        <f:Tool ID="Tool1" runat="server" CssClass="mybadge" Text="30/260"></f:Tool>
                    </Tools>
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
                    <Tools>
                        <f:Tool ID="Tool3" runat="server" CssClass="mybadge-sub" Text="简单的文字描述"></f:Tool>
                        <f:Tool ID="Tool2" runat="server" CssClass="mybadge" Text="30/150"></f:Tool>
                    </Tools>
                </f:AccordionPane>
            </Panes>
        </f:Accordion>
    </form>
</body>
</html>
