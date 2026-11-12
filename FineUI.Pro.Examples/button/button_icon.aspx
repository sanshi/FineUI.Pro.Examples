<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_icon.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_icon" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="btnIcon1" Text="图标在左侧" Icon="Email" runat="server" CssClass="marginr" />
        <f:Button ID="btnIcon2" Text="图标在右侧" IconAlign="Right" Icon="Star" runat="server" />
        <br />
        <br />
        <f:Button ID="btnIcon3" Text="图标在上面" IconAlign="Top" Icon="Email" runat="server"
            CssClass="marginr" />
        <f:Button ID="btnIcon4" Text="图标在下面" IconAlign="Bottom" Icon="Star" runat="server" />
        <br />
        <br />
        <f:Button ID="btnCustomIcon" Text="自定义图标（点击修改图标）" OnClick="btnCustomIcon_Click"
            IconUrl="~/res/images/16/1.png" runat="server" />
        <br />
        <br />
        只有图片的按钮：
            <br />
        <br />
        <f:Button ID="Button1" IconUrl="~/res/images/16/1.png" CssClass="marginr" runat="server" />
        <f:Button ID="Button2" IconUrl="~/res/images/16/8.png" runat="server" />
        <br />
        <br />
        大按钮：
            <br />
        <br />
        <f:Button ID="Button3" Size="Large" Text="图标在左侧" Icon="Email" runat="server" CssClass="marginr" />
        <f:Button ID="Button4" Size="Large" Text="图标在右侧" IconAlign="Right" Icon="Star" runat="server" />
        <br />
        <br />
        <f:Button ID="Button5" Size="Large" Text="图标在上面" IconAlign="Top" Icon="Email" runat="server"
            CssClass="marginr" />
        <f:Button ID="Button6" Size="Large" Text="图标在下面" IconAlign="Bottom" Icon="Email" runat="server" />
        <br />
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示图片图标在按钮四个方向的排列，以及点击后更换图片。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对比图标位置</h3>
            <ul>
                <li>
                    对照<strong>图标在左侧、右侧、上面、下面</strong>的按钮。<br />
                    结果：图片分别排列在文字对应方向，只有图片的按钮不预留文字。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>切换图标图片</h3>
            <ul>
                <li>
                    连续点击<strong class="example-control-reference" data-example-control="<%= btnCustomIcon.ClientID %>" title="自定义图标（点击修改图标）">自定义图标（点击修改图标）</strong>。<br />
                    结果：回发后，后台在 <code>1</code>.<code>png</code>、<code>8</code>.<code>png</code> 两张图片之间切换，按钮文字保留。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Icon</code>（<strong class="example-control-reference" data-example-control="<%= btnIcon1.ClientID %>" title="第 1 个按钮（图标在左侧）">第 1 个按钮（图标在左侧）</strong>、<strong class="example-control-reference" data-example-control="<%= btnIcon2.ClientID %>" title="第 2 个按钮（图标在右侧）">第 2 个按钮（图标在右侧）</strong>、<strong class="example-control-reference" data-example-control="<%= btnIcon3.ClientID %>" title="第 3 个按钮（图标在上面）">第 3 个按钮（图标在上面）</strong>、<strong class="example-control-reference" data-example-control="<%= btnIcon4.ClientID %>" title="第 4 个按钮（图标在下面）">第 4 个按钮（图标在下面）</strong>、<strong class="example-control-reference" data-example-control="<%= Button3.ClientID %>" title="第 8 个按钮（图标在左侧）">第 8 个按钮（图标在左侧）</strong>、<strong class="example-control-reference" data-example-control="<%= Button4.ClientID %>" title="第 9 个按钮（图标在右侧）">第 9 个按钮（图标在右侧）</strong>、<strong class="example-control-reference" data-example-control="<%= Button5.ClientID %>" title="第 10 个按钮（图标在上面）">第 10 个按钮（图标在上面）</strong>、<strong class="example-control-reference" data-example-control="<%= Button6.ClientID %>" title="第 11 个按钮（图标在下面）">第 11 个按钮（图标在下面）</strong>）：使用内置图片枚举，例如 <code>Email</code>、<code>Star</code>。</li>
                <li><code>IconUrl</code>（<strong class="example-control-reference" data-example-control="<%= btnCustomIcon.ClientID %>" title="自定义图标（点击修改图标）">自定义图标（点击修改图标）</strong>、<strong class="example-control-reference" data-example-control="<%= Button1.ClientID %>" title="第 6 个按钮">第 6 个按钮</strong>、<strong class="example-control-reference" data-example-control="<%= Button2.ClientID %>" title="第 7 个按钮">第 7 个按钮</strong>）：指定自定义图片地址，点击后由后台更换。</li>
                <li><code>IconAlign</code>（<strong class="example-control-reference" data-example-control="<%= btnIcon2.ClientID %>" title="第 2 个按钮（图标在右侧）">第 2 个按钮（图标在右侧）</strong>、<strong class="example-control-reference" data-example-control="<%= btnIcon3.ClientID %>" title="第 3 个按钮（图标在上面）">第 3 个按钮（图标在上面）</strong>、<strong class="example-control-reference" data-example-control="<%= btnIcon4.ClientID %>" title="第 4 个按钮（图标在下面）">第 4 个按钮（图标在下面）</strong>、<strong class="example-control-reference" data-example-control="<%= Button4.ClientID %>" title="第 9 个按钮（图标在右侧）">第 9 个按钮（图标在右侧）</strong>、<strong class="example-control-reference" data-example-control="<%= Button5.ClientID %>" title="第 10 个按钮（图标在上面）">第 10 个按钮（图标在上面）</strong>、<strong class="example-control-reference" data-example-control="<%= Button6.ClientID %>" title="第 11 个按钮（图标在下面）">第 11 个按钮（图标在下面）</strong>）：控制图标相对文字的左、右、上、下位置。</li>
            </ul>
        </section>
    </template>
</body>
</html>
