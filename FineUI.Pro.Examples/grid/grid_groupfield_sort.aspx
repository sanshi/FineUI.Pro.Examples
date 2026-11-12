<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_groupfield_sort.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_groupfield_sort" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            AllowSorting="true" SortField="HZData1" SortDirection="ASC" OnSort="Grid1_Sort">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Year" SortField="Year" HeaderText="统计年份" />
                <f:GroupField HeaderText="安徽省" TextAlign="Center">
                    <Columns>
                        <f:GroupField HeaderText="合肥市" TextAlign="Center">
                            <Columns>
                                <f:RenderField DataField="AHData1" SortField="AHData1" HeaderText="数据一" TextAlign="Center" />
                                <f:RenderField DataField="AHData2" SortField="AHData2" HeaderText="数据二" TextAlign="Center" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:GroupField HeaderText="河南省" TextAlign="Center">
                    <Columns>
                        <f:GroupField HeaderText="驻马店市" TextAlign="Center">
                            <Columns>
                                <f:RenderField DataField="HZData1" SortField="HZData1" ColumnID="HZData1" HeaderText="数据一" TextAlign="Center" />
                                <f:RenderField DataField="HZData2" SortField="HZData2" HeaderText="数据二" TextAlign="Center" />
                            </Columns>
                        </f:GroupField>
                        <f:GroupField HeaderText="漯河市" TextAlign="Center">
                            <Columns>
                                <f:RenderField DataField="HLData1" SortField="HLData1" HeaderText="数据一" TextAlign="Center" />
                                <f:RenderField DataField="HLData2" SortField="HLData2" HeaderText="数据二" TextAlign="Center" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:RenderField BoxFlex="1" DataField="LogTime" TextAlign="Center" HeaderText="记录时间" FieldType="Date" Renderer="Date"
                    RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在多层表头下对实际数据叶子列排序，分组标题保留原有层级。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>只对叶子列指定顺序</h3>
            <ol>
                <li>打开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>一个数值叶子列的表头菜单，选择升序，再选择降序。<br />结果：正文按该数据列重新排列，排序标记跟随目标叶子列，外层分组标题不变；组头本身不作为独立数据字段排序。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AllowSorting</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，允许叶子列发起排序。
                </li>
                <li><code>SortField</code>（<strong>可排序叶子列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：叶子列关联真实数据字段；分组表头只组织标题，不提供可排序数据值。</li>
            </ul>
        </section>
    </template>
</body>
</html>
