<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_paging.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_paging" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格" Height="400px" runat="server" EnableCollapse="false"
            EnableCheckBoxSelect="true" EnableTree="true" TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId" OnRowDataBound="Grid1_RowDataBound"
            AllowPaging="true" IsDatabasePaging="true" PageSize="2" OnPageIndexChanged="Grid1_PageIndexChanged">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:RenderField Width="150px" DataField="Type" HeaderText="类型" />
                <f:RenderField Width="150px" DataField="Size" HeaderText="大小" />
                <f:RenderField Width="150px" DataField="ModifyDate" HeaderText="修改日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>按顶层分支进行后台分页，同一分支的后代随父节点一起显示。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>以顶层分支为单位换页</h3>
            <ul>
                <li>展开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>当前页目录，再切换下一页。<br />结果：后台按顶层节点页码读取新分支及后代；页<strong>大小</strong>统计顶层节点，不把父子扁平行随意截断。</li>
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
            </ul>
        </section>
    </template>
</body>
</html>
