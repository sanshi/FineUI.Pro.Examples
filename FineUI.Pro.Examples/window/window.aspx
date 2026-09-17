<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window.aspx.cs" Inherits="FineUI.Pro.Examples.window.window" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="btnShowInServer" CssClass="marginr" Text="显示窗体（服务端代码）" runat="server"
            OnClick="btnShowInServer_Click">
        </f:Button>
        <f:Button ID="btnHideInServer" Text="隐藏窗体（服务端代码）" runat="server" OnClick="btnHideInServer_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnShowInClient" CssClass="marginr" Text="显示窗体（客户端代码）"
            runat="server" ClickHandler="onShowInClientClick">
        </f:Button>
        <f:Button ID="btnHideInClient" CssClass="marginr" Text="隐藏窗体（客户端代码）"
            runat="server" ClickHandler="onHideInClientClick">
        </f:Button>
        <f:Button ID="btnHideInClient2" Text="隐藏窗体，带回发参数（客户端代码）"
            runat="server" ClickHandler="onHideInClient2Click">
        </f:Button>
        <br />
        <br />
        <f:Window ID="Window2" Width="650px" Height="300px" Icon="TagBlue" Title="窗体"
            EnableMaximize="true" EnableCollapse="true" runat="server" EnableResize="true" 
            IsModal="false" CloseAction="HidePostBack" OnClose="Window2_Close" AutoScroll="true" BodyPadding="10px">
            <Content>
                <p>
                    <a href="http://tech.163.com/special/jobsdead/" target="_blank"><b>乔布斯</b></a>
                </p>
                <p>
                    乔布斯于1955年2月24日出生，苹果创始人之一。今年8月苹果超越埃克森美孚成为全球最大市值企业，截止上季度持有现金达到762亿美金，甚至超过了美国政府国库存款。 
                </p>
                <p>
                    遗憾的是，苹果的取得巨大成功还是无法给乔布斯一个健康的身体，乔布斯2003年被发现患有胰脏癌，随后又查出肝癌，危在旦夕的乔布斯在经历了8年的抗癌斗争、3次病休、若干次手术后，于2011年8月25日正式宣布从CEO位置辞职。2011年10月6日，乔布斯在苹果发布iPhone 4S后的第二天与世长辞。
                </p>
            </Content>
            <Listeners>
                <f:Listener Event="resize" Handler="onWindowResize" />
            </Listeners>
        </f:Window>
    </form>
    <script>
        var Window2ClientID = '<%= Window2.ClientID %>';

        function onShowInClientClick(event) {
            F(Window2ClientID).show();
        }

        function onHideInClientClick(event) {
            F(Window2ClientID).hide();
        }

        function onHideInClient2Click(event) {
            F(Window2ClientID).hidePostBack('btnHideInClient2');
        }


        // Window窗体大小改变的客户端事件
        function onWindowResize(event) {
            var el = this.el;
            F.notify("窗体大小改变，宽度：" + el.width() + " 高度：" + el.height());
        }

    </script>
</body>
</html>
