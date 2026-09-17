<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_tools.aspx.cs" Inherits="FineUI.Pro.Examples.panel.panel_tools" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" Title="面板" Height="350px"
            BodyPadding="10px" EnableCollapse="true" IconUrl="~/res/images/16/8.png">
            <Items>
                <f:Label runat="server" Text="面板内容"></f:Label>
            </Items>
            <Tools>
                <f:Tool runat="server" IconFont="_Gear" ToolTip="设置" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool13" runat="server" IconFont="_Wrench" ToolTip="设置" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool1" runat="server" IconFont="_Download" ToolTip="下载" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool3" runat="server" IconFont="_Upload" ToolTip="上传" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool2" runat="server" IconFont="_Print" ToolTip="打印" ClickHandler="onToolIconClick"></f:Tool>

                <f:Tool ID="Tool4" runat="server" IconFont="_Save" ToolTip="保存" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool18" runat="server" IconFont="_Plus" ToolTip="新增" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool10" runat="server" IconFont="_Edit" ToolTip="编辑" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool5" runat="server" IconFont="_Minus" ToolTip="删除" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool14" runat="server" IconFont="_Trash" ToolTip="删除" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool15" runat="server" IconFont="_Close" ToolTip="删除" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool6" runat="server" IconFont="_SignIn" ToolTip="登陆" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool11" runat="server" IconFont="_PowerOff" ToolTip="退出" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool9" runat="server" IconFont="_Question" ToolTip="帮助" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool20" runat="server" IconFont="_Info" ToolTip="详细" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool12" runat="server" IconFont="_Search" ToolTip="搜索" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool17" runat="server" IconFont="_Key" ToolTip="授权" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool7" runat="server" IconFont="_User" ToolTip="用户" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool19" runat="server" IconFont="_Group" ToolTip="分组" ClickHandler="onToolIconClick"></f:Tool>
            </Tools>
        </f:Panel>
        <br />
        <f:Button ID="Button2" CssClass="marginr" Text="检查面板的折叠状态" runat="server" OnClick="Button2_Click">
        </f:Button>
    </form>
    <script>

        function onToolIconClick(event) {
            // 当前点击的图标字体
            var iconFont = this.iconFont;

            F.notify({
                message: '你点击了标题栏工具图标：' + iconFont,
                messageIconFont: iconFont,
                displayMilliseconds: 300000,
                positionX: 'center',
                positionY: 'center'
            });
        }

    </script>
</body>
</html>
