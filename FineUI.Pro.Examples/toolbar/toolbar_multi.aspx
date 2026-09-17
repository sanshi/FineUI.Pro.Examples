<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="toolbar_multi.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.toolbar_multi" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel IsFluid="true" ShowBorder="true" BodyPadding="10px" Height="500px" Title="面板" EnableCollapse="false"
            runat="server" AutoScroll="true">
            <Toolbars>
                <f:Toolbar runat="server">
                    <Items>
                        <f:Button ID="Button6" runat="server" Text="第一行工具栏中的按钮，靠左显示"></f:Button>
                    </Items>
                </f:Toolbar>
                <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Center">
                    <Items>
                        <f:Button runat="server" Text="第二行工具栏中的按钮，居中显示"></f:Button>
                    </Items>
                </f:Toolbar>
                <f:Toolbar ID="Toolbar2" runat="server" ToolbarAlign="Right">
                    <Items>
                        <f:Button ID="Button1" runat="server" Text="第三行工具栏中的按钮，靠右显示"></f:Button>
                    </Items>
                </f:Toolbar>
                <f:Toolbar ID="Toolbar3" runat="server" Position="Bottom" ToolbarAlign="Right">
                    <Items>
                        <f:Button ID="Button2" runat="server" Text="第一行底部工具栏中的按钮"></f:Button>
                        <f:ToolbarSeparator runat="server"></f:ToolbarSeparator>
                        <f:Button ID="Button4" runat="server" Text="按钮二"></f:Button>
                    </Items>
                </f:Toolbar>
                <f:Toolbar ID="Toolbar4" runat="server" Position="Bottom" ToolbarAlign="Center">
                    <Items>
                        <f:Button ID="Button3" runat="server" Text="第二行底部工具栏中的按钮，居中显示"></f:Button>
                    </Items>
                </f:Toolbar>
                <f:Toolbar ID="Toolbar5" runat="server" Position="Bottom" ToolbarAlign="Right">
                    <Items>
                        <f:Button ID="Button7" runat="server" Text="第三行底部工具栏中的按钮，左右显示"></f:Button>
                        <f:ToolbarFill ID="ToolbarFill1" runat="server"></f:ToolbarFill>
                        <f:Button ID="Button5" runat="server" Text="第三行底部工具栏中的按钮，左右显示"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
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
        </f:Panel>

    </form>
</body>
</html>
