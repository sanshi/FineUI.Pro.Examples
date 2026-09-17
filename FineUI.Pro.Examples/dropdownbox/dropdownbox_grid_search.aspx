<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_search.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_search" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉表格（输入框过滤）" ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择" EnableMultiSelect="true" MatchFieldWidth="false">
                    <PopPanel>
                        <f:Grid ID="Grid1" Width="650px" Height="300px" Hidden="true"
                            DataIDField="Id" DataTextField="Name" EnableMultiSelect="true" KeepCurrentSelection="true"
                            PageSize="10" ShowBorder="true" ShowHeader="false"
                            AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true"
                            OnPageIndexChanged="Grid1_PageIndexChanged"
                            AllowSorting="true" SortField="Name" SortDirection="ASC"
                            OnSort="Grid1_Sort">
                            <Columns>
                                <f:RowNumberField />
                                <f:BoundField DataField="Name" SortField="Name" DataFormatString="{0}"
                                    HeaderText="姓名" />
                                <f:TemplateField ColumnID="Gender" SortField="Gender" HeaderText="性别">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                                    </ItemTemplate>
                                </f:TemplateField>
                                <f:BoundField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                                <f:CheckBoxField SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                                <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" HeaderText="所学专业" />
                                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                            </Columns>
                            <Toolbars>
                                <f:Toolbar runat="server" Position="Top">
                                    <Items>
                                        <f:TwinTriggerBox Width="300px" runat="server" EmptyText="在姓名中查找" ShowLabel="false" ID="ttbSearch"
                                            ShowTrigger1="false" OnTrigger1Click="ttbSearch_Trigger1Click" OnTrigger2Click="ttbSearch_Trigger2Click"
                                            Trigger1Icon="Clear" Trigger2Icon="Search">
                                        </f:TwinTriggerBox>
                                    </Items>
                                </f:Toolbar>
                            </Toolbars>
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
    </form>
</body>
</html>
