<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_selectfromwindow_iframe.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_selectfromwindow_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Grid1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" ShowBorder="true" ShowHeader="false" Title="表格" runat="server" EnableCollapse="false"
            DataKeyNames="Id" EnableCheckBoxSelect="true" EnableMultiSelect="false"
            EnableRowDoubleClickEvent="true" OnRowDoubleClick="Grid1_RowDoubleClick">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:BoundField DataField="EntranceDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="入学日期" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:BoundField DataToolTipField="Major" DataField="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" />
            </Columns>
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:Button ID="btnClose" Text="关闭" runat="server" Icon="SystemClose" ClickHandler="onCloseClick">
                        </f:Button>
                        <f:Button ID="btnSaveClose" Text="选择后关闭" runat="server" Icon="SystemSaveClose" OnClick="btnSaveClose_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Grid>
        <br />
        <br />
    </form>
    <script>

        function onCloseClick(event) {
            F.activeWindow.hide();
        }

    </script>
</body>
</html>
