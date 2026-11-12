<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_excel_groupfield.aspx.cs" Inherits="FineUI.Pro.Examples.data.grid_excel_groupfield" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/Code/GridExportUtil.cs" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server">
            <Columns>
                <f:RowNumberField ColumnID="tfNumber" Width="60px" />
                <f:GroupField HeaderText="分组一" TextAlign="Center">
                    <Columns>
                        <f:RenderField DataField="Name" HeaderText="姓名" />
                        <f:RenderField ColumnID="tfGender" HeaderText="性别" TextAlign="Center" DataField="Gender" RendererFunction="renderGender" />
                        <f:GroupField HeaderText="考试成绩" TextAlign="Center">
                            <Columns>
                                <f:RenderField DataField="ChineseScore" HeaderText="语文成绩" TextAlign="Center" />
                                <f:RenderField DataField="MathScore" HeaderText="数学成绩" TextAlign="Center" />
                                <f:RenderField DataField="TotalScore" HeaderText="总成绩" TextAlign="Center" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" HeaderText="所学专业" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button2" CssClass="marginr" runat="server" Text="重新绑定表格" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button1" EnableAjax="false" DisableControlBeforePostBack="false" runat="server" Text="导出为Excel文件" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>将多层分组表头与学生数据一起导出，保留表头的层级关系。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>导出分组表头与行数据</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="导出为Excel文件">导出为Excel文件</strong>。<br />结果：后台读取表格列和数据，以附件返回 myexcel.xls；多层标题按分组生成对应合并单元格，数据仍对应叶子列。本页生成的是 HTML 表格文件，不是原生 XLSX 工作簿。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Content-Type / Content-Disposition</code>（<strong>页面导出处理</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：设置 Excel
                    响应类型与附件文件名，让浏览器按下载处理，不在示例 iframe 中显示文件内容。</li>
                <li><code>GroupField / colspan / rowspan</code>（<strong>页面导出处理</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：遍历表头层级，用行列合并保留分组标题与叶子列的对应关系。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
