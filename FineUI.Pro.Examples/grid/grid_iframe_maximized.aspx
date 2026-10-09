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
        注：使用 RenderField.Commands 声明窗口命令，按当前行的数据生成窗口地址和标题。
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
