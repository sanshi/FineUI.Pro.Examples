<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_expandondblclick.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_expandondblclick" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false"
            DataKeyNames="Id,Name"
            EnableTree="true" TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId"
            EnableRowDoubleClickEvent="true" OnRowDoubleClick="Grid1_RowDoubleClick" TreeExpandOnDblClick="false" >
            <Columns>
                <f:RowNumberField />
                <f:BoundField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:BoundField Width="150px" DataField="Type" HeaderText="类型" />
                <f:BoundField Width="150px" DataField="Size" HeaderText="大小" />
                <f:BoundField Width="150px" DataField="ModifyDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="修改日期" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        注：本示例启用了行双击事件（EnableRowDoubleClickEvent），禁用了双击展开树节点（TreeExpandOnDblClick）。
    </form>
</body>
</html>
