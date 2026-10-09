<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_position.aspx.cs" Inherits="FineUI.Pro.Examples.window.window_position" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">
        <style>
            body {
                background: url('<%= PageContext.ResolveUrl("~/res/images/bg/small/3.jpg") %>') !important;
            }

        </style>
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <div style="height: 1200px;">
        </div>

        <f:Window ID="Window1" Width="200px" Height="80px" PositionX="Left" PositionY="Top" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Left" PositionY="Top"
            </Content>
        </f:Window>

        <f:Window ID="Window2" Width="200px" Height="80px" PositionX="Left" PositionY="Center" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Left" PositionY="Center"
            </Content>
        </f:Window>

        <f:Window ID="Window3" Width="200px" Height="80px" PositionX="Left" PositionY="Bottom" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Left" PositionY="Bottom"
            </Content>
        </f:Window>


        <f:Window ID="Window4" Width="200px" Height="80px" PositionX="Center" PositionY="Top" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Center" PositionY="Top"
            </Content>
        </f:Window>

        <f:Window ID="Window5" Width="200px" Height="80px" PositionX="Center" PositionY="Center" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Center" PositionY="Center"
            </Content>
        </f:Window>

        <f:Window ID="Window6" Width="200px" Height="80px" PositionX="Center" PositionY="Bottom" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Center" PositionY="Bottom"
            </Content>
        </f:Window>

        <f:Window ID="Window7" Width="200px" Height="80px" PositionX="Right" PositionY="Top" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Right" PositionY="Top"
            </Content>
        </f:Window>

        <f:Window ID="Window8" Width="200px" Height="80px" PositionX="Right" PositionY="Center" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Right" PositionY="Center"
            </Content>
        </f:Window>

        <f:Window ID="Window9" Width="200px" Height="80px" PositionX="Right" PositionY="Bottom" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Right" PositionY="Bottom"
            </Content>
        </f:Window>


    </form>
</body>
</html>
