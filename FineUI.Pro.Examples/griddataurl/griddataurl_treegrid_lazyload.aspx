<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_treegrid_lazyload.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_treegrid_lazyload" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/griddataurl/griddataurl_treegrid_lazyload.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" EnableCheckBoxSelect="true"
            runat="server" DataUrl="~/griddataurl/griddataurl_treegrid_lazyload.ashx"
            EnableTree="true" TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId"
            RowDataBoundFunction="gridRowDataBound">
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
    <script>

        // 自定义客户端行数据绑定函数
        function gridRowDataBound(rowData) {

            // 显式设置类型[文件夹]为非叶子节点（展开时延迟加载）
            // 如果不如此设置，则没有子节点的节点都被默认作为叶子节点
            if (rowData.values['Type'] === '文件夹') {
                rowData.leaf = false;
            }

        }



    </script>
</body>
</html>
