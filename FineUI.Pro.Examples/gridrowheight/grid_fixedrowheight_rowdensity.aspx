<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_fixedrowheight_rowdensity.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_fixedrowheight_rowdensity" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        /* 最多显示 3 行文字，超出则显示省略号 */
        .f-grid-row .f-grid-cell-text {
            white-space: normal;
            word-break: break-all;
            overflow: hidden;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            display: -webkit-box;
        }

    </style>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" Height="650px" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            EnableCheckBoxSelect="true" RowDensity="Default" FixedRowHeight="true" RowHeightLines="3">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderField DataField="AtSchool" HeaderText="是否在校" RendererFunction="renderInverseCheck1" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Desc" Width="400px" DataField="Desc" HeaderText="个人简介" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
            <Tools>
                <f:Tool ID="toolRowDensity" runat="server" IconFont="_List" Text="行密度">
                    <Menu runat="server">
                        <f:MenuCheckBox Text="小间距" AttributeDataTag="small" GroupName="RowDensity" runat="server" ClickHandler="onRowDensityChange">
                        </f:MenuCheckBox>
                        <f:MenuCheckBox Text="标准间距" AttributeDataTag="normal" Checked="true" GroupName="RowDensity" runat="server"
                            ClickHandler="onRowDensityChange"></f:MenuCheckBox>
                        <f:MenuCheckBox Text="大间距" AttributeDataTag="large" GroupName="RowDensity" runat="server" ClickHandler="onRowDensityChange">
                        </f:MenuCheckBox>
                        <f:MenuCheckBox Text="超大间距" AttributeDataTag="xlarge" GroupName="RowDensity" runat="server" ClickHandler="onRowDensityChange">
                        </f:MenuCheckBox>
                    </Menu>
                </f:Tool>
            </Tools>
        </f:Grid>
        <br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function renderInverseCheck1(value, params) {
            var checked = String(value).toLowerCase() === 'false';
            return $('<i>').addClass('f-icon f-iconfont f-grid-static-checkbox').toggleClass('f-checked', checked);
        }

    </script>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';
        var toolRowDensityClientID = '<%= toolRowDensity.ClientID %>';

        function onRowDensityChange(event) {
            var menuCheckBoxCmp = this;
            var selectedRowDensity = menuCheckBoxCmp.el.attr('data-tag');

            F(Grid1ClientID).setRowDensity(selectedRowDensity);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>通过行密度菜单调整行内间距。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>切换行密度</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>标题栏的齿轮，选择超大间距，再改回普通。<br />结果：浏览器直接更新行密度，行内上下间距和最终行高相应变化；数据不变，也不为间距调整重新查询。每次切换后各行仍保持该密度下的统一高度。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>setRowDensity</code>（<strong>行密度菜单与表格脚本</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：菜单把
                    <code>small</code>、<code>normal</code>、<code>large</code>、<code>xlarge</code> 传给表格，初始选择普通。
                </li>
                <li><code>FixedRowHeight</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 <code>true</code>，初始为
                    <code>true</code>，按统一行高显示记录。
                </li>
                <li><code>RowHeightLines</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 <code>3</code>，初始为
                    <code>3</code>，为行内容预留三行文字对应的高度，再结合当前行密度计算。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
