<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_twogrid.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_twogrid" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" AutoSizePanelID="RegionPanel1" />
        <f:RegionPanel ID="RegionPanel1" ShowBorder="false" Margin="24px" runat="server">
            <Regions>
                <f:Region ID="Region1" ShowBorder="false" ShowHeader="false" RegionPosition="Left" BodyPadding="0 5 0 0"
                    Width="220px" Layout="Fit" runat="server">
                    <Items>
                        <f:Grid DataIDField="Id" ID="Grid2" ShowBorder="true" ShowHeader="true" Title="表格（班级）" runat="server"
                            DataKeyNames="Id,Name" EnableMultiSelect="false" EnableRowSelectEvent="true" OnRowSelect="Grid2_RowSelect" 
                            ShowGridHeader="false">
                            <Columns>
                                <f:TemplateField Width="60px">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                    </ItemTemplate>
                                </f:TemplateField>
                                <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" ColumnID="Name" DataField="Name" DataFormatString="{0}"
                                    HeaderText="姓名" />
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Region>
                <f:Region ID="Region2" ShowBorder="false" ShowHeader="false" Position="Center"
                    Layout="VBox" BoxConfigAlign="Stretch" runat="server">
                    <Items>
                        <f:Panel ShowHeader="false" BodyPadding="10px" ShowBorder="true" runat="server" MarginBottom="5px">
                            <Items>
                                <f:Label ID="labelClassDesc" runat="server">
                                </f:Label>
                                <f:Label ID="Label4" runat="server">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Grid DataIDField="Id" ID="Grid1" BoxFlex="1" ShowBorder="true" ShowHeader="true" Title="表格（学生）"
                            runat="server" DataKeyNames="Id,Name">
                            <Columns>
                                <f:TemplateField Width="60px">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                    </ItemTemplate>
                                </f:TemplateField>
                                <f:BoundField ColumnID="Name" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                                    <ItemTemplate>
                                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                                    </ItemTemplate>
                                </f:TemplateField>
                                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Region>
            </Regions>
        </f:RegionPanel>
        <br />
        <br />
    </form>
</body>
</html>
