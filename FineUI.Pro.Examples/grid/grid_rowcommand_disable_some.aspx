<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_disable_some.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_disable_some" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" IsFluid="true" Title="按行禁用命令" ShowBorder="true" ShowHeader="true" DataIDField="Id" DataKeyNames="Id,Name"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" ExpandUnusedSpace="true" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderField ColumnID="Actions" Width="80px" TextAlign="Center" HeaderText="操作">
                    <Commands>
                        <f:Command CommandName="Action1" Icon="Pencil" RendererFunction="renderAction1Disabled" />
                        <f:Command CommandName="Action3" Icon="Delete" ConfirmText="你确定要这么做吗？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br /><br />
        <f:Label ID="labResult" EncodeText="false" runat="server" />
    </form>
    <script>
        function renderAction1Disabled(value, params) {
            if (params.rowData.values.EntranceYear == 2008) {
                return $(value).addClass('f-state-disabled').attr('data-qtip', '此行命令由 RendererFunction 禁用');
            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>按行数据禁用特定命令，其他行及同一行的其他命令仍可用。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>对照受限命令与可用命令</h3>
            <ul>
                <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="按行禁用命令">按行禁用命令</strong>中入学年份等于 2008 的行与其他记录的第一个命令。<br />结果：符合条件的首个命令呈现禁用外观且不能执行；其他入口仍可正常处理。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>入学年份为 2008 的编辑命令被禁用。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RendererFunction</code>（<strong>行命令</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="按行禁用命令">按行禁用命令</strong>）：命令渲染函数读取当前行入学年份，只对
                    2008 对应命令附加隐藏或禁用样式。</li>
            </ul>
        </section>
    </template>
</body>
</html>
