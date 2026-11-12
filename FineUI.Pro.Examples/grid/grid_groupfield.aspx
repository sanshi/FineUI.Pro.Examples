<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_groupfield.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_groupfield" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server">
            <Columns>
                <f:RenderField DataField="Year" HeaderText="统计年份" />
                <f:GroupField ColumnID="Anhui" HeaderText="安徽省" TextAlign="Center">
                    <Columns>
                        <f:GroupField ColumnID="Hefei" HeaderText="合肥市" TextAlign="Center">
                            <Columns>
                                <f:RenderField DataField="AHData1" HeaderText="数据一" />
                                <f:RenderField DataField="AHData2" HeaderText="数据二" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:GroupField ColumnID="Henan" HeaderText="河南省" TextAlign="Center">
                    <Columns>
                        <f:GroupField ColumnID="Zhumadian" HeaderText="驻马店市" TextAlign="Center">
                            <Columns>
                                <f:RenderField DataField="HZData1" HeaderText="数据一" />
                                <f:RenderField DataField="HZData2" HeaderText="数据二" />
                            </Columns>
                        </f:GroupField>
                        <f:GroupField ColumnID="Luohe" HeaderText="漯河市" TextAlign="Center">
                            <Columns>
                                <f:RenderField DataField="HLData1" HeaderText="数据一" />
                                <f:RenderField DataField="HLData2" HeaderText="数据二" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:RenderField BoxFlex="1" TextAlign="Center" DataField="LogTime" HeaderText="记录时间" FieldType="Date" Renderer="Date"
                    RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>用分组表头组织多层列标题，底层叶子列仍各自读取对应字段。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>沿组头找到对应明细列</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>表头各层的省、市等分组，再向下对照明细列与正文。<br />结果：上层标题跨越所属下级列，叶子标题与各行值逐列对应；表头层次不改变数据行数量。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>GroupField.Columns</code>（<strong>分组表头</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：在分组中继续放分组或数据列，按嵌套结构形成表头层级。
                </li>
                <li><code>DataField</code>（<strong>叶子数据列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：仅由底层数据列读取每行字段，组头不重复绑定数据。</li>
            </ul>
        </section>
    </template>
</body>
</html>
