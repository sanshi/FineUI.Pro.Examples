<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkboxfield_rowcheckall_contextmenu.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkboxfield_rowcheckall_contextmenu" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            runat="server">
            <Columns>
                <f:RowNumberField />
                <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" DataFormatString="{0}"
                    HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校1" />
                <f:CheckBoxField ColumnID="CheckBoxField1" RenderAsStaticField="false"
                    DataField="AtSchool" HeaderText="是否在校1" />
                <f:CheckBoxField ColumnID="CheckBoxField2" RenderAsStaticField="false"
                    DataField="AtSchool" HeaderText="是否在校2" />
                <f:CheckBoxField ColumnID="CheckBoxField3" RenderAsStaticField="false"
                    DataField="AtSchool" HeaderText="是否在校3" />
            </Columns>
            <Listeners>
                <f:Listener Event="beforerowcontextmenu" Handler="onRowContextMenu" />
            </Listeners>
        </f:Grid>
        <f:Menu ID="Menu1" runat="server">
            <f:MenuButton ID="btnSelectRows" runat="server" Text="全选行" ClickHandler="onSelectRows"></f:MenuButton>
            <f:MenuButton ID="btnUnselectRows" runat="server" Text="取消行" ClickHandler="onUnselectRows"></f:MenuButton>
        </f:Menu>
        <br />
        选中一些行，然后点击鼠标右键。
        <br />
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行复选框的状态" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>

    <script>

        var menuID = '<%= Menu1.ClientID %>';

        // 返回false，来阻止浏览器右键菜单
        function onRowContextMenu(event, rowId) {
            F(menuID).show();  //showAt(event.pageX, event.pageY);
            return false;
        }

        function onSelectRows(event) {
            $('.f-grid-row-selected .f-grid-checkbox').addClass('f-checked');
        }

        function onUnselectRows(event) {
            $('.f-grid-row-selected .f-grid-checkbox').removeClass('f-checked');
        }

    </script>
</body>
</html>
