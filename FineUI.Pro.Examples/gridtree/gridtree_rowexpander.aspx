<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_rowexpander.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_rowexpander" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Height="500px" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false"
            EnableTree="true" TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId">
            <Columns>
                <f:RowNumberField />
                <f:BoundField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:BoundField Width="150px" DataField="Type" HeaderText="类型" />
                <f:BoundField Width="150px" DataField="Size" HeaderText="大小" />
                <f:BoundField Width="150px" DataField="ModifyDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="修改日期" />
                <f:TemplateField ColumnID="expander" RenderAsRowExpander="true" ExpandOnDoubleClick="false">
                    <ItemTemplate>
                        <div class="expander">
                            <p>
                                <strong>名称：</strong><%# Eval("Name") %>（<%# Eval("Type") %>）
                            </p>
                            <p>
                                <strong>修改日期：</strong><%# Eval("ModifyDate") %>
                            </p>
                        </div>
                    </ItemTemplate>
                </f:TemplateField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        注：行扩展列和树表格同时存在时，需要禁用行扩展列的ExpandOnDblClick属性，以避免与树表格的双击展开节点功能冲突。
    </form>

    <script src="../res/js/grid.js"></script>
</body>
</html>
