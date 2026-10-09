<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_lockcolumn_groupfield.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridrowheight.grid_lockcolumn_groupfield" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格（行高固定）" EnableCollapse="false" AllowColumnLocking="true" AllowSorting="true"
            SortField="TotalScore" SortDirection="DESC" runat="server" EnableCheckBoxSelect="true" OnSort="Grid1_Sort" FixedRowHeight="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField EnableLock="true" Locked="true" SortField="Name" DataField="Name" HeaderTextRawHtml="姓名<br>（测试换行）" />
                <f:RenderField ColumnID="Gender" EnableLock="true" SortField="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:GroupField EnableLock="true" HeaderText="考试成绩" TextAlign="Center">
                    <Columns>
                        <f:RenderField EnableLock="true" DataField="ChineseScore" SortField="ChineseScore" HeaderText="语文成绩" TextAlign="Center" />
                        <f:RenderField EnableLock="true" DataField="MathScore" SortField="MathScore" HeaderText="数学成绩" TextAlign="Center" />
                        <f:RenderField EnableLock="true" DataField="TotalScore" SortField="TotalScore" HeaderText="总成绩" TextAlign="Center" />
                    </Columns>
                </f:GroupField>
                <f:RenderField EnableLock="true" SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField EnableLock="true" SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField EnableLock="true" Width="800px" SortField="Major" DataField="Major" HeaderText="所学专业" />
            </Columns>
        </f:Grid>

        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
