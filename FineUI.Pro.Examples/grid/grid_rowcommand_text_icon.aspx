<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_text_icon.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_text_icon" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" IsFluid="true" Title="行命令文本与图标" ShowBorder="true" ShowHeader="true" DataIDField="Id" DataKeyNames="Id,Name"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" ExpandUnusedSpace="true" />
                <f:RenderField ColumnID="Actions" Width="260px" TextAlign="Center" HeaderText="操作">
                    <Commands>
                        <f:Command CommandName="EncodedText" Text="&lt;普通文本&gt;" />
                        <f:Command CommandName="TrustedText" Text="&lt;strong&gt;可信 HTML&lt;/strong&gt;" TextRaw="true" />
                        <f:Command CommandName="ImageIcon" Icon="Pencil" ToolTip="图片图标" />
                        <f:Command CommandName="FontIcon" IconFont="_Close" IconFontClass="text-danger" ToolTip="字体图标" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />普通文本默认编码；只有显式 TextRaw="true" 的开发者可信文本才原样输出。<br />
        <f:Label ID="labResult" EncodeText="false" runat="server" />
    </form>
</body>
</html>
