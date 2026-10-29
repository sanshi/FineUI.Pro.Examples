<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_window.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_window" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>行命令弹窗</title>
    <meta name="sourcefiles" content="~/grid/grid_rowcommand_window_details.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" Title="客户列表" ShowHeader="true" ShowBorder="true" IsFluid="true" DataIDField="ID">
            <Columns>
                <f:RenderField HeaderText="客户编号" DataField="ID" Width="150px" />
                <f:RenderField HeaderText="客户标识" DataField="Slug" Width="220px" />
                <f:RenderField HeaderText="客户姓名" DataField="DisplayName" Width="150px" />
                <f:RenderField HeaderText="操作" ExpandUnusedSpace="true">
                    <Commands>
                        <f:Command Text="查看客户" CommandName="View" WindowID="Details" WindowIFrameUrlFormatString="grid_rowcommand_window_details.aspx?slug={0}"
                            WindowIFrameUrlFields="Slug" WindowTitleFormatString="客户 - {0}" WindowTitleFields="DisplayName" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <f:Window ID="Details" runat="server" Title="客户详情" Width="500px" Height="300px" IsModal="true" EnableIFrame="true" Hidden="true" />

        <p>点击“查看客户”打开该行的客户详情：网址参数取自 <code>Slug</code>，窗体标题取自 <code>DisplayName</code>。</p>
    </form>
</body>
</html>
