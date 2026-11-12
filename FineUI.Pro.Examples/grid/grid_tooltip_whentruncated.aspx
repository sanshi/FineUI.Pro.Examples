<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_tooltip_whentruncated.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_tooltip_whentruncated" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>提示信息（仅截断时显示 ShowTooltipWhenTruncated）</title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField HeaderText="所学专业（仅截断时显示）" DataField="Major" Width="140" ShowToolTip="true" ShowTooltipWhenTruncated="true" />
                <f:RenderField HeaderText="所学专业（永远显示）" DataField="Major" Width="140" ShowToolTip="true" />
            </Columns>
        </f:Grid>

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对照只在文字截断时出现的提示与始终可悬停显示的提示。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>比较短文字与长文字的悬停结果</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>两组专业单元格上悬停，分别选择完整显示与被截断的文字。<br />结果：仅截断时显示提示的列只为被省略的内容弹出提示；永远显示的对照列即使文字能放下也会弹出。这里的始终显示仍需鼠标悬停。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <div>
                <b>两列的区别（把鼠标依次移到两列的各行上对比）：</b>
                <ul>
                    <li><b><strong><strong>所学专业（仅截断时显示）</strong></strong></b>：<code>ShowToolTip="true"
                            ShowTooltipWhenTruncated="true"</code>。只有当专业名过长、被列宽截断出现省略号时才弹出提示；短名鼠标悬停<b>不弹</b>提示。</li>
                    <li><b><strong><strong>所学专业（永远显示）</strong></strong></b>：<code>ShowToolTip="true"</code>。无论内容长短，鼠标悬停<b>都会</b>弹出完整内容的提示——这是默认行为。</li>
                </ul>
            </div>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ShowToolTip</code>（<strong>专业对照列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：两组对照列均开启自动提示。</li>
                <li><code>ShowToolTipWhenTruncated</code>（<strong>仅截断时显示提示的专业列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：仅截断列初始为
                    <code>true</code>；对照列不施加截断条件。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
