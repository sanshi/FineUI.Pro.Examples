<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_simulate_tree_database_paging.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_simulate_tree_database_paging" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" AllowPaging="true" IsDatabasePaging="true" PageSize="1" Height="500px" OnPageIndexChanged="Grid1_PageIndexChanged"
            ShowPagingMessage="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" DataSimulateTreeLevelField="TreeLevel" HeaderText="地区" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>按省份分页加载地区层级，保留当前省下市县的树形缩进。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>以完整省份层级换页</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>分页栏切换下一页。<br />结果：后台按省份索引读取当前省及它的市县；页大小统计的是省份数，返回的表格行数还包含下级记录。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>IsDatabasePaging</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，通过后台按省份获取本页数据。
                </li>
                <li><code>PageSize</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>1</code>，本页按省份数计算页大小，不是把市县扁平行任意截断。
                </li>
                <li><code>DataSimulateTreeLevelField</code>（<strong>地区列</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：<strong>地区</strong>列从层级字段读取深度，数据必须按父行在前、后代连续的顺序提供，不能仅靠缩进推断未提供的数据。</li>
            </ul>
        </section>
    </template>
</body>
</html>
