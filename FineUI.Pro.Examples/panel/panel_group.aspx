<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_group.aspx.cs" Inherits="FineUI.Pro.Examples.panel.panel_group" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" BodyPadding="10" EnableCollapse="true" Title="面板（自动高度）" runat="server">
            <Items>
                <f:GroupPanel Title="分组面板一" BodyPadding="10" ID="GroupPanel1" EnableCollapse="true" Collapsed="true" runat="server">
                    <Items>
                        <f:SimpleForm ID="SimpleForm1" ShowBorder="false" ShowHeader="false" runat="server">
                            <Items>
                                <f:TextBox ID="TextBox1" Label="名称" runat="server">
                                </f:TextBox>
                                <f:TextArea ID="TextArea1" Label="备注" runat="server"></f:TextArea>
                            </Items>
                        </f:SimpleForm>
                    </Items>
                </f:GroupPanel>
                <f:GroupPanel ID="GroupPanel2" Title="分组面板二" runat="server" EnableCollapse="true">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar1" Position="Bottom" runat="server">
                            <Items>
                                <f:Button ID="Button3" Text="左侧的按钮" runat="server"></f:Button>
                                <f:ToolbarFill ID="ToolbarFill1" runat="server"></f:ToolbarFill>
                                <f:Button ID="Button1" Text="右侧的按钮" runat="server"></f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Items>
                        <f:ContentPanel ID="ContentPanel1" BodyPadding="10" ShowBorder="false" ShowHeader="false" runat="server">
                            <a href="http://tech.163.com/special/jobsdead/" target="_blank"><b>乔布斯</b></a><br />
                            <div>
                                <p>
                                    乔布斯于1955年2月24日出生，苹果创始人之一。今年8月苹果超越埃克森美孚成为全球最大市值企业，截止上季度持有现金达到762亿美金，甚至超过了美国政府国库存款。 
                                </p>
                                <p>
                                    遗憾的是，苹果的取得巨大成功还是无法给乔布斯一个健康的身体，乔布斯2003年被发现患有胰脏癌，随后又查出肝癌，危在旦夕的乔布斯在经历了8年的抗癌斗争、3次病休、若干次手术后，于2011年8月25日正式宣布从CEO位置辞职。2011年10月6日，乔布斯在苹果发布iPhone 4S后的第二天与世长辞。
                                </p>
                            </div>
                        </f:ContentPanel>
                    </Items>
                </f:GroupPanel>
            </Items>
        </f:Panel>
        <br />
        <f:Button ID="Button2" Text="展开/折叠分组面板二" OnClick="Button2_Click" runat="server">
        </f:Button>


    </form>
</body>
</html>
