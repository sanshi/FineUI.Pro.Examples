<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_complex_property.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_complex_property" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="3" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="MyText" SortField="MyText" HeaderText="姓名" />
                <f:RenderField DataField="Year" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="MyCheckBox" HeaderText="是否在校" />
                <f:RenderField HeaderText="是否在校" DataField="MyCheckBox" RendererFunction="renderSchool1" />
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="Info.UserName" HeaderText="老师（二级属性）" />
            </Columns>
        </f:Grid>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        function renderSchool1(value, params) {
            return value === 'True' || value === true ? '是' : '否';
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把对象的嵌套属性绑定为表格列，在同一行显示学生资料与关联对象的信息。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>读取关联对象的属性</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的老师等关联信息列。<br />结果：每行显示关联对象中的实际属性，例如首行显示张老师；不把整个关联对象显示为字符串。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：列通过属性路径读取数据，本页包含
                    <code>Info.UserName</code>；列值来自同一行对象。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
