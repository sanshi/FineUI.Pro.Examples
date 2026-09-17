<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="toolbar_icontop.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.toolbar_icontop" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" ShowBorder="true" BodyPadding="10px" Title="面板" EnableCollapse="false" runat="server">
            <Toolbars>
                <f:Toolbar runat="server" CssClass="f-state-default">
                    <Items>
                        <f:Button ID="Button1" runat="server" IconAlign="Top" EnableDefaultState="false" IconFont="_Refresh" Text="刷新"></f:Button>
                        <f:Button ID="Button2" Enabled="false" IconAlign="Top" EnableDefaultState="false" runat="server" IconFont="_Folder" Text="新建文件夹">
                        </f:Button>
                        <f:Button ID="Button3" IconAlign="Top" EnableDefaultState="false" runat="server" IconFont="_File" Text="新建文件"></f:Button>
                        <f:Button ID="Button5" runat="server" IconAlign="Top" EnableDefaultState="false" IconFont="_Download" Text="下载"></f:Button>
                        <f:FileUpload runat="server" ID="filePhoto" ButtonIconFont="_Upload" ButtonOnly="true" ButtonText="上传" ButtonIconAlign="Top"
                            ButtonDefaultState="false" OnFileSelected="filePhoto_FileSelected">
                        </f:FileUpload>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Content>
                <f:Image ID="imgPhoto" ImageHeight="150px" ShowLabel="false" ImageUrl="~/res/images/blank.png" runat="server">
                </f:Image>
                <p>
                    <a href="http://tech.163.com/special/jobsdead/" target="_blank"><b>乔布斯</b></a>
                </p>
                <p>
                    乔布斯于1955年2月24日出生，苹果创始人之一。今年8月苹果超越埃克森美孚成为全球最大市值企业，截止上季度持有现金达到762亿美金，甚至超过了美国政府国库存款。
                </p>
                <p>
                    遗憾的是，苹果的取得巨大成功还是无法给乔布斯一个健康的身体，乔布斯2003年被发现患有胰脏癌，随后又查出肝癌，危在旦夕的乔布斯在经历了8年的抗癌斗争、3次病休、若干次手术后，于2011年8月25日正式宣布从CEO位置辞职。2011年10月6日，乔布斯在苹果发布iPhone
                    4S后的第二天与世长辞。
                </p>
            </Content>
        </f:Panel>
    </form>
</body>
</html>
