<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_header_tooltip.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_header_tooltip" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" Height="300px" runat="server">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业，这是很长的标题文本，真的很长很长" HeaderToolTip="所学专业，这是很长的标题文本，真的很长很长" HeaderToolTipPosition="Top"
                    Width="150px" DataField="Major" RendererFunction="renderMajor" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>给专业列标题设置完整提示，标题较长时仍能悬停读取。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>悬停查看列标题全文</h3>
            <ul>
                <li>把鼠标移到<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的专业列标题。<br />结果：标题提示显示完整文字，提示出现在配置的顶部位置；这是表头提示，与数据单元格提示分别配置。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>HeaderToolTip / HeaderToolTipPosition</code>（<strong>专业列标题</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：专业列提供完整提示文字，弹出位置初始为
                    <code>Top</code>。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
