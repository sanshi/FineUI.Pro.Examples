<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accordion_toomanypane.aspx.cs" Inherits="FineUI.Pro.Examples.accordion.accordion_toomanypane" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Accordion ID="Accordion1" IsFluid="true" Title="手风琴控件" ShowHeader="false" runat="server" Height="260px"
            ShowBorder="true" ActivePaneIndex="1" EnableCollapse="false" EnableFill="false">
            <Panes>
                <f:AccordionPane ID="AccordionPane1" runat="server" Title="面板一" IconUrl="~/res/images/16/1.png"
                    BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label1" Text="面板一中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane2" runat="server" Title="面板二" IconUrl="~/res/images/16/4.png"
                    BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label2" Text="面板二中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane3" runat="server" Title="面板三" IconUrl="~/res/images/16/7.png"
                    BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label3" Text="面板三中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane4" runat="server" Title="面板四" IconUrl="~/res/images/16/1.png"
                    BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label4" Text="面板四中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane5" runat="server" Title="面板五" IconUrl="~/res/images/16/1.png"
                    BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label5" Text="面板五中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane6" runat="server" Title="面板六" IconUrl="~/res/images/16/1.png"
                    BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label6" Text="面板六中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane7" runat="server" Title="面板七" IconUrl="~/res/images/16/1.png"
                    BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label7" Text="面板七中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane8" runat="server" Title="面板八" IconUrl="~/res/images/16/1.png"
                    BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label8" Text="面板八中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
            </Panes>
        </f:Accordion>
        <br />
        <f:Button ID="Button1" Text="获取当前展开的面板" runat="server" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button2" Text="展开下一个面板" runat="server" OnClick="Button2_Click">
        </f:Button>
    </form>
</body>
</html>
