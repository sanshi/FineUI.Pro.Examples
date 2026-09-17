<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_paging.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_paging" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉表格（内存分页）" ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择" EnableMultiSelect="true" MatchFieldWidth="false">
                    <PopPanel>
                        <f:Grid ID="Grid1" Width="650px" Hidden="true"
                            DataIDField="Id" DataTextField="Name" EnableMultiSelect="true" KeepCurrentSelection="true"
                            AllowSorting="true" SortField="Name" SortDirection="ASC"
                            PageSize="5" ShowBorder="true" ShowHeader="false" AllowPaging="true" IsDatabasePaging="false"
                            runat="server" EnableCheckBoxSelect="true" OnSort="Grid1_Sort">
                            <Columns>
                                <f:RowNumberField />
                                <f:BoundField SortField="Name" DataField="Name" DataFormatString="{0}"
                                    HeaderText="姓名" />
                                <f:TemplateField ColumnID="Gender" SortField="Gender" HeaderText="性别">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                                    </ItemTemplate>
                                </f:TemplateField>
                                <f:BoundField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                                <f:CheckBoxField SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                                <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" HeaderText="所学专业" />
                                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                            </Columns>
                        </f:Grid>

                    </PopPanel>
                </f:DropDownBox>
                <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
        <br />
        <strong>出于性能考虑，请在实际项目中使用数据库分页（不要使用内存分页）！</strong>
    </form>
</body>
</html>
