<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="card_switch_avatar.aspx.cs" Inherits="FineUI.Pro.Examples.gridcard.card_switch_avatar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/js/gridcard.js" />
    <link type="text/css" rel="stylesheet" href="../res/css/gridcard.css" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" EnableCheckBoxSelect="true"
            DataIDField="Id" DisplayType="Card" CardRendererFunction="renderCardWithAvatar" DataAttributeFields="Name,Gender,Avatar,EntranceYear,Status">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:ToolbarFill runat="server"></f:ToolbarFill>
                        <f:Button IconFont="_Table" ID="btnDisplayDefault" EnablePress="true" Pressed="false" runat="server" ClickHandler="onDisplayDefaultClick"></f:Button>
                        <f:Button IconFont="_Gallery" ID="btnDisplayCard" EnablePress="true" Pressed="true" runat="server" ClickHandler="onDisplayCardClick"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="UserProfile" Width="250" RendererFunction="renderUserProfile" HeaderText="基本信息"></f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业" />
                <f:RenderField ColumnID="ChineseScore" DataField="ChineseScore" HeaderText="语文成绩" />
                <f:RenderField ColumnID="MathScore" DataField="MathScore" HeaderText="数学成绩" />
                <f:RenderField ColumnID="TotalScore" DataField="TotalScore" HeaderText="总成绩" />
                <f:RenderField ColumnID="Status" DataField="Status" RendererFunction="renderStatus" HeaderText="状态" />
            </Columns>
        </f:Grid>
    </form>
    <script src="../res/js/grid.js"></script>
    <script src="../res/js/gridcard.js"></script>
    <script>

        var Grid1ClientID = '<%= Grid1.ClientID %>';
        var btnDisplayDefaultClientID = '<%= btnDisplayDefault.ClientID %>';
        var btnDisplayCardClientID = '<%= btnDisplayCard.ClientID %>';

        function onDisplayDefaultClick(event) {
            F(btnDisplayDefaultClientID).setPressed(true);
            F(btnDisplayCardClientID).setPressed(false);

            F(Grid1ClientID).setDisplayType('default');
        }
        function onDisplayCardClick(event) {
            F(btnDisplayDefaultClientID).setPressed(false);
            F(btnDisplayCardClientID).setPressed(true);

            F(Grid1ClientID).setDisplayType('card');
        }

    </script>
</body>
</html>
