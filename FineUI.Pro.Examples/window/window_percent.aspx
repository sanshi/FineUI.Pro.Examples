<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_percent.aspx.cs" Inherits="FineUI.Pro.Examples.window.window_percent" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="btnShowInClient" Text="显示窗体"
            runat="server" ClickHandler="onShowInClientClick">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnHideInClient" Text="隐藏窗体"
            runat="server" ClickHandler="onHideInClientClick">
        </f:Button>

        <f:Window ID="Window2" Icon="TagBlue" Title="窗体（PercentWidth=50% PercentHeight=50%）" PercentWidth="50%" PercentHeight="50%"
            runat="server" IsModal="false" AutoScroll="true" BodyPadding="10px">
            <Content>
                <p>
                    <a href="http://tech.163.com/special/jobsdead/" target="_blank"><b>乔布斯</b></a>
                </p>
                <p>
                    乔布斯于1955年2月24日出生，苹果创始人之一。今年8月苹果超越埃克森美孚成为全球最大市值企业，截止上季度持有现金达到762亿美金，甚至超过了美国政府国库存款。 
                </p>
            </Content>
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

    </script>
</body>
</html>
