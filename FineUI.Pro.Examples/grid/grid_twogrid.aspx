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
                <f:Region ID="Region1" ShowBorder="false" ShowHeader="false" RegionPosition="Left" BodyPadding="0 5 0 0" Width="220px" Layout="Fit"
                    runat="server">
                    <Items>
                        <f:Grid DataIDField="Id" ID="Grid2" ShowBorder="true" ShowHeader="true" Title="表格（班级）" runat="server" DataKeyNames="Id,Name"
                            EnableMultiSelect="false" EnableRowSelectEvent="true" OnRowSelect="Grid2_RowSelect" ShowGridHeader="false">
                            <Columns>
                                <f:RowNumberField Width="60px" ColumnID="Number" />
                                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" ColumnID="Name" DataField="Name" HeaderText="姓名" />
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Region>
                <f:Region ID="Region2" ShowBorder="false" ShowHeader="false" Position="Center" Layout="VBox" BoxConfigAlign="Stretch" runat="server">
                    <Items>
                        <f:Panel ShowHeader="false" BodyPadding="10px" ShowBorder="true" runat="server" MarginBottom="5px">
                            <Items>
                                <f:Label ID="labelClassDesc" runat="server">
                                </f:Label>
                                <f:Label ID="Label4" runat="server">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Grid DataIDField="Id" ID="Grid1" BoxFlex="1" ShowBorder="true" ShowHeader="true" Title="表格（学生）" runat="server"
                            DataKeyNames="Id,Name">
                            <Columns>
                                <f:RowNumberField Width="60px" ColumnID="Number" />
                                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
                                    RendererFunction="renderMajor" />
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Region>
            </Regions>
        </f:RegionPanel>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
