<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_number_trailingzero.aspx.cs" Inherits="FineUI.Pro.Examples.gridother.grid_number_trailingzero" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（尾零省略）" runat="server" EnableCollapse="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别"></f:RenderField>
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业"></f:RenderField>
                <f:RenderField Width="150px" DataField="EntranceDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" HeaderText="入学日期">
                </f:RenderField>
                <f:RenderField Width="160px" DataField="Salary" HeaderText="工资（千分位，尾零省略）" FieldType="Double" Renderer="Number" RendererArgument="N2"
                    TrimZero="true" />
                <f:RenderField Width="150px" DataField="GPA" HeaderText="绩点（定点数，尾零省略）" FieldType="Double" Renderer="Number" RendererArgument="F2"
                    TrimZero="true" />
                <f:RenderField Width="160px" DataField="AttendanceRate" HeaderText="出勤率（百分比，尾零省略）" FieldType="Double" Renderer="Number" RendererArgument="P2"
                    TrimZero="true" />
                <f:RenderField Width="175px" DataField="ResearchFund" HeaderText="科研经费（科学计数法，尾零省略）" FieldType="Double" Renderer="Number" RendererArgument="E2"
                    TrimZero="true" />
            </Columns>
        </f:Grid>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/gridcard.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在数字格式化后省略小数末尾的零，同时保留有意义的小数位。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>比较整数与小数的格式化结果</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（尾零省略）">表格（尾零省略）</strong>中工资、绩点等数值列。<br />结果：整数绩点显示为 2 而不是 2.00；带非零小数的值仍保留有效小数，工资的千分位分隔继续存在。省略尾零只改变显示，不改源数值。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Renderer / RendererArgument</code>（<strong>数值列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（尾零省略）">表格（尾零省略）</strong>）：按列选择 Number
                    渲染及格式字符串，例如 <code>N2</code> 表示带分组分隔的两位小数。</li>
                <li><code>TrimZero</code>（<strong>启用尾零省略的数值列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（尾零省略）">表格（尾零省略）</strong>）：初始为
                    <code>true</code>，删除格式化结果末尾不影响数值意义的零及多余小数点。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
