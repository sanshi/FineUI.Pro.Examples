<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="toolbar_bodypadding.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.toolbar_bodypadding" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>工具栏主体内边距</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="PanelDefault" runat="server" Width="600" Title="默认内边距" ShowBorder="true">
            <Toolbars>
                <f:Toolbar ID="ToolbarDefault" runat="server">
                    <Items>
                        <f:Button ID="FirstDefault" runat="server" Text="第一项" Width="80" />
                        <f:Button ID="LastDefault" runat="server" Text="第二项" Width="120" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
        <br />
        <f:Panel ID="PanelZero" runat="server" Width="600" Title="零内边距：保持默认效果" ShowBorder="true">
            <Toolbars>
                <f:Toolbar ID="ToolbarZero" runat="server" BodyPadding="0">
                    <Items>
                        <f:Button ID="FirstZero" runat="server" Text="第一项" Width="80" />
                        <f:Button ID="LastZero" runat="server" Text="第二项" Width="120" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
        <br />
        <f:Panel ID="PanelLeft" runat="server" Width="600" Title="左对齐：四周 12px" ShowBorder="true">
            <Toolbars>
                <f:Toolbar ID="ToolbarLeft" runat="server">
                    <Items>
                        <f:Button ID="FirstLeft" runat="server" Text="第一项" Width="80" />
                        <f:Button ID="LastLeft" runat="server" Text="第二项" Width="120" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
        <br />
        <f:Panel ID="PanelRight" runat="server" Width="600" Title="右对齐：上下 8px，左右 16px" ShowBorder="true">
            <Toolbars>
                <f:Toolbar ID="ToolbarRight" runat="server" BodyPadding="8px 16px" ToolbarAlign="Right">
                    <Items>
                        <f:Button ID="FirstRight" runat="server" Text="第一项" Width="80" />
                        <f:Button ID="LastRight" runat="server" Text="第二项" Width="120" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
        <br />
        <f:Panel ID="PanelCenter" runat="server" Width="600" Title="居中：四边内边距不同" ShowBorder="true">
            <Toolbars>
                <f:Toolbar ID="ToolbarCenter" runat="server" BodyPadding="3px 17px 11px 29px" ToolbarAlign="Center">
                    <Items>
                        <f:Button ID="FirstCenter" runat="server" Text="第一项" Width="80" />
                        <f:Button ID="LastCenter" runat="server" Text="第二项" Width="120" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
        <br />
        <f:Panel ID="PanelFill" runat="server" Width="600" Title="两个填充项：左中右排列" ShowBorder="true">
            <Toolbars>
                <f:Toolbar ID="ToolbarFill" runat="server" BodyPadding="3px 17px 11px 29px">
                    <Items>
                        <f:Button ID="FirstFill" runat="server" Text="第一项" Width="80" />
                        <f:ToolbarFill ID="FillLeft" runat="server" />
                        <f:Button ID="CenterFill" runat="server" Text="中间项" Width="100" />
                        <f:ToolbarFill ID="FillRight" runat="server" />
                        <f:Button ID="LastFill" runat="server" Text="第二项" Width="120" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
        <br />
        <f:Panel ID="PanelMulti" runat="server" Width="220" Title="窄工具栏自动换行" ShowBorder="true">
            <Toolbars>
                <f:Toolbar ID="ToolbarMulti" runat="server" BodyPadding="3px 17px 11px 29px">
                    <Items>
                        <f:Button ID="FirstMulti" runat="server" Text="第一项" Width="80" />
                        <f:Button ID="LastMulti" runat="server" Text="第二项" Width="120" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
        <br />
        <f:Panel ID="PanelHBox" runat="server" Width="600" Title="显式 HBox 布局" ShowBorder="true">
            <Toolbars>
                <f:Toolbar ID="ToolbarHBox" runat="server" BodyPadding="8px 16px" Layout="HBox" BoxConfigSpace="5">
                    <Items>
                        <f:Button ID="FirstHBox" runat="server" Text="第一项" Width="80" />
                        <f:Button ID="LastHBox" runat="server" Text="第二项" BoxFlex="1" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
        <br />
        <p>BodyPadding 设置工具栏中 <code>.f-panel-body</code> 节点的内边距。例如 <code>8</code> 表示四周各 8px，<code>8px 12px</code> 表示上下各 8px、左右各
            12px。默认不增加该节点的内边距，仅创建控件时生效；工具栏原有的外层内边距仍然保留。</p>
    </form>
</body>
</html>
