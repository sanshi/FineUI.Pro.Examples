<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_postback.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_postback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" IsFluid="true" Title="最小服务端 RowCommand" ShowBorder="true" ShowHeader="true" DataIDField="Id" DataKeyNames="Id,Name"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" ExpandUnusedSpace="true" />
                <f:RenderField ColumnID="Actions" Width="60px" TextAlign="Center" HeaderText="操作">
                    <Commands>
                        <f:Command CommandName="Delete" CommandArgument="Minimal" Icon="Delete" ConfirmText="你确定要这么做吗？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br /><br />
        <f:Label ID="labResult" EncodeText="false" runat="server" />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>通过服务器行命令事件接收本次行标识、列和命令，并显示处理结果。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>处理当前行命令</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="最小服务端 RowCommand">最小服务端 RowCommand</strong>某行中的文字按钮或图标命令；出现确认框时选择确认。<br />结果：命令回发到后台，<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("labResult").ClientID %>'
                        title="命令结果">命令结果</strong>显示当前记录和命令信息；本页用结果提示演示处理，不代表已执行真实删除。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>页面没有客户端 rowcommand Listener，Grid 会自动桥接服务端事件。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CommandName</code>（<strong>行命令</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="最小服务端 RowCommand">最小服务端
                        RowCommand</strong>）：为各个命令提供独立的业务标识，回调按本次名称区分动作。</li>
                <li><code>OnRowCommand</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="最小服务端 RowCommand">最小服务端
                        RowCommand</strong>）：无需为了回发另写客户端 Listener，服务器直接接收本次命令事件。</li>
            </ul>
        </section>
    </template>
</body>
</html>
