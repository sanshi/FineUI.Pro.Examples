<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_mergecolumns_lockcolumn_rowheight.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_mergecolumns_lockcolumn_rowheight" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" Height="500px" runat="server" EnableCollapse="false"
            EnableColumnLines="true" AllowColumnLocking="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField Locked="true" EnableLock="true" ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField Locked="true" EnableLock="true" ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField EnableLock="true" ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField EnableLock="true" ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField Width="300px" ExpandUnusedSpace="true" MinWidth="150px" EncodeText="false" ColumnID="Hobby" DataField="Hobby"
                    HeaderText="兴趣爱好" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
            <Listeners>
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        注：由于锁定表格渲染到客户端是两个&lt;table&gt;结构，所以无法跨列合并锁定列和非锁定列。
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onGridDataLoad(event) {
            this.mergeColumns(['EntranceYear', 'AtSchool', 'Hobby', 'Group']);
        }

    </script>
</body>
</html>
