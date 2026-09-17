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
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格（行高固定）" EnableCollapse="false" AllowColumnLocking="true"
            AllowSorting="true" SortField="TotalScore" SortDirection="DESC"
            runat="server" EnableCheckBoxSelect="true"
            OnSort="Grid1_Sort" FixedRowHeight="true">
            <Columns>
                <f:RowNumberField />
                <f:BoundField EnableLock="true" Locked="true" SortField="Name" DataField="Name" DataFormatString="{0}"
                    HeaderTextRawHtml="姓名<br>（测试换行）" />
                <f:TemplateField ColumnID="Gender" EnableLock="true" SortField="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:GroupField EnableLock="true" HeaderText="考试成绩" TextAlign="Center">
                    <Columns>
                        <f:BoundField EnableLock="true" DataField="ChineseScore" SortField="ChineseScore" HeaderText="语文成绩"
                            TextAlign="Center" />
                        <f:BoundField EnableLock="true" DataField="MathScore" SortField="MathScore" HeaderText="数学成绩"
                            TextAlign="Center" />
                        <f:BoundField EnableLock="true" DataField="TotalScore" SortField="TotalScore" HeaderText="总成绩"
                            TextAlign="Center" />
                    </Columns>
                </f:GroupField>
                <f:BoundField EnableLock="true" SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField EnableLock="true" SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:BoundField EnableLock="true" Width="800px" SortField="Major" DataField="Major" HeaderText="所学专业" />
            </Columns>
        </f:Grid>

        <br />
        <br />
    </form>
</body>
</html>
