<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_groupfield_complex.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_groupfield_complex" %>

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
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField DataField="Year" HeaderText="统计年份" />
                <f:GroupField HeaderText="安徽省" TextAlign="Center">
                    <Columns>
                        <f:RenderField DataField="HSData" HeaderText="黄山市" />
                        <f:GroupField HeaderText="合肥市" TextAlign="Center">
                            <Columns>
                                <f:RenderField DataField="HFData" HeaderText="总数据" />
                                <f:GroupField HeaderText="其中" TextAlign="Center">
                                    <Columns>
                                        <f:RenderField DataField="HF_SHData" HeaderText="蜀山区" />
                                        <f:RenderField DataField="HF_BHData" HeaderText="滨湖区" />
                                    </Columns>
                                </f:GroupField>
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:GroupField HeaderText="河南省" TextAlign="Center">
                    <Columns>
                        <f:RenderField DataField="LHData" HeaderText="漯河市" />
                        <f:GroupField HeaderText="驻马店市" TextAlign="Center">
                            <Columns>
                                <f:RenderField DataField="ZMDData" HeaderText="总数据" />
                                <f:GroupField HeaderText="其中" TextAlign="Center">
                                    <Columns>
                                        <f:RenderField DataField="ZMD_SPData" HeaderText="遂平县" />
                                        <f:RenderField DataField="ZMD_XPData" HeaderText="西平县" />
                                    </Columns>
                                </f:GroupField>
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" TextAlign="Center" DataField="LogTime" HeaderText="记录时间" FieldType="Date"
                    Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>嵌套更多层分组表头，把不同层次的地区与明细列组织在同一表格中。</p>
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
