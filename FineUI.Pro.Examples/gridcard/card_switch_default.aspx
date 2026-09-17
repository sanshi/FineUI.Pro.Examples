<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="card_switch_default.aspx.cs" Inherits="FineUI.Pro.Examples.gridcard.card_switch_default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/js/gridcard.js" />
    <style>
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            DataIDField="Id" Height="500px" DisplayType="Default" CardRendererFunction="renderCard">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:ToolbarFill runat="server"></f:ToolbarFill>
                        <f:Button IconFont="_Table" ID="btnDisplayDefault" EnablePress="true" Pressed="true" runat="server" ClickHandler="onDisplayDefaultClick"></f:Button>
                        <f:Button IconFont="_Gallery" ID="btnDisplayCard" EnablePress="true" Pressed="false" runat="server" ClickHandler="onDisplayCardClick"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名"></f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别"></f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份"></f:RenderField>
                <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date"
                    Renderer="Date" RendererArgument="yyyy/MM/dd" HeaderText="入学日期">
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校"></f:RenderCheckField>
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业"></f:RenderField>
            </Columns>
        </f:Grid>
    </form>
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
