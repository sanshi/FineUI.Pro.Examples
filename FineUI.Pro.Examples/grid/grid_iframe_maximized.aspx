<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_iframe_maximized.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_iframe_maximized" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_iframe_window.aspx" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" PageSize="3" runat="server"
            EnableCheckBoxSelect="true" DataKeyNames="Id,Name">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="myWindowField" Width="60px" HeaderText="窗口列">
                    <Commands>
                        <f:Command Icon="Pencil" ToolTip="编辑" WindowID="Window1" WindowIFrameUrlFields="Id,Name"
                            WindowIFrameUrlFormatString="grid_iframe_window.aspx?id={0}&name={1}" WindowTitleFields="Name" WindowTitleFormatString="编辑 - {0}"
                            CommandName="Edit" />
                    </Commands>
                </f:RenderField>
                <f:RenderField ColumnID="CommandWindow" Width="80px" TextAlign="Center" HeaderText="Command 窗口">
                    <Commands>
                        <f:Command CommandName="Edit" Text="编辑" WindowID="Window1" WindowIFrameUrlFields="Id,Name"
                            WindowIFrameUrlFormatString="grid_iframe_window.aspx?id={0}&amp;name={1}" WindowTitleFields="Name"
                            WindowTitleFormatString="编辑 - {0}" WindowIFrameUrlEncode="true" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <f:Window ID="Window1" Title="编辑" Hidden="true" EnableIFrame="true" runat="server" CloseAction="HidePostBack" EnableResize="true"
            OnClose="Window1_Close" IsModal="true" Width="850px" Height="500px" EnableMaximize="true" Maximized="true">
        </f:Window>
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>点击行内入口，把这一行的资料传给独立审批窗体。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>由表格记录打开审批窗体</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>某行的铅笔入口。<br />结果：脚本用入口所属行生成网址参数和窗体标题，IFrame 内显示相应资料；<strong>姓名</strong>通过编码传入，不能直接拼接未编码文字。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：使用 RenderField.Commands 声明窗口命令，按当前行的数据生成窗口地址和标题。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableIFrame</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="编辑">编辑</strong>）：初始为
                    <code>true</code>，在独立页面中呈现选中记录资料。
                </li>
                <li><code>getSelectedRows / show</code>（<strong>打开窗体的页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：从当前记录或选择集合取得稳定主键与显示文字，作为窗体地址及标题；本页不执行真实审批业务。</li>
            </ul>
        </section>
    </template>
</body>
</html>
