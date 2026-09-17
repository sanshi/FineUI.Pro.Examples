<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_treegrid.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_treegrid" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/griddataurl/griddataurl_treegrid.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" EnableCheckBoxSelect="true"
            runat="server" DataUrl="~/griddataurl/griddataurl_treegrid.ashx"
            EnableTree="true" TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField ColumnID="Type" DataField="Type" HeaderText="类型">
                </f:RenderField>
                <f:RenderField ColumnID="Size" DataField="Size" HeaderText="大小">
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="ModifyDate" DataField="ModifyDate" FieldType="Date"
                    Renderer="Date" RendererArgument="yyyy/MM/dd" HeaderText="修改日期">
                </f:RenderField>
            </Columns>
        </f:Grid>
        
    </form>
    <script src="../res/js/grid.js"></script>
</body>
</html>
