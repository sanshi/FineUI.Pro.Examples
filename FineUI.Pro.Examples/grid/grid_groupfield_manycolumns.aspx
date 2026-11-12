<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_groupfield_manycolumns.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_groupfield_manycolumns" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" IsViewPort="true" ShowBorder="true" ShowHeader="true" EnableCollapse="false" EnableColumnLines="true"
            AllowColumnLocking="true" Title="多级分组表头 + 大量列（约 425 列，验证表头/表体列线对齐）" runat="server">
            <Columns>
                <f:RowNumberField />
            </Columns>
        </f:Grid>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>用大量多层表头与叶子列核对横向滚动、列线对齐及动态列集合的回发读取。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>核对多列表头与正文</h3>
            <ul>
                <li>横向滚动<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>到靠后月份或数据列，比较组头、列线与正文位置。<br />结果：多层组头覆盖对应的叶子列，正文列边界与标题保持对齐；锁定区域继续留在原侧。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>GroupField.Columns / AllColumns</code>（<strong>动态表头集合</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：分组保留父子结构，AllColumns
                    可遍历实际叶子列；大量列应按唯一列标识区分。</li>
                <li><code>EnableColumnLines</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，显示列分隔线，便于核对大量列的边界对齐。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
