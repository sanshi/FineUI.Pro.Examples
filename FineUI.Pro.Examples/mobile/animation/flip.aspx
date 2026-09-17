<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="flip.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.animation.flip" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" runat="server" ShowHeader="false" ShowBorder="false" Layout="VBox" BoxConfigChildMargin="0 0 10 0" 
            BodyPadding="10px" IsViewPort="true">
            <Toolbars>
                <f:Toolbar runat="server" Title="翻转动画" HeaderStyle="true">
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:ContentPanel runat="server" ShowBorder="false" ShowHeader="false">
                    <p>
                        <a href="http://baike.baidu.com/view/3645.htm" target="_blank"><b>比尔·盖茨</b></a>
                    </p>
                    <p>
                        比尔·盖茨（Bill Gates），全名威廉·亨利·盖茨三世，简称比尔或盖茨。1955年10月28日出生于美国华盛顿州西雅图，13岁开始计算机编程设计，18岁考入哈佛大学，一年后从哈佛退学，1975年与好友保罗·艾伦一起创办了微软公司，比尔盖茨担任微软公司董事长、CEO和首席软件设计师。
                    </p>
                    <p>
                        比尔·盖茨1995-2007年连续13年成为《福布斯》全球富翁榜首富，连续20年成为《福布斯》美国富翁榜首富。
                    </p>
                </f:ContentPanel>
                <f:Button ID="Button1" runat="server" Text="转到面板 2" MarginBottom="10" ClickHandler="onGotoPanel2Click"></f:Button>
            </Items>
        </f:Panel>
        <f:Panel ID="Panel2" runat="server" ShowHeader="false" ShowBorder="false" Hidden="true"
            BodyPadding="10px" IsViewPort="true" Layout="Fit">
            <Toolbars>
                <f:Toolbar runat="server" Title="Panel2" HeaderStyle="true">
                    <Items>
                        <f:Button ID="Button4" runat="server" Size="Small" Text="后退" ClickHandler="onBacktoPanel1Click"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:ContentPanel runat="server" ShowBorder="false" ShowHeader="false">
                    <p>
                        <a href="http://tech.163.com/special/jobsdead/" target="_blank"><b>乔布斯</b></a>
                    </p>
                    <p>
                        乔布斯于1955年2月24日出生，苹果创始人之一。今年8月苹果超越埃克森美孚成为全球最大市值企业，截止上季度持有现金达到762亿美金，甚至超过了美国政府国库存款。 
                    </p>
                    <p>
                        遗憾的是，苹果的取得巨大成功还是无法给乔布斯一个健康的身体，乔布斯2003年被发现患有胰脏癌，随后又查出肝癌，危在旦夕的乔布斯在经历了8年的抗癌斗争、3次病休、若干次手术后，于2011年8月25日正式宣布从CEO位置辞职。2011年10月6日，乔布斯在苹果发布iPhone 4S后的第二天与世长辞。
                    </p>
                </f:ContentPanel>
            </Items>
        </f:Panel>
    </form>
    <script>

        var panel1 = '<%= Panel1.ClientID %>';
        var panel2 = '<%= Panel2.ClientID %>';

        function onGotoPanel2Click(event) {
            F.flip(panel1, panel2);
        }

        function onBacktoPanel1Click(event) {
            F.flip(panel2, panel1);
        }

    </script>
</body>
</html>
