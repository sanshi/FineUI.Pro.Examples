<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_field.aspx.cs" Inherits="FineUI.Pro.Examples.grid_server_render.window_field" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>弹窗列：窗口地址与标题</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" DataIDField="Id" DataKeyNames="Id,Name" IsFluid="true" ShowHeader="true" Title="弹窗列：窗口地址与标题"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField ColumnID="Number" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:WindowField ColumnID="Edit" HeaderText="编辑" Text="编辑" WindowID="Window1" DataIFrameUrlFields="Id,Name"
                    DataIFrameUrlFormatString="../grid/grid_iframe_window.aspx?id={0}&amp;name={1}" DataWindowTitleField="Name"
                    DataWindowTitleFormatString="编辑 - {0}" />
            </Columns>
        </f:Grid>
        <f:Window ID="Window1" runat="server" Hidden="true" EnableIFrame="true" Width="600px" Height="400px" Title="编辑" />
        <p>WindowField 按当前行拼出窗口地址和标题；新项目优先使用 RenderField.Commands 的窗口命令。</p>
        <f:Label ID="labResult" runat="server" />
    </form>
</body>
</html>
