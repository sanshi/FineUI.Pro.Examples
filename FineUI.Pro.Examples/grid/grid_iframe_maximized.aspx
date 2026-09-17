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
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major" DataTextFormatString="{0}"
                    DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}" UrlEncode="true" Target="_blank"
                    ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:WindowField ColumnID="myWindowField" Width="60px" WindowID="Window1" HeaderText="窗口列" Icon="Pencil" ToolTip="编辑" DataTextFormatString="{0}"
                    DataIFrameUrlFields="Id,Name" DataIFrameUrlFormatString="grid_iframe_window.aspx?id={0}&name={1}" DataWindowTitleField="Name"
                    DataWindowTitleFormatString="编辑 - {0}" />
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
        注：推荐使用 RenderField.Commands 声明窗口命令；页面保留 WindowField 用于兼容写法对照。
    </form>
</body>
</html>
