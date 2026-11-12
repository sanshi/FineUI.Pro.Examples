<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowexpander_expandall.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowexpander_expandall" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" Height="500px" runat="server"
            ExpandAllRowExpanders="true">
            <Columns>
                <f:RenderField RenderAsRowExpander="true" DataField="Desc" RendererFunction="renderExpander" />
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="重新绑定表格" CssClass="marginr" OnClick="Button1_Click">
        </f:Button>
        <f:Button ID="btnExpandRowExpanders" runat="server" CssClass="marginr" Text="展开全部的行扩展列" OnClick="btnExpandRowExpanders_Click">
        </f:Button>
        <f:Button ID="btnCollapseRowExpanders" runat="server" Text="折叠全部的行扩展列" OnClick="btnCollapseRowExpanders_Click">
        </f:Button>
        <br />
        <br /><br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>初始展开每条记录的行详情，并允许统一展开、折叠或重新绑定数据。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>初始展开与后续切换</h3>
            <ul>
                <li>从初始状态查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>各行下方的详情区域。<br />结果：各行详情已显示；可以单独折叠其中一行，其余仍保持展开。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>统一控制全部行</h3>
            <ol>
                <li>点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnCollapseRowExpanders").ClientID %>'
                        title="折叠全部的行扩展列">折叠全部的行扩展列</strong>，再点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnExpandRowExpanders").ClientID %>'
                        title="展开全部的行扩展列">展开全部的行扩展列</strong>。<br />结果：现有详情先全部收起，再统一展开；数据行本身保留。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：通过一个简单的属性，来控制是否展开所有行扩展列（即使在重新绑定数据后，依然能够保持所有扩展列的展开状态）。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RowExpanderField</code>（<strong>行扩展列</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：在记录下方容纳额外展示内容，不改变原数据字段或行标识。
                </li>
                <li><code>ExpandAllRowExpanders</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，初次绑定时展开所有行的扩展内容，后续仍可单行或统一折叠。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
