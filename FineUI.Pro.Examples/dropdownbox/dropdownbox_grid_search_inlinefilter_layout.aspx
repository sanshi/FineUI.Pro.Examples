<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_search_inlinefilter_layout.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_search_inlinefilter_layout" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="下拉表格（下拉列表过滤，表头菜单过滤）"
            ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择" EnableMultiSelect="true" MatchFieldWidth="false" DataControlID="Grid1">
                    <PopPanel>
                        <f:Panel ID="Panel1" Width="650px" Height="300px" ShowHeader="false" ShowBorder="false" Hidden="true" Layout="Fit" runat="server">
                            <Items>
                                <f:Grid ID="Grid1" DataIDField="Id" DataTextField="Name" EnableMultiSelect="true" KeepCurrentSelection="true" PageSize="10"
                                    ShowBorder="true" ShowHeader="false" AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true"
                                    OnPageIndexChanged="Grid1_PageIndexChanged" AllowSorting="true" SortField="Name" SortDirection="ASC" OnSort="Grid1_Sort"
                                    AllowFilters="true" InlineFilters="true" OnFilterChanged="Grid1_FilterChanged">
                                    <Columns>
                                        <f:RowNumberField />
                                        <f:BoundField DataField="Name" SortField="Name" DataFormatString="{0}" HeaderText="姓名" />
                                        <f:TemplateField ColumnID="Gender" SortField="Gender" HeaderText="性别">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                                            </ItemTemplate>
                                        </f:TemplateField>
                                        <f:BoundField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                                        <f:CheckBoxField SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                                        <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" ColumnID="Major" DataField="Major" HeaderText="所学专业"
                                            EnableFilter="true">
                                            <Filter>
                                                <Operator>
                                                    <f:DropDownList ID="DropDownList1" runat="server">
                                                        <f:ListItem Text="等于" Value="equal" />
                                                        <f:ListItem Text="包含" Value="contain" Selected="true" />
                                                        <f:ListItem Text="开始于" Value="start" />
                                                        <f:ListItem Text="结束于" Value="end" />
                                                    </f:DropDownList>
                                                </Operator>
                                            </Filter>
                                        </f:BoundField>
                                        <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                                            HeaderText="分组" />
                                    </Columns>
                                    <Toolbars>
                                        <f:Toolbar runat="server" Position="Top">
                                            <Items>
                                                <f:Label runat="server" Text="是否在校："></f:Label>
                                                <f:DropDownList ID="ddlAtSchool" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" runat="server">
                                                    <f:ListItem Text="全部" Value="-1" />
                                                    <f:ListItem Text="在校" Value="1" />
                                                    <f:ListItem Text="离校" Value="0" />
                                                </f:DropDownList>
                                            </Items>
                                        </f:Toolbar>
                                    </Toolbars>
                                </f:Grid>
                            </Items>
                        </f:Panel>

                    </PopPanel>
                </f:DropDownBox>
                <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
    </form>
</body>
</html>
