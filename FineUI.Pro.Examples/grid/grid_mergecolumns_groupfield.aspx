<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_mergecolumns_groupfield.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_mergecolumns_groupfield" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            EnableColumnLines="true">
            <Columns>
                <f:RowNumberField />
                <f:GroupField ColumnID="BasicInfo" HeaderText="基本信息" HeaderTextAlign="Center">
                    <Columns>
                        <f:BoundField ColumnID="Name" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                        <f:TemplateField ColumnID="Gender" HeaderText="性别">
                            <ItemTemplate>
                                <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                                <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                                <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                            </ItemTemplate>
                        </f:TemplateField>
                    </Columns>
                </f:GroupField>
                <f:GroupField ColumnID="SchoolInfo" HeaderText="在校信息" HeaderTextAlign="Center">
                    <Columns>
                        <f:BoundField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                        <f:CheckBoxField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                        <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" ColumnID="Major" DataField="Major" HeaderText="所学专业" />
                    </Columns>
                </f:GroupField>
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:BoundField ColumnID="LogTime" DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="注册日期" />
            </Columns>
            <Listeners>
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        注：多表头单元格合并的是最底层的列！
    </form>
    <script>
        function onGridDataLoad(event) {
            this.mergeColumns(['Gender', 'Major', 'Group']);
        }
    </script>
</body>
</html>
