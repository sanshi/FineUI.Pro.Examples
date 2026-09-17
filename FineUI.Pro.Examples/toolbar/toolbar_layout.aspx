<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="toolbar_layout.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.toolbar_layout" %>

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
                <f:Toolbar runat="server" Layout="HBox">
                    <Items>
                        <f:Button ID="Button1" runat="server" Text="按钮一" BoxFlex="1" MarginRight="5px"></f:Button>
                        <f:Button ID="Button2" runat="server" Text="按钮二" BoxFlex="1"></f:Button>
                    </Items>
                </f:Toolbar>
                <f:Toolbar runat="server" Layout="Fit">
                    <Items>
                        <f:ButtonGroup runat="server" Layout="HBox">
                            <f:Button ID="Button5" runat="server" Text="按钮三" BoxFlex="1"></f:Button>
                            <f:Button ID="Button7" runat="server" Text="按钮四" BoxFlex="1"></f:Button>
                            <f:Button ID="Button9" runat="server" Text="按钮五" BoxFlex="1"></f:Button>
                        </f:ButtonGroup>
                    </Items>
                </f:Toolbar>
                <f:Toolbar runat="server" Layout="HBox">
                    <Items>
                        <f:ButtonGroup runat="server" MarginRight="10px">
                            <f:Button ID="Button3" runat="server" Text="按钮三"></f:Button>
                            <f:Button ID="Button4" runat="server" Text="按钮四"></f:Button>
                            <f:Button ID="Button6" runat="server" Text="按钮五"></f:Button>
                        </f:ButtonGroup>
                        <f:CheckBoxList ID="CheckBoxList3" runat="server" BoxFlex="1">
                            <f:CheckItem Text="可选项 1" Value="value1" />
                            <f:CheckItem Text="可选项 2" Value="value2" Selected="true" />
                            <f:CheckItem Text="可选项 3" Value="value3" Selected="true" />
                        </f:CheckBoxList>
                    </Items>
                </f:Toolbar>
                <f:Toolbar runat="server" Layout="HBox">
                    <Items>
                        <f:ButtonGroup runat="server" Width="300px" Layout="HBox" MarginRight="10px">
                            <f:Button ID="Button8" runat="server" IconFont="_Apple" Text="按钮六" BoxFlex="1"></f:Button>
                            <f:Button ID="Button10" runat="server" IconFont="_Windows" Text="按钮七" BoxFlex="1"></f:Button>
                            <f:Button ID="Button11" runat="server" Icon="Book" Text="按钮八" BoxFlex="1"></f:Button>
                        </f:ButtonGroup>
                        <f:CheckBoxList ID="CheckBoxList2" runat="server" BoxFlex="1">
                            <f:CheckItem Text="可选项 1" Value="value1" />
                            <f:CheckItem Text="可选项 2" Value="value2" Selected="true" />
                            <f:CheckItem Text="可选项 3" Value="value3" Selected="true" />
                        </f:CheckBoxList>
                    </Items>
                </f:Toolbar>
                <f:Toolbar ID="Toolbar1" runat="server" Layout="HBox">
                    <Items>
                        <f:TextBox ID="TextBox2" runat="server" EmptyText="文本输入框" Width="100px" MarginRight="5px"></f:TextBox>
                        <f:TextBox ID="TextBox1" runat="server" EmptyText="文本输入框" Width="100px" MarginRight="10px"></f:TextBox>
                        <f:CheckBoxList ID="CheckBoxList1" runat="server" BoxFlex="1">
                            <f:CheckItem Text="可选项 1" Value="value1" />
                            <f:CheckItem Text="可选项 2" Value="value2" Selected="true" />
                            <f:CheckItem Text="可选项 3" Value="value3" Selected="true" />
                        </f:CheckBoxList>
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
