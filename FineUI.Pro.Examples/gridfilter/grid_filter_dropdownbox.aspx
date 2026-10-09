<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_filter_dropdownbox.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_filter_dropdownbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/Code/NewFilteredTable.cs" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            AllowFilters="true" OnFilterChanged="Grid1_FilterChanged">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" EnableFilter="true" DataField="Major"
                    RendererFunction="renderMajor">
                    <Filter>
                        <Field>
                            <f:DropDownBox runat="server" EmptyText="请从下拉表格中选择" EnableMultiSelect="true" MatchFieldWidth="false">
                                <PopPanel>
                                    <f:Grid ID="Grid2" ShowBorder="true" ShowHeader="false" runat="server" Width="550px" Height="300px" Hidden="true"
                                        EnableHeaderMenu="false" DataIDField="Name" DataTextField="Name" EnableMultiSelect="true" KeepCurrentSelection="true"
                                        EnableCheckBoxSelect="true">
                                        <Columns>
                                            <f:RowNumberField />
                                            <f:RenderField DataField="Name" HeaderText="专业名称" ExpandUnusedSpace="true" MinWidth="150px" />
                                        </Columns>
                                    </f:Grid>
                                </PopPanel>
                            </f:DropDownBox>
                        </Field>
                    </Filter>
                </f:RenderField>
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="LogTime" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Label runat="server" ID="labResult" EncodeText="false"></f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
