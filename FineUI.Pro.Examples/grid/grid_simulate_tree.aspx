<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_simulate_tree.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_simulate_tree" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true">
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
            <p>用层级字段在普通表格中显示树形缩进及展开折叠入口。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>按层级查看与折叠行</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong><strong>地区</strong>列的缩进，并点击父行展开折叠图标。<br />结果：下一级比父级多一级缩进；折叠只隐藏这一分支的后代，叶子行没有展开入口，其他分支保留。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableSimulateTree</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：启用模拟树形行的缩进与分支显示。</li>
                <li><code>DataSimulateTreeLevelField</code>（<strong>地区列</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：<strong>地区</strong>列从层级字段读取深度，数据必须按父行在前、后代连续的顺序提供，不能仅靠缩进推断未提供的数据。</li>
            </ul>
        </section>
    </template>
</body>
</html>
