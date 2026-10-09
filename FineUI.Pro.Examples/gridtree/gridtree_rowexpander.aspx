<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_rowexpander.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_rowexpander" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Height="500px" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false" EnableTree="true"
            TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId" DataAttributeFields="Name,Type">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:RenderField Width="150px" DataField="Type" HeaderText="类型" />
                <f:RenderField Width="150px" DataField="Size" HeaderText="大小" />
                <f:RenderField Width="150px" DataField="ModifyDate" HeaderText="修改日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
                <f:RenderField ColumnID="expander" RenderAsRowExpander="true" DataField="ModifyDate" RendererFunction="renderFileDetails1"
                    ExpandOnDblClick="false" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        注：行扩展列和树表格同时存在时，需要禁用行扩展列的ExpandOnDblClick属性，以避免与树表格的双击展开节点功能冲突。
    </form>

    <script>
        function renderFileDetails1(value, params) {
            var fields = params.rowData.attrs;
            return $('<div>').addClass('expander')
                .append($('<p>').append($('<strong>').text('名称：'), document.createTextNode(fields.Name + '（' + fields.Type + '）')))
                .append($('<p>').append($('<strong>').text('修改日期：'), document.createTextNode(value)));
        }

    </script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
