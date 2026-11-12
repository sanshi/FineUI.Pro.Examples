<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_simulate_tree_checkboxfield.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_simulate_tree_checkboxfield" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" DataKeyNames="Id,Name,TreeLevel" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" DataSimulateTreeLevelField="TreeLevel" EncodeText="true" HeaderText="地区" ExpandUnusedSpace="true"
                    MinWidth="150px" />
                <f:GroupField HeaderTextAlign="Center" HeaderText="这是多表头">
                    <Columns>
                        <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                        <f:RenderCheckField ColumnID="CheckBoxField1" RenderAsStaticField="false" HeaderText="复选框列" />
                        <f:RenderField ColumnID="Action1">
                            <Commands>
                                <f:Command CommandName="Action1" Text="按钮 1" />
                            </Commands>
                        </f:RenderField>
                        <f:RenderField ColumnID="Action2">
                            <Commands>
                                <f:Command ConfirmText="你确定要这么做么？" ConfirmTarget="Top" CommandName="Action2" Text="按钮 2" />
                            </Commands>
                        </f:RenderField>
                    </Columns>
                </f:GroupField>
            </Columns>
            <Listeners>
                <f:Listener Event="rowcommand" Handler="onGrid1RowCommand" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        function onGrid1RowCommand(event, rowId, rowIndex, columnId, commandName) {
            var grid = F('<%= Grid1.ClientID %>');
            F.customEvent('GridRowCommand', {
                rowId: rowId,
                columnId: columnId,
                commandName: commandName,
                isChecked: grid.getRowData(rowId).values.CheckBoxField1
            });
        }

        F.ready(function() {
            bindGridCheckChange(F('<%= Grid1.ClientID %>'), 'CheckBoxField1');
        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在模拟树形行中切换父行勾选，统一选择或取消其下级记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>让父行勾选覆盖下级</h3>
            <ol>
                <li>切换<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>一个父行的正文复选框。<br />结果：该父行下属连续层级记录一起勾选或取消，范围到下一个同级或更高层级截止；其他分支保留自己的勾选。</li>
                <li>折叠此分支后再切换父行并重新展开。<br />结果：隐藏在折叠区域的下级也采用本次状态；正文布尔值与表格整行选择分别处理。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>初始选中 安徽省 合肥市 黄山市 的<strong>复选框列</strong>；</li>
                <li>选中（或取消）父级的复选框，会同时选中（或取消）所有的子级复选框。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>GridCheckChanged / GridSelectionUtil</code>（<strong>正文复选框与父子级联处理</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：按层级确定当前父行的后代范围，再更新实际复选框值；不只改变可见图标。</li>
                <li><code>DataSimulateTreeLevelField</code>（<strong>地区列</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：<strong>地区</strong>列从层级字段读取深度，数据必须按父行在前、后代连续的顺序提供，不能仅靠缩进推断未提供的数据。</li>
            </ul>
        </section>
    </template>
</body>
</html>
