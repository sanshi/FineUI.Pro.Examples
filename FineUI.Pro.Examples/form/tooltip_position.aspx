<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tooltip_position.aspx.cs" Inherits="FineUI.Pro.Examples.form.tooltip_position" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <div style="padding: 50px 150px; width: 900px;">
            <table style="width: 100%; border-spacing: 20px;">
                <tr>
                    <td></td>
                    <td style="text-align: center;">
                        <f:Button runat="server" Text="TopStart" ToolTip="这是提示信息" ToolTipType="Qtip" ToolTipPosition="TopStart" Width="100px"></f:Button>
                        <f:Button runat="server" Text="Top" ToolTip="这是提示信息" ToolTipType="Qtip" ToolTipPosition="Top" Width="100px"></f:Button>
                        <f:Button runat="server" Text="TopEnd" ToolTip="这是提示信息" ToolTipType="Qtip" ToolTipPosition="TopEnd" Width="100px"></f:Button>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                        <f:Button runat="server" Text="LeftStart" ToolTipRawHtml="这是提示信息<br>这是第二行提示信息" ToolTipType="Qtip" ToolTipPosition="LeftStart" Width="100px"></f:Button>
                    </td>
                    <td></td>
                    <td style="text-align: left;">
                        <f:Button runat="server" Text="RightStart" ToolTipRawHtml="这是提示信息<br>这是第二行提示信息" ToolTipType="Qtip" ToolTipPosition="RightStart" Width="100px"></f:Button>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                        <f:Button runat="server" Text="Left" ToolTipRawHtml="这是提示信息<br>这是第二行提示信息" ToolTipType="Qtip" ToolTipPosition="Left" Width="100px"></f:Button>
                    </td>
                    <td></td>
                    <td style="text-align: left;">
                        <f:Button runat="server" Text="Right" ToolTipRawHtml="这是提示信息<br>这是第二行提示信息" ToolTipType="Qtip" ToolTipPosition="Right" Width="100px"></f:Button>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                        <f:Button runat="server" Text="LeftEnd" ToolTipRawHtml="这是提示信息<br>这是第二行提示信息" ToolTipType="Qtip" ToolTipPosition="LeftEnd" Width="100px"></f:Button>
                    </td>
                    <td></td>
                    <td style="text-align: left;">
                        <f:Button runat="server" Text="RightEnd" ToolTipRawHtml="这是提示信息<br>这是第二行提示信息" ToolTipType="Qtip" ToolTipPosition="RightEnd" Width="100px"></f:Button>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: center;">
                        <f:Button runat="server" Text="BottomStart" ToolTip="这是提示信息" ToolTipType="Qtip" ToolTipPosition="BottomStart" Width="100px"></f:Button>
                        <f:Button runat="server" Text="Bottom" ToolTip="这是提示信息" ToolTipType="Qtip" ToolTipPosition="Bottom" Width="100px"></f:Button>
                        <f:Button runat="server" Text="BottomEnd" ToolTip="这是提示信息" ToolTipType="Qtip" ToolTipPosition="BottomEnd" Width="100px"></f:Button>
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>


    </form>
</body>
</html>
