<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_multi_commands.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_multi_commands" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" IsFluid="true" Title="同列多个行命令" ShowBorder="true" ShowHeader="true" DataIDField="Id" DataKeyNames="Id,Name"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" ExpandUnusedSpace="true" />
                <f:RenderField ColumnID="Actions" Width="90px" TextAlign="Center" HeaderText="操作">
                    <Commands>
                        <f:Command CommandName="Edit" IconFont="_Pencil" ToolTip="编辑" CommandArgument="Form" />
                        <f:Command CommandName="Delete" IconFont="_Close" IconFontClass="text-danger" ToolTip="删除" ConfirmText="删除本行？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server" />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在同一个单元格中放入多个图标命令，每个入口使用独立的命令名称。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>对照命令外观与对应结果</h3>
            <ul>
                <li>分别点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="同列多个行命令">同列多个行命令</strong>同一行中的文字或图标命令，出现确认框时先确认。<br />结果：命令回发后，<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("labResult").ClientID %>'
                        title="命令结果">命令结果</strong>显示所点记录和命令信息；改变显示外观或同列排列，不会把多个入口合并为同一命令。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Commands</code>（<strong>操作列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="同列多个行命令">同列多个行命令</strong>）：在同一数据列中声明多个命令，各自保留
                    CommandName。</li>
            </ul>
        </section>
    </template>
</body>
</html>
