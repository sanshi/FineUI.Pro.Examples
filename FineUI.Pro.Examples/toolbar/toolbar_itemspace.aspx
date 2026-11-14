<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="toolbar_itemspace.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.toolbar_itemspace" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="PanelExample1" IsFluid="true" ShowBorder="true" BodyPadding="10px" Title="面板" EnableCollapse="false"
            runat="server">
            <Toolbars>
                <f:Toolbar ID="ToolbarExample1" ItemSpace="0" runat="server">
                    <Items>
                        <f:Button ID="Button1" runat="server" Text="按钮一"></f:Button>
                        <f:Button ID="Button2" runat="server" Text="按钮二"></f:Button>
                        <f:Button ID="Button3" runat="server" Text="按钮三"></f:Button>
                    </Items>
                </f:Toolbar>
                <f:Toolbar runat="server">
                    <Items>
                        <f:Button ID="Button4" runat="server" Text="按钮四"></f:Button>
                        <f:Button ID="Button5" runat="server" Text="按钮五"></f:Button>
                        <f:Button ID="Button6" runat="server" Text="按钮六"></f:Button>
                    </Items>
                </f:Toolbar>
                <f:Toolbar ID="ToolbarExample3" ItemSpace="16" runat="server">
                    <Items>
                        <f:Button ID="Button7" runat="server" Text="按钮七"></f:Button>
                        <f:Button ID="Button8" runat="server" Text="按钮八"></f:Button>
                        <f:Button ID="Button9" runat="server" Text="按钮九"></f:Button>
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
    <p>演示改变工具栏相邻子项之间的间隔，分别对照不同间距。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>比较相邻项目距离</h3>
    <ul>
        <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample1").ClientID %>' title="面板">面板</strong>及本页其它工具栏中各按钮之间的空隙。<br />结果：项目按本页设置的间距排列；间距改变不会调整按钮自身的文字与宽度。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>ItemSpace</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ToolbarExample1").ClientID %>' title="第 1 个工具栏">第 1 个工具栏</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ToolbarExample3").ClientID %>' title="第 3 个工具栏">第 3 个工具栏</strong>）：各组分别设为<code>0</code>、<code>16</code>，控制工具栏子项间距，本页各组使用不同值。</li>
    </ul>
</section>
</template>
</body>
</html>
