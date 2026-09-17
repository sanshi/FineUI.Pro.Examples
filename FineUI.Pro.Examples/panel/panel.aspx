<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel.aspx.cs" Inherits="FineUI.Pro.Examples.panel.panel" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" Title="面板"
            BodyPadding="10px" EnableCollapse="true" IconFont="_VolumeUp">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Position="Top" runat="server">
                    <Items>
                        <f:ToolbarText Text="工具条文本一" ID="ToolbarText1" runat="server">
                        </f:ToolbarText>
                        <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                        </f:ToolbarSeparator>
                        <f:ToolbarText Text="工具条文本二" ID="ToolbarText2" runat="server">
                        </f:ToolbarText>
                        <f:ToolbarSeparator ID="ToolbarSeparator2" runat="server">
                        </f:ToolbarSeparator>
                        <f:Button ID="btnToolbarButton" Text="工具条按钮" runat="server" ClickHandler="onToolbarButtonClick">
                        </f:Button>
                        <f:ToolbarFill ID="ToolbarFill1" runat="server">
                        </f:ToolbarFill>
                        <f:ToolbarText Text="工具条文本四" ID="ToolbarText4" runat="server">
                        </f:ToolbarText>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:ContentPanel ID="ContentPanel1" Title="内容面板" ShowBorder="true" Height="200px" Icon="TagBlue"
                    BodyPadding="10px" EnableCollapse="true" ShowHeader="true" AutoScroll="true"
                    runat="server">
                    可以在此放置Asp.Net控件或者<a href="http://www.w3schools.com/html/" target="_blank">HTML</a>标签。
                </f:ContentPanel>
            </Items>
        </f:Panel>
        <br />
        <f:Button ID="Button2" CssClass="marginr" Text="检查面板的折叠状态" runat="server" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button4" Text="更新面板的标题" runat="server" OnClick="Button4_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button3" Text="展开/折叠内容面板" runat="server" OnClick="Button3_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button5" CssClass="marginr" Text="更新工具条文本一的值" runat="server" OnClick="Button5_Click">
        </f:Button>
        <f:Button ID="Button6" Text="显示/隐藏工具条文本一" runat="server" OnClick="Button6_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button7" Text="隐藏工具栏" CssClass="marginr" runat="server" OnClick="Button7_Click">
        </f:Button>
        <f:Button ID="Button8" Text="显示工具栏" runat="server" OnClick="Button8_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button9" Text="点击修改面板图标（在三个图标之前切换）" CssClass="marginr" runat="server" OnClick="Button9_Click">
        </f:Button>
        <f:Button ID="Button10" Text="清空面板图标" CssClass="marginr" runat="server" OnClick="Button10_Click">
        </f:Button>
    </form>
    <script>

        function onToolbarButtonClick(event) {
            F.alert({
                message: '你点击了工具栏按钮',
                messageIcon: 'information'
            });
        }

    </script>
</body>
</html>
