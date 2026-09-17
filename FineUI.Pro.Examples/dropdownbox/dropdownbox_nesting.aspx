<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_nesting.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_nesting" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="下拉框嵌套"
            ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择" DataControlID="Grid1" MatchFieldWidth="false">
                    <PopPanel>
                        <f:Panel ID="Panel1" Width="550px" Height="300px" ShowHeader="false" BodyPadding="5" Layout="VBox" Hidden="true" runat="server">
                            <Items>
                                <f:Form runat="server" LabelWidth="50px" LabelAlign="Right" ShowBorder="false" ShowHeader="false">
                                    <Rows>
                                        <f:FormRow ColumnWidths="150px 100%" runat="server">
                                            <Items>
                                                <f:DropDownList Label="性别" EmptyText="请选择" runat="server" ID="ddlGender" AutoSelectFirstItem="false"
                                                    AutoShowClearIcon="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                    <f:ListItem Text="男" Value="1" />
                                                    <f:ListItem Text="女" Value="0" />
                                                </f:DropDownList>
                                                <f:DropDownBox Label="专业" EmptyText="请选择" runat="server" ID="ddbMajor" DataControlID="CheckBoxList1"
                                                    MatchFieldWidth="true" EnableMultiSelect="true" AutoShowClearIcon="true"
                                                    OnTextChanged="DropDownBox2_TextChanged">
                                                    <PopPanel>
                                                        <f:SimpleForm ID="SimpleForm2" BodyPadding="10px" runat="server" AutoScroll="true" ShowBorder="true"
                                                            ShowHeader="false" Hidden="true">
                                                            <Items>
                                                                <f:Label ID="Label1" runat="server" Text="请选择专业："></f:Label>
                                                                <f:CheckBoxList ID="CheckBoxList1" ColumnNumber="2" runat="server">
                                                                    <f:CheckItem Text="化学系" Value="化学系" />
                                                                    <f:CheckItem Text="数学系" Value="数学系" />
                                                                    <f:CheckItem Text="物理系" Value="物理系" />
                                                                    <f:CheckItem Text="自动化系" Value="自动化系" />
                                                                    <f:CheckItem Text="材料科学与工程系" Value="材料科学与工程系" />
                                                                </f:CheckBoxList>
                                                            </Items>
                                                        </f:SimpleForm>
                                                    </PopPanel>
                                                </f:DropDownBox>
                                            </Items>
                                        </f:FormRow>
                                    </Rows>
                                </f:Form>
                                <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" runat="server" DataIDField="Id" DataTextField="Name" BoxFlex="1"
                                    EnableMultiSelect="false">
                                    <Columns>
                                        <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                                        <f:TemplateField ColumnID="Gender" HeaderText="性别">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                                            </ItemTemplate>
                                        </f:TemplateField>
                                        <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" HeaderText="所学专业" />
                                    </Columns>
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
