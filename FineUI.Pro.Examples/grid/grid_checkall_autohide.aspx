<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkall_autohide.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkall_autohide" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" DataKeyNames="Id,Name" CheckBoxSelectAutoHide="true">
            <Columns>
                <%--<f:RowNumberField />--%>
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" CssClass="marginr" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="选中第 2, 6, 8 行" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button3" runat="server" Text="选中了哪些行（没选择的话不会回发页面）" OnClick="Button1_Click" ClickHandler="onButton3Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';

        function onButton3Click(event) {
            if (!F(Grid1ClientID).hasSelection()) {
                F.alert({
                    message: '没有选中项！',
                    messageIcon: 'information',
                    target: '_top'
                });
                return false;
            };
        }

    </script>
</body>
</html>
