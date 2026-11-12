<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="linkbutton_field.aspx.cs" Inherits="FineUI.Pro.Examples.grid_server_render.linkbutton_field" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>链接按钮列：行命令与确认</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" DataIDField="Id" DataKeyNames="Id,Name" IsFluid="true" ShowHeader="true" Title="链接按钮列：行命令与确认"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField ColumnID="Number" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:LinkButtonField ColumnID="Action" HeaderText="行命令" Text="执行" CommandName="Execute" ConfirmText="执行当前行的操作？" />
            </Columns>
        </f:Grid>

        <f:Label ID="labResult" runat="server" />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>让服务器链接按钮列在确认后触发行命令，并识别被点击的记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>确认或取消行操作</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="链接按钮列：行命令与确认">链接按钮列：行命令与确认</strong>一行的执行链接，先取消，再重新点击并确认。<br />结果：取消不执行<strong>行命令</strong>；确认后后台取得本行与 Execute
                    命令并更新结果文字，本页没有据此删除或保存业务数据。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>LinkButtonField 将点击转换为服务端行命令，并支持确认提示；新项目优先使用 RenderField.Commands。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CommandName</code>（<strong>执行链接列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="链接按钮列：行命令与确认">链接按钮列：行命令与确认</strong>）：初始为
                    <code>Execute</code>，后台按命令名识别行操作。
                </li>
                <li><code>ConfirmText</code>（<strong>执行链接列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="链接按钮列：行命令与确认">链接按钮列：行命令与确认</strong>）：先显示执行当前行的操作？确认提示，确认后才发送命令。</li>
            </ul>
        </section>
    </template>
</body>
</html>
