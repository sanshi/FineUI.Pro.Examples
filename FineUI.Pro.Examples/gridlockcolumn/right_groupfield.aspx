<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="right_groupfield.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridlockcolumn.right_groupfield" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" Width="1000px" EnableCollapse="false" AllowColumnLocking="true" ColumnLockingRight="true"
            AllowSorting="true" SortField="TotalScore" SortDirection="DESC" runat="server" EnableCheckBoxSelect="true" OnSort="Grid1_Sort">
            <Columns>
                <f:RowNumberField />
                <f:RenderField EnableLock="true" Locked="true" SortField="Name" DataField="Name" HeaderTextRawHtml="姓名<br>（测试换行）" />
                <f:RenderField ColumnID="Gender" EnableLock="true" SortField="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:GroupField EnableLock="true" HeaderText="考试成绩" TextAlign="Center">
                    <Columns>
                        <f:RenderField EnableLock="true" DataField="ChineseScore" SortField="ChineseScore" HeaderText="语文成绩" TextAlign="Center" />
                        <f:RenderField EnableLock="true" Locked="true" LockedPosition="Right" DataField="MathScore" SortField="MathScore" HeaderText="数学成绩"
                            TextAlign="Center" />
                        <f:RenderField EnableLock="true" DataField="TotalScore" SortField="TotalScore" HeaderText="总成绩" TextAlign="Center" />
                    </Columns>
                </f:GroupField>
                <f:RenderField EnableLock="true" SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField EnableLock="true" SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField EnableLock="true" Width="800px" SortField="Major" DataField="Major" HeaderText="所学专业" />
                <f:RenderField EnableLock="true" DataField="ShenGao" ColumnID="ShenGao" HeaderText="身高" />
                <f:RenderField EnableLock="true" DataField="TiZhong" ColumnID="TiZhong" HeaderText="体重" />
                <f:RenderField EnableLock="true" DataField="XueYaDi" ColumnID="XueYaDi" HeaderText="血压（低）" />
                <f:RenderField EnableLock="true" DataField="XueYaGao" ColumnID="XueYaGao" HeaderText="血压（高）" />
                <f:RenderField EnableLock="true" DataField="ShiLiZuo" ColumnID="ShiLiZuo" HeaderText="视力（左）" />
                <f:RenderField EnableLock="true" DataField="ShiLiYou" ColumnID="ShiLiYou" HeaderText="视力（右）" />
                <f:RenderField ColumnID="Group" EnableLock="true" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField EnableLock="true" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>

        <br />
        <br />
        注：当分组表头的某一列变成锁定列时，则该分组表头中的其他列都会自动变成锁定列。
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
