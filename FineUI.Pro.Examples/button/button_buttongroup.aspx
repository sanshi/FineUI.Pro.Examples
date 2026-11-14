<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_buttongroup.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_buttongroup" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:ButtonGroup ID="ButtonGroupExample1" runat="server">
            <f:Button ID="btnIcon1" Text="图标在左侧" Icon="Email" runat="server" />
            <f:Button ID="btnIcon2" Text="图标在右侧" IconAlign="Right" Icon="Star" runat="server" />
            <f:Button ID="Button7" Text="图标在左侧" IconFont="_Home" runat="server" />
            <f:Button ID="Button8" Text="图标在右侧" IconAlign="Right" IconFont="_Car" runat="server" />
        </f:ButtonGroup>
        <br />
        <f:ButtonGroup ID="ButtonGroup1" runat="server">
            <f:Button ID="btnIcon3" Text="图标在上面" IconAlign="Top" Icon="Email" runat="server" />
            <f:Button ID="btnIcon4" Text="图标在下面" IconAlign="Bottom" Icon="Star" runat="server" />
            <f:Button ID="Button9" Text="图标在上面" IconAlign="Top" IconFont="_Camera" runat="server" />
            <f:Button ID="Button10" Text="图标在下面" IconAlign="Bottom" IconFont="_Phone" runat="server" />
        </f:ButtonGroup>
        <br />
        <f:Label runat="server" Text="只有图片的按钮："></f:Label>
        <f:ButtonGroup ID="ButtonGroup2" runat="server">
            <f:Button ID="Button1" IconUrl="~/res/images/16/1.png" runat="server" />
            <f:Button ID="Button2" IconUrl="~/res/images/16/8.png" runat="server" />
            <f:Button ID="Button11" IconFont="_Android" runat="server" />
            <f:Button ID="Button12" IconFont="_Apple" runat="server" />
            <f:Button ID="Button13" IconFont="_Car" runat="server" />
            <f:Button ID="Button14" IconFont="_Card" runat="server" />
        </f:ButtonGroup>
        <br />
        <f:Label runat="server" Text="Size（Large）："></f:Label>
        <f:ButtonGroup ID="ButtonGroup3" runat="server">
            <f:Button ID="Button3" Text="图标在上面" Size="Large" IconAlign="Top" Icon="Email" runat="server" />
            <f:Button ID="Button4" Text="图标在下面" Size="Large" IconAlign="Bottom" Icon="Star" runat="server" />
            <f:Button ID="Button5" Text="图标在上面" Size="Large" IconAlign="Top" IconFont="_Camera" runat="server" />
            <f:Button ID="Button6" Text="图标在下面" Size="Large" IconAlign="Bottom" IconFont="_Phone" runat="server" />
        </f:ButtonGroup>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示横向按钮分组，组合图片、字体图标和不同尺寸按钮。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对比分组排列</h3>
            <ul>
                <li>
                    对照各组的文字图标按钮、只有图标的按钮和大按钮。<br />
                    结果：每组按钮从左向右紧邻排列，分组边框连成一体，不改变按钮本身的图标方向。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Items</code>（本页全部按钮组，如<strong class="example-control-reference" data-example-control="ButtonGroupExample1" title="第 1 个按钮组">第 1 个按钮组</strong>）：声明组内按钮，顺序就是显示顺序。</li>
                <li><code>Vertical</code>（本页全部按钮组，如<strong class="example-control-reference" data-example-control="ButtonGroupExample1" title="第 1 个按钮组">第 1 个按钮组</strong>）：默认横向显示，组内按钮连续排列。</li>
                <li><code>Size</code>（<strong class="example-control-reference" data-example-control="<%= Button3.ClientID %>" title="第 15 个按钮（图标在上面）">第 15 个按钮（图标在上面）</strong>、<strong class="example-control-reference" data-example-control="<%= Button4.ClientID %>" title="第 16 个按钮（图标在下面）">第 16 个按钮（图标在下面）</strong>、<strong class="example-control-reference" data-example-control="<%= Button5.ClientID %>" title="第 17 个按钮（图标在上面）">第 17 个按钮（图标在上面）</strong>、<strong class="example-control-reference" data-example-control="<%= Button6.ClientID %>" title="第 18 个按钮（图标在下面）">第 18 个按钮（图标在下面）</strong>）：可为组内按钮分别设置普通或大尺寸。</li>
            </ul>
        </section>
    </template>
</body>
</html>
