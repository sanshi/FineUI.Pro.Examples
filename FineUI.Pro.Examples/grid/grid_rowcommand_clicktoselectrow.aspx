<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_clicktoselectrow.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_clicktoselectrow" %>

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
            EnableCheckBoxSelect="true" OnRowCommand="Grid1_RowCommand" EnableRowClickEvent="true" OnRowClick="Grid1_RowClick">
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
                        <f:Command CommandName="Action1" Text="按钮1" />
                    </Commands>
                </f:RenderField>
                <f:RenderField ColumnID="Action2" Width="60px" TextAlign="Center">
                    <Commands>
                        <f:Command CommandName="Action2" Text="按钮2" CssClass="prevent-row-select" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />

    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onBeforeRowClick(event, rowId) {
            return !$(event.target).closest('.prevent-row-select').length;
        }
        F.ready(function() {
            F('<%= Grid1.ClientID %>').on('beforerowclick', onBeforeRowClick);
        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对照行内命令是否连带选择当前行，使业务动作与行选择可以分别控制。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>对照两类命令点击</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>一行的<strong>按钮1</strong>，再点击另一行的<strong>按钮2</strong>。<br />结果：两种按钮都可执行本行命令；按钮2对应的点击被选择拦截逻辑排除，不连带改变行选择。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>
                    [按钮1]：点击时会同时触发RowCommand和RowClick事件，同时选中行。
                </li>
                <li>
                    [按钮2]：点击时只会触发RowCommand事件，不会选中行。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>beforerowclick / CSS</code>（<strong>页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：本页按命令的样式类识别需要阻止的行点击，取消选择动作并保留命令处理。</li>
            </ul>
        </section>
    </template>
</body>
</html>
