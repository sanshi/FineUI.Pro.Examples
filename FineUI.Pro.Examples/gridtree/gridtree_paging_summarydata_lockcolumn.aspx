<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_paging_summarydata_lockcolumn.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_paging_summarydata_lockcolumn" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-row-summary .f-grid-cell-text {
            font-weight: bold;
            color: red;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格" Height="400px" runat="server" EnableCollapse="false"
            EnableCheckBoxSelect="true" EnableTree="true" TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId" OnRowDataBound="Grid1_RowDataBound"
            AllowPaging="true" IsDatabasePaging="true" PageSize="2" OnPageIndexChanged="Grid1_PageIndexChanged" EnableSummary="true" SummaryPosition="Bottom"
            AllowColumnLocking="true" ShowSelectedCell="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField EnableLock="true" ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:RenderField EnableLock="true" Width="150px" DataField="Type" HeaderText="类型" />
                <f:RenderField EnableLock="true" ColumnID="Size" Width="150px" DataField="Size" HeaderText="大小" />
                <f:RenderField EnableLock="true" Width="150px" DataField="ModifyDate" HeaderText="修改日期" FieldType="Date" Renderer="Date"
                    RendererArgument="yyyy-MM-dd" />
            </Columns>
            <PageItems>
                <f:ToolbarSeparator runat="server"></f:ToolbarSeparator>
                <f:Button runat="server" ID="btnExpandAll" Text="展开全部" ClickHandler="onExpandAllClick"></f:Button>
                <f:Button runat="server" ID="btnCollapseAll" Text="折叠全部" ClickHandler="onCollapseAllClick"></f:Button>
            </PageItems>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var gridID = '<%= Grid1.ClientID %>';

        function onExpandAllClick(event) {
            F(gridID).expandRows();
        }


        function onCollapseAllClick(event) {
            F(gridID).collapseRows();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>按顶层分支进行后台分页，同一分支的后代随父节点一起显示，并显示当前页统计与锁定列。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>以顶层分支为单位换页</h3>
            <ul>
                <li>展开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>当前页目录，再切换下一页。<br />结果：后台按顶层节点页码读取新分支及后代；页<strong>大小</strong>统计顶层节点，不把父子扁平行随意截断。当前页合计随新分支数据重算。锁定列和合计仍与正文对应。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>PageSize</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：初始为
                    <code>2</code>，控制每页顶层分支数量，实际显示行数还包括它们的后代。
                </li>
                <li><code>IsDatabasePaging</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：初始为
                    <code>true</code>，每次换页提供当前分支及总顶层节点数。
                </li>
                <li><code>SummaryData</code>（<strong>表格合计数据</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>）：以本页返回的节点数据计算统计，不在当前页显示全树累计值。</li>
            </ul>
        </section>
    </template>
</body>
</html>
