<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_iframe.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.button_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_iframe_window.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="Button1" runat="server" Text="在本页面弹出IFrame窗体" ClickHandler="onOpenWindow1Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button2" runat="server" Text="在父页面弹出IFrame窗体" ClickHandler="onOpenWindow2Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" CssStyle="font-weight:bold;" runat="server">
        </f:Label>
		<br>
		<br>
		注：
		<ul>
			<li>
				点击窗体一的右上角关闭图标时，只是简单的隐藏窗体；
			</li>
			<li>
				点击窗体二的右上角关闭图标时，会触发 OnClose 事件（CloseAction=HidePostBack）。
			</li>
		</ul>
		
        <f:Window ID="Window1" IconUrl="~/res/images/16/10.png" runat="server" Hidden="true"
            WindowPosition="Center" IsModal="true" Title="窗体一" EnableMaximize="true"
            EnableResize="true" Target="Self" EnableIFrame="true"
            Height="550px" Width="850px" OnClose="Window1_Close">
        </f:Window>
        <f:Window ID="Window2" IconUrl="~/res/images/16/11.png" runat="server" Hidden="true"
            IsModal="true" Target="Parent" EnableMaximize="true" EnableResize="true" OnClose="Window2_Close"
            Title="窗体二" CloseAction="HidePostBack"
            EnableIFrame="true" Height="550px" Width="850px">
        </f:Window>
    </form>
    <script>

        var Window1ClientID = '<%= Window1.ClientID %>';
        var Window2ClientID = '<%= Window2.ClientID %>';

        function onOpenWindow1Click(event) {
            F(Window1ClientID).show('<%= ResolveUrl("~/grid/grid_iframe_window.aspx") %>', '弹出窗口一');
        }

        function onOpenWindow2Click(event) {
            F(Window2ClientID).show('<%= ResolveUrl("~/grid/grid_iframe_window.aspx") %>', '弹出窗口二');
        }

    </script>
</body>
</html>
