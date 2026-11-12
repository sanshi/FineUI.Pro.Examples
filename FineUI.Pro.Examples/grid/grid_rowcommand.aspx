<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowcommand" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-cell-Deleteit .f-icon {
            color: red;
            font-weight: bold;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" DataKeyNames="Id,Name" OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField Hidden="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" Hidden="true" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="Action1" Width="60px" TextAlign="Center">
                    <Commands>
                        <f:Command CommandName="Action1" Text="按钮" />
                    </Commands>
                </f:RenderField>
                <f:RenderField ColumnID="Action2" Width="60px" TextAlign="Center">
                    <Commands>
                        <f:Command CommandName="Action2" Icon="Delete" ConfirmText="你确定要这么做么？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
                <f:RenderField ColumnID="Deleteit" Width="60px" TextAlign="Center">
                    <Commands>
                        <f:Command CommandName="Action3" IconFont="_Close" ConfirmText="确定要删除本行？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>通过服务器行命令事件接收本次行标识、列和命令，并显示处理结果。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>处理当前行命令</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>某行中的文字按钮或图标命令；出现确认框时选择确认。<br />结果：命令回发到后台，<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("labResult").ClientID %>'
                        title="命令结果">命令结果</strong>显示当前记录和命令信息；本页用结果提示演示处理，不代表已执行真实删除。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CommandName</code>（<strong>行命令</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：为各个命令提供独立的业务标识，回调按本次名称区分动作。
                </li>
                <li><code>OnRowCommand</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：无需为了回发另写客户端
                    Listener，服务器直接接收本次命令事件。</li>
            </ul>
        </section>
    </template>
</body>
</html>
