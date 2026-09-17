<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_layout_alwaysdisplay_defaultvalue.aspx.cs"
    Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_layout_alwaysdisplay_defaultvalue" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="始终显示弹出面板（初始值）"
            ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下面表格中选择" DataControlID="Grid1" PopPanelID="Panel7" AlwaysDisplayPopPanel="true"
                    EnableMultiSelect="true" MatchFieldWidth="false" AutoShowClearIcon="true" Values="115,105" Texts="董国,吴颖颖">
                </f:DropDownBox>
                <f:Panel ID="Panel7" runat="server" BodyPadding="10px" Height="300px" ShowBorder="true" ShowHeader="false" Layout="VBox" BoxConfigSpace="5">
                    <Items>
                        <f:Form ID="Form5" ShowBorder="false" ShowHeader="false" RemoveLastFieldsMargin="true" runat="server">
                            <Rows>
                                <f:FormRow>
                                    <Items>
                                        <f:TwinTriggerBox Width="300px" runat="server" EmptyText="在姓名中查找" ShowLabel="false" ID="ttbSearch" ShowTrigger1="false"
                                            OnTrigger1Click="ttbSearch_Trigger1Click" OnTrigger2Click="ttbSearch_Trigger2Click" Trigger1Icon="Clear"
                                            Trigger2Icon="Search">
                                        </f:TwinTriggerBox>
                                        <f:RadioButtonList ID="rblAtSchool" Label="是否在校" OnSelectedIndexChanged="rblAtSchool_SelectedIndexChanged"
                                            runat="server">
                                            <f:RadioItem Text="全部" Value="-1" Selected="true" />
                                            <f:RadioItem Text="在校" Value="1" />
                                            <f:RadioItem Text="离校" Value="0" />
                                        </f:RadioButtonList>
                                    </Items>
                                </f:FormRow>
                            </Rows>
                        </f:Form>
                        <f:Grid ID="Grid1" BoxFlex="1" DataIDField="Id" DataTextField="Name" EnableMultiSelect="true" KeepCurrentSelection="true" PageSize="10"
                            ShowBorder="true" ShowHeader="false" AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true"
                            OnPageIndexChanged="Grid1_PageIndexChanged" AllowSorting="true" SortField="Name" SortDirection="ASC" OnSort="Grid1_Sort">
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
                                <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" HeaderText="所学专业" />
                                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Panel>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" CssClass="marginr" runat="server" OnClick="btnGetSelection_Click">
        </f:Button>
        <f:Button ID="btnClearValue" Text="清空下拉框的值" runat="server" OnClick="btnClearValue_Click">
        </f:Button>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
        注：通过 Values 和 Text 属性来设置下拉框的初始值（由于初始值可能不在第一页，所以需要指定 Text 属性）。
    </form>
</body>
</html>
