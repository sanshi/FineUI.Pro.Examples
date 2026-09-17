<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkall.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkall" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            runat="server" EnableCheckBoxSelect="true" DataKeyNames="Id,Name">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}" UrlEncode="true"
                    Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
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
        注：表格默认选中了第 5， 10 行。
        <br />
    </form>
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
