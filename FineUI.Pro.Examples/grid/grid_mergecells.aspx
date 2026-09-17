<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_mergecells.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_mergecells" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            DataIDField="Id" EnableColumnLines="true">
            <Columns>
                <f:RowNumberField />
                <f:BoundField ColumnID="ID" DataField="Id" HeaderText="ID" />
                <f:BoundField ColumnID="Name" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField Hidden="true" ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" ColumnID="Major" DataField="Major" HeaderText="所学专业" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组A" />
                <f:ImageField ColumnID="GroupB" DataImageUrlField="GroupB" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组B" />
                <f:BoundField ColumnID="LogTime" DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="注册日期" />
            </Columns>
            <Listeners>
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        注：单元格合并和行扩展列不能同时存在（行扩展列时表格的每一行都是table结构）！
    </form>
    <script>
        function onGridDataLoad(event) {
            this.mergeCells([{
                rowId: '101',
                columnId: 'EntranceYear',
                rowspan: 3
            }, {
                rowId: '102',
                columnId: 'Major',
                rowspan: 3
            }, {
                rowId: '109',
                columnId: 'Group',
                rowspan: 4,
                colspan: 2
            }]);
        }
    </script>
</body>
</html>
