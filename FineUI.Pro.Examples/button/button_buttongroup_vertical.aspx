<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_buttongroup_vertical.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_buttongroup_vertical" %>

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
        <f:ButtonGroup ID="ButtonGroupExample1" runat="server" Vertical="true">
            <f:Button ID="btnIcon1" Text="图标在左侧（很长的文本）" Icon="Email" runat="server" />
            <f:Button ID="btnIcon2" Text="图标在右侧" IconAlign="Right" Icon="Star" runat="server" />
            <f:Button ID="Button7" Text="图标在左侧" IconFont="_Home" runat="server" />
            <f:Button ID="Button8" Text="图标在右侧" IconAlign="Right" IconFont="_Car" runat="server" />
        </f:ButtonGroup>
        <br />
        <f:ButtonGroup ID="ButtonGroup1" runat="server" Vertical="true">
            <f:Button ID="btnIcon3" Text="图标在上面" IconAlign="Top" Icon="Email" runat="server" />
            <f:Button ID="btnIcon4" Text="图标在下面" IconAlign="Bottom" Icon="Star" runat="server" />
            <f:Button ID="Button9" Text="图标在上面" IconAlign="Top" IconFont="_Camera" runat="server" />
            <f:Button ID="Button10" Text="图标在下面" IconAlign="Bottom" IconFont="_Phone" runat="server" />
        </f:ButtonGroup>
        <br />
        <f:Label runat="server" Text="只有图片的按钮："></f:Label>
        <f:ButtonGroup ID="ButtonGroup2" runat="server" Vertical="true">
            <f:Button ID="Button1" IconUrl="~/res/images/16/1.png" runat="server" />
            <f:Button ID="Button2" IconUrl="~/res/images/16/8.png" runat="server" />
            <f:Button ID="Button11" IconFont="_Android" runat="server" />
            <f:Button ID="Button12" IconFont="_Apple" runat="server" />
            <f:Button ID="Button13" IconFont="_Car" runat="server" />
            <f:Button ID="Button14" IconFont="_Card" runat="server" />
        </f:ButtonGroup>
        <br />
        <f:Label runat="server" Text="Size（Large）："></f:Label>
        <f:ButtonGroup ID="ButtonGroup3" runat="server" Vertical="true">
            <f:Button ID="Button3" Text="图标在上面" Size="Large" IconAlign="Top" Icon="Email" runat="server" />
            <f:Button ID="Button4" Text="图标在下面" Size="Large" IconAlign="Bottom" Icon="Star" runat="server" />
            <f:Button ID="Button5" Text="图标在上面" Size="Large" IconAlign="Top" IconFont="_Camera" runat="server" />
            <f:Button ID="Button6" Text="图标在下面" Size="Large" IconAlign="Bottom" IconFont="_Phone" runat="server" />
        </f:ButtonGroup>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示纵向按钮分组，组合图片、字体图标和不同尺寸按钮。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对比分组排列</h3>
            <ul>
                <li>
                    对照各组的文字图标按钮、只有图标的按钮和大按钮。<br />
                    结果：每组按钮从上向下排列、左侧对齐，并形成连续的分组边框。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Vertical</code>（本页全部按钮组，如<strong class="example-control-reference" data-example-control="ButtonGroupExample1" title="第 1 个按钮组">第 1
                        个按钮组</strong>）：纵向组设为 <code>true</code>，使用纵向分组边框。</li>
            </ul>
        </section>
    </template>
</body>
</html>
