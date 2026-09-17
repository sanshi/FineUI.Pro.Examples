<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_height_autosize.aspx.cs" Inherits="FineUI.Pro.Examples.window.window_height_autosize" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="btnShowWindow" Text="显示窗体" runat="server" ClickHandler="onShowWindowClick">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnCloseWindow" Text="关闭窗体" runat="server" ClickHandler="onCloseWindowClick">
        </f:Button>
        <br />
        <br />
        注：改变页面大小，观察窗体的高度变化。
        <ul>
            <li>窗体设置KeepLastSize=true，以便在窗体处于隐藏状态时，改变其高度有效</li>
        </ul>
        <br />
        <br />
        <f:Window ID="Window1" Width="650px" Icon="TagBlue" Title="窗体" Hidden="true"
            EnableMaximize="false" EnableCollapse="false" runat="server" EnableResize="false" FixedPosition="true"
            IsModal="false" AutoScroll="true" BodyPadding="10px" KeepLastSize="true">
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
        </f:Window>
    </form>
    <script>
        var Window1ClientID = '<%= Window1.ClientID %>';

        function onShowWindowClick(event) {
            F(Window1ClientID).show();
        }

        function onCloseWindowClick(event) {
            F(Window1ClientID).hide();
        }


        var window1ClientID = '<%= Window1.ClientID %>';

        F.ready(function () {

            var window1 = F(window1ClientID);
            if (!window1) return;

            function resetWindow1Height() {

                // 清空左上角定位
                window1.top = undefined;
                window1.left = undefined;

                // 改变高度
                window1.setHeight($(window).height() - 50);

            }

            // 页面加载完毕后，首先对窗体进行高度设置
            resetWindow1Height();

            // 页面大小改变事件
            F.windowResize(function () {

                resetWindow1Height();

            });

        });

    </script>
</body>
</html>
