<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_pageitems_toolbarfill.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_pageitems_toolbarfill" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格（内存分页）" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="false" runat="server" EnableCheckBoxSelect="true" Height="350px" EmptyText="没有数据！">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
            <PageItems>
                <f:Button Text="清空数据" runat="server" ID="btnClearData" OnClick="btnClearData_Click">
                </f:Button>
                <f:ToolbarFill ID="ToolbarFill2" runat="server"> </f:ToolbarFill>
                <f:Button Text="绑定数据" runat="server" ID="btnRebind" OnClick="btnRebindData_Click">
                </f:Button>
                <f:ToolbarFill ID="ToolbarFill1" runat="server"> </f:ToolbarFill>
                <f:Button Text="选中行" runat="server" ID="btnSelectAll" OnClick="btnSelectAll_Click">
                </f:Button>
                <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                </f:ToolbarSeparator>
            </PageItems>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
        <strong>出于性能考虑，请在实际项目中使用数据库分页（不要使用内存分页）！</strong>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>用弹性占位项把分页工具栏中的自定义按钮与分页控件分布在左、中、右侧。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>使用分页栏中的自定义操作</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnClearData").ClientID %>'
                        title="清空数据">清空数据</strong>。<br />结果：后台清空表格数据，分页栏更新为空数据状态。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>PageItems</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（内存分页）">表格（内存分页）</strong>）：把自定义按钮插入分页栏；按钮处理与普通按钮一致。</li>
                <li><code>ToolbarFill</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（内存分页）">表格（内存分页）</strong>）：在工具栏中占用剩余空间，使相邻内容分布到不同侧。</li>
            </ul>
        </section>
    </template>
</body>
</html>
