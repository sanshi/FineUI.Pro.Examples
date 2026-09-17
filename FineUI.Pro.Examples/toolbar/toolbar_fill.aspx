<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="toolbar_fill.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.toolbar_fill" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" ShowBorder="true" BodyPadding="10px" Title="面板" EnableCollapse="false"
            runat="server">
            <Toolbars>
                <f:Toolbar runat="server">
                    <Items>
                        <f:Button ID="Button1" runat="server" Text="按钮一"></f:Button>
                        <f:ToolbarFill ID="ToolbarFill1" runat="server"></f:ToolbarFill>
                        <f:Button ID="Button2" runat="server" Text="按钮二"></f:Button>
                    </Items>
                </f:Toolbar>
                <f:Toolbar runat="server">
                    <Items>
                        <f:Button ID="Button3" runat="server" Text="按钮三"></f:Button>
                        <f:ToolbarFill ID="ToolbarFill2" runat="server"></f:ToolbarFill>
                        <f:Button ID="Button4" runat="server" Text="按钮四"></f:Button>
                        <f:ToolbarFill ID="ToolbarFill3" runat="server"></f:ToolbarFill>
                        <f:Button ID="Button5" runat="server" Text="按钮五"></f:Button>
                    </Items>
                </f:Toolbar>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:TextBox ID="TextBox6" runat="server" EmptyText="文本输入框" Width="100px"></f:TextBox>
                        <f:ToolbarFill ID="ToolbarFill4" runat="server"></f:ToolbarFill>
                        <f:Button ID="Button7" runat="server" Text="按钮七"></f:Button>
                        <f:ToolbarFill ID="ToolbarFill5" runat="server"></f:ToolbarFill>
                        <f:TextBox ID="TextBox1" runat="server" EmptyText="文本输入框二" Width="200px"></f:TextBox>
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
        <br />
        <f:Button runat="server" ID="btnHideFill1" Text="显示隐藏[按钮一]和后面的ToolbarFill" OnClick="btnHideFill1_Click"></f:Button>
        <br />
        <br />
        <f:Button runat="server" ID="btnHideFill2" Text="显示隐藏[按钮七]后面的ToolbarFill" OnClick="btnHideFill2_Click"></f:Button>
    </form>
</body>
</html>
