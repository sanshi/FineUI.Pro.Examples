<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="selectprovince3_child.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.selectprovince3_child" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server"></f:PageManager>
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" CssClass="f-widget-content" BodyPadding="10px" runat="server">
            <Items>
                <f:Image runat="server" ID="imgChina" ImageUrl="~/res/images/china.gif">
                </f:Image>
                <f:Label runat="server" EncodeText="false" ID="labNote">
                </f:Label>
            </Items>
        </f:Panel>
        <asp:Label runat="server" ID="labTest"></asp:Label>
        <map id="ChinaMap" name="ChinaMap">
            <area href="javascript:select('014');" coords="398,52,442,72" shape="rect">
            <area href="javascript:select('013');" coords="400,96,433,111" shape="rect">
            <area href="javascript:select('012');" coords="378,117,409,135" shape="rect">
            <area href="javascript:select('001');" coords="329,135,359,149" shape="rect">
            <area href="javascript:select('008');" coords="345,151,370,165" shape="rect">
            <area href="javascript:select('019');" coords="347,179,382,195" shape="rect">
            <area href="javascript:select('009');" coords="395,224,423,242" shape="rect">
            <area href="javascript:select('016');" coords="378,250,410,266" shape="rect">
            <area href="javascript:select('034');" coords="398,287,415,336" shape="rect">
            <area href="javascript:select('032');" coords="350,329,374,343" shape="rect">
            <area href="javascript:select('020');" coords="324,313,350,326" shape="rect">
            <area href="javascript:select('033');" coords="323,339,349,351" shape="rect">
            <area href="javascript:select('002');" coords="311,207,343,223" shape="rect">
            <area href="javascript:select('011');" coords="307,161,321,197" shape="rect">
            <area href="javascript:select('003');" coords="329,157,343,191" shape="rect">
            <area href="javascript:select('030');" coords="259,174,273,202" shape="rect">
            <area href="javascript:select('022');" coords="219,241,254,260" shape="rect">
            <area href="javascript:select('023');" coords="254,282,292,301" shape="rect">
            <area href="javascript:select('027');" coords="163,187,217,207" shape="rect">
            <area href="javascript:select('031');" coords="73,122,124,142" shape="rect">
            <area href="javascript:select('005');" coords="306,238,338,255" shape="rect">
            <area href="javascript:select('004');" coords="296,270,329,286" shape="rect">
            <area href="javascript:select('018');" coords="337,268,365,286" shape="rect">
            <area href="javascript:select('024');" coords="205,308,242,325" shape="rect">
            <area href="javascript:select('006');" coords="271,312,308,332" shape="rect">
            <area href="javascript:select('029');" coords="74,221,140,250" shape="rect">
            <area href="javascript:select('026');" coords="211,158,244,177,266,214,250,219,231,188,204,167,171,162,165,133,191,133,208,156"
                shape="poly">
            <area href="javascript:select('028');" coords="295,126,254,137,268,160,297,155,311,149,352,114,361,101,337,97"
                shape="poly">
            <area href="javascript:select('010');" coords="261,260,264,274,282,267,301,235,285,234,260,257"
                shape="poly">
            <area href="javascript:select('007');" coords="358,211,371,227,380,243,370,253,359,253,352,236,352,216,354,211"
                shape="poly">
            <area href="javascript:select('025');" coords="295,226,298,184,290,171,286,174,285,194,275,220,271,228,295,227"
                shape="poly">
            <area href="javascript:select('015');" coords="368,201,378,201,385,212,393,221,393,230,377,229,371,217,367,202"
                shape="poly">
            <area href="javascript:select('017');" coords="375,313,393,275,373,270,355,299,374,312"
                shape="poly">
            <area href="javascript:select('021');" coords="286,361,313,379" shape="rect">
        </map>
    </form>
    <script>
        var imgClientID = '<%= imgChina.ClientID %>';

        function select(provinceCode) {
            F.customEvent('SelectProvince', provinceCode);
        }

    </script>
</body>
</html>
