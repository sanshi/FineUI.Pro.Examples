<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_customcommand.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_customcommand" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" IsFluid="true" Title="客户端与服务端行命令" ShowBorder="true" ShowHeader="true" DataIDField="Id" DataKeyNames="Id,Name"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" ExpandUnusedSpace="true" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderField ColumnID="Actions" Width="110px" TextAlign="Center" HeaderText="操作">
                    <Commands>
                        <f:Command CommandName="Action0" IconFont="_Info" ToolTip="只执行客户端命令" />
                        <f:Command CommandName="Action1" Icon="Pencil" ToolTip="执行服务端命令" CommandArgument="Edit" />
                        <f:Command CommandName="Action3" Icon="Delete" ToolTip="确认后执行服务端命令" ConfirmText="你确定要这么做吗？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="rowcommand" Handler="onGrid1RowCommand" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server" />
    </form>
    <script>
        function onGrid1RowCommand(event, rowId, rowIndex, columnId, commandName) {
            if (commandName === 'Action0') {
                F.alert('这是客户端命令，已阻止服务端 RowCommand。');
                return false;
            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在客户端行命令回调中拦截指定动作，其他命令继续交给后台处理。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>对照客户端拦截与后台处理</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="客户端与服务端行命令">客户端与服务端行命令</strong>中的<strong>客户端命令</strong>，再点击普通服务器命令。<br />结果：指定命令只显示浏览器提示，回调返回 false 后不执行后台事件；普通命令仍回发并显示本次行信息。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>rowcommand</code>（<strong>页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="客户端与服务端行命令">客户端与服务端行命令</strong>）：浏览器回调根据命令名判断是否拦截，返回 false 只取消当前命令的后台处理。</li>
            </ul>
        </section>
    </template>
</body>
</html>
