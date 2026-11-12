<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_number.aspx.cs" Inherits="FineUI.Pro.Examples.gridother.grid_number" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别"></f:RenderField>
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业"></f:RenderField>
                <f:RenderField Width="150px" DataField="EntranceDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" HeaderText="入学日期">
                </f:RenderField>
                <f:RenderField Width="150px" DataField="Salary" HeaderText="工资（千分位）" FieldType="Double" Renderer="Number" RendererArgument="N2" />
                <f:RenderField Width="150px" DataField="GPA" HeaderText="绩点（定点数）" FieldType="Double" Renderer="Number" RendererArgument="F2" />
                <f:RenderField Width="150px" DataField="AttendanceRate" HeaderText="出勤率（百分比）" FieldType="Double" Renderer="Number" RendererArgument="P1" />
                <f:RenderField Width="150px" DataField="ResearchFund" HeaderText="科研经费（科学计数法）" FieldType="Double" Renderer="Number" RendererArgument="E2" />
                <f:RenderField Width="150px" DataField="StudentCode" HeaderText="学号（十进制整数）" FieldType="Int" Renderer="Number" RendererArgument="D10" />
            </Columns>
        </f:Grid>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/gridcard.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>为金额、小数、百分比及编号分别指定数字显示格式。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>比较不同数字列的输出</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>中工资、绩点等数值列。<br />结果：各列分别显示千分位、小数位、百分比、科学记数或补零编号，具体形式由每列格式决定；同一数字类型不要求采用同一格式。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Renderer / RendererArgument</code>（<strong>数值列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：按列选择 Number 渲染及格式字符串，例如
                    <code>N2</code> 表示带分组分隔的两位小数。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
