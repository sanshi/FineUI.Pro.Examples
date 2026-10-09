<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_clearselectionbeforepaging_database.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_clearselectionbeforepaging_database" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Title="表格（跨页选中行）" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true" AllowPaging="true"
            IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged" DataTextField="Name"
            KeepCurrentSelection="true" DataIDField="Id" ClearSelectionBeforePaging="false" ClearSelectionBeforeBinding="false" KeepPagedSelection="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行的ID列表" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：
        <ul>
            <li>注意设置属性：
                <ul>
                    <li>DataIDField=Id：行标识符字段</li>
                    <li>ClearSelectionBeforeBinding=false：数据绑定前清空选中项（服务端，数据库分页事件中需要重新绑定数据）</li>
                    <li>ClearSelectionBeforePaging=false：分页前清空选中项（客户端）</li>
                    <li>KeepPagedSelection=true：多选时保持分页中已选中行（客户端）</li>
                    <li>KeepCurrentSelection=true：多选时保持当前已选中行（客户端）</li>
                </ul>
            </li>
            <li>SelectedRowIndexArray属性已废弃；跨页保持选中项请使用稳定的SelectedRowIDArray属性。</li>
        </ul>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
