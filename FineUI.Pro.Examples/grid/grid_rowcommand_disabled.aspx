<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_disabled.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_disabled" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" IsFluid="true" Title="禁用行命令" ShowBorder="true" ShowHeader="true" DataIDField="Id" DataKeyNames="Id,Name"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" ExpandUnusedSpace="true" />
                <f:RenderField ColumnID="Actions" Width="110px" TextAlign="Center" HeaderText="操作">
                    <Commands>
                        <f:Command CommandName="Action1" Enabled="false" Icon="Pencil" ToolTip="在页面标签中禁用" />
                        <f:Command CommandName="Action2" IconFont="_Pencil" ToolTip="在 Page_Load 中通过 FindCommand 禁用" />
                        <f:Command CommandName="Action3" Icon="Delete" ToolTip="可用命令" ConfirmText="你确定要这么做吗？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br /><code>FindCommand</code> 禁用。<br />
        <f:Label ID="labResult" EncodeText="false" runat="server" />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在页面声明与后台代码中禁用指定命令，保留其他命令入口。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>对照受限命令与可用命令</h3>
            <ul>
                <li>尝试点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="禁用行命令">禁用行命令</strong>中的灰色命令，再点击仍可用的命令。<br />结果：禁用命令不触发处理，可用命令仍能确认并提交本次动作。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>前两个命令分别由标签和服务端</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Enabled</code>（<strong>行命令</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="禁用行命令">禁用行命令</strong>）：指定命令是否允许执行；声明与后台修改均作用于相应命令。</li>
            </ul>
        </section>
    </template>
</body>
</html>
