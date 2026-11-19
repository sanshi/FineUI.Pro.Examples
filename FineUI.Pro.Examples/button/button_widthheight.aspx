<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_widthheight.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_widthheight" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="btnIcon1" Text="图标在左侧" Width="150px" Height="60px" Icon="Email" runat="server" CssClass="marginr" />
        <f:Button ID="btnIcon2" Text="图标在右侧" Width="150px" Height="60px" IconAlign="Right" Icon="Star" runat="server" />
        <br />
        <br />
        <f:Button ID="btnIcon3" Text="图标在上面" Width="150px" Height="60px" IconAlign="Top" Icon="Email" runat="server" CssClass="marginr" />
        <f:Button ID="btnIcon4" Text="图标在下面" Width="150px" Height="60px" IconAlign="Bottom" Icon="Star" runat="server" />
        <br />
        <br />
        只有图片的按钮：
        <br />
        <br />
        <f:Button ID="Button1" IconUrl="~/res/images/16/1.png" Width="50px" Height="40px" CssClass="marginr" runat="server" />
        <f:Button ID="Button2" IconUrl="~/res/images/16/8.png" Width="50px" Height="40px" runat="server" />
        <br />
        <br />
        大按钮：
        <br />
        <br />
        <f:Button ID="Button3" Size="Large" Text="图标在左侧" Width="150px" Height="80px" Icon="Email" runat="server" CssClass="marginr" />
        <f:Button ID="Button4" Size="Large" Text="图标在右侧" Width="150px" Height="80px" IconAlign="Right" Icon="Star" runat="server" />
        <br />
        <br />
        <f:Button ID="Button5" Size="Large" Text="图标在上面" Width="150px" Height="80px" IconAlign="Top" Icon="Email" runat="server" CssClass="marginr" />
        <f:Button ID="Button6" Size="Large" Text="图标在下面" Width="150px" Height="80px" IconAlign="Bottom" Icon="Star" runat="server" />
        <br />
        <br />
        <hr />
        <br />
        <br />
        <f:Button ID="Button7" Text="图标在左侧" Width="150px" Height="60px" IconFont="_Home" runat="server" CssClass="marginr" />
        <f:Button ID="Button8" Text="图标在右侧" Width="150px" Height="60px" IconAlign="Right" IconFont="_Car" runat="server" />
        <br />
        <br />
        <f:Button ID="Button9" Text="图标在上面" Width="150px" Height="60px" IconAlign="Top" IconFont="_Camera" runat="server" CssClass="marginr" />
        <f:Button ID="Button10" Text="图标在下面" Width="150px" Height="60px" IconAlign="Bottom" IconFont="_Phone" runat="server" />
        <br />
        <br />
        只有图片的按钮：
        <br />
        <br />
        <f:Button ID="Button11" IconFont="_Android" Width="50px" Height="40px" CssClass="marginr" runat="server" />
        <f:Button ID="Button12" IconFont="_Apple" Width="50px" Height="40px" CssClass="marginr" runat="server" />
        <br />
        <br />
        大按钮：
        <br />
        <br />
        <f:Button ID="Button15" Size="Large" Text="图标在左侧" Width="150px" Height="80px" IconFont="_Home" runat="server" CssClass="marginr" />
        <f:Button ID="Button16" Size="Large" Text="图标在右侧" Width="150px" Height="80px" IconAlign="Right" IconFont="_Car" runat="server" />
        <br />
        <br />
        <f:Button ID="Button17" Size="Large" Text="图标在上面" Width="150px" Height="80px" IconAlign="Top" IconFont="_Camera" runat="server" CssClass="marginr" />
        <f:Button ID="Button18" Size="Large" Text="图标在下面" Width="150px" Height="80px" IconAlign="Bottom" IconFont="_Phone" runat="server" />
        <br />
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示固定按钮宽高与不同图标位置、字体大小组合后的布局。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照固定尺寸</h3>
            <ul>
                <li>
                    对照同排文字图标按钮、只有图标的按钮以及大按钮。<br />
                    结果：文字按钮宽 <code>150</code> 像素，普通高度 <code>60</code>、大按钮高度 <code>80</code>；只有图标的按钮使用较窄尺寸，图标仍按设定方向排列。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Width</code>（本页全部按钮，如<strong class="example-control-reference" data-example-control="<%= btnIcon1.ClientID %>"
                        title="第 1 个按钮（图标在左侧）">第 1 个按钮（图标在左侧）</strong>）：固定按钮宽度，本页主要使用 <code>150</code> 像素。</li>
                <li><code>Height</code>（本页全部按钮，如<strong class="example-control-reference" data-example-control="<%= btnIcon1.ClientID %>"
                        title="第 1 个按钮（图标在左侧）">第 1 个按钮（图标在左侧）</strong>）：固定按钮高度，对比 <code>60</code> 与 <code>80</code> 像素。</li>
            </ul>
        </section>
    </template>
</body>
</html>
