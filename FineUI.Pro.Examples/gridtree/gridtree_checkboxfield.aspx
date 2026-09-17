<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_checkboxfield.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_checkboxfield" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-cell.hidethis .f-grid-checkbox {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false"
            DataKeyNames="Id,Name"
            EnableTree="true" TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:RowNumberField />
                <f:BoundField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:BoundField Width="150px" DataField="Type" HeaderText="类型" />
                <f:BoundField Width="150px" DataField="Size" HeaderText="大小" />
                <f:CheckBoxField ColumnID="FollowFolder" RenderAsStaticField="false" HeaderText="关注目录" />
                <f:BoundField Width="150px" DataField="ModifyDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="修改日期" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="关注的目录列表" OnClick="Button2_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
</body>
</html>
