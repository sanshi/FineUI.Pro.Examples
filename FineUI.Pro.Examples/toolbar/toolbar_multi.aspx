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
        <f:Panel ID="PanelExample1" ClientIDMode="Static" IsFluid="true" ShowBorder="true" BodyPadding="10px" Height="500px" Title="面板" EnableCollapse="false"
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
<template id="example-description">
<section aria-label="页面描述">
    <p>演示在同一面板的上方和下方放置多行工具栏，并分别控制对齐方式。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照各行工具栏</h3>
    <ul>
        <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample1").ClientID %>' title="面板">面板</strong>上方、下方的多行按钮。<br />结果：工具栏按声明顺序逐行排列，各行可以分别左对齐、居中或右对齐。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Position</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Toolbar3").ClientID %>' title="第 4 个工具栏">第 4 个工具栏</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Toolbar4").ClientID %>' title="第 5 个工具栏">第 5 个工具栏</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Toolbar5").ClientID %>' title="第 6 个工具栏">第 6 个工具栏</strong>）：设为<code>Bottom</code>，本页组合顶部和底部工具栏。</li>
        <li><code>ToolbarAlign</code>（本页各工具栏，如<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Toolbar1").ClientID %>' title="第 2 个工具栏">第 2 个工具栏</strong>）：各组分别设为<code>Center</code>、<code>Right</code>，分别控制每一行的按钮对齐。</li>
        <li><code>ToolbarFill</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ToolbarFill1").ClientID %>' title="ToolbarFill">ToolbarFill</strong>）：填充项把同一行中的按钮分到两端。</li>
    </ul>
</section>
</template>
</body>
</html>
