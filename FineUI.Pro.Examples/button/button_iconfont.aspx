<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_iconfont.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_iconfont" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="btnIcon1" Text="图标在左侧" IconFont="_Home" runat="server" CssClass="marginr" />
        <f:Button ID="btnIcon2" Text="图标在右侧" IconAlign="Right" IconFont="_Car" runat="server" />
        <br />
        <br />
        <f:Button ID="btnIcon3" Text="图标在上面" IconAlign="Top" IconFont="_Camera" runat="server"
            CssClass="marginr" />
        <f:Button ID="btnIcon4" Text="图标在下面" IconAlign="Bottom" IconFont="_Phone" runat="server" />
        <br />
        <br />
        <f:Button ID="btnCustomIcon" Text="点击修改图标（在三个图标之前切换）" OnClick="btnCustomIcon_Click"
            IconFont="_VolumeUp" runat="server" />
        <br />
        <br />
        只有图片的按钮：
        <br />
        <br />
        <f:Button ID="Button1" Size="Small" IconFont="_Android" CssClass="marginr" runat="server" />
        <f:Button ID="Button2" Size="Normal" IconFont="_Apple" CssClass="marginr" runat="server" />
        <f:Button ID="Button7" Size="Medium" IconFont="_Car" CssClass="marginr" runat="server" />
        <f:Button ID="Button8" Size="Large" IconFont="_Card" CssClass="marginr" runat="server" />
        <br />
        <br />
        大按钮：
        <br />
        <br />
        <f:Button ID="Button3" Size="Large" Text="图标在左侧" IconFont="_Home" runat="server" CssClass="marginr" />
        <f:Button ID="Button4" Size="Large" Text="图标在右侧" IconAlign="Right" IconFont="_Car" runat="server" />
        <br />
        <br />
        <f:Button ID="Button5" Size="Large" Text="图标在上面" IconAlign="Top" IconFont="_Camera" runat="server"
            CssClass="marginr" />
        <f:Button ID="Button6" Size="Large" Text="图标在下面" IconAlign="Bottom" IconFont="_Phone" runat="server" />
        <br />
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示字体图标、四种图标位置和运行时图标切换。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对比图标与按钮外观</h3>
            <ul>
                <li>
                    对照左、右、上、下图标按钮及只有图标的按钮。<br />
                    结果：图标与文字按指定方向排列，大按钮与普通按钮使用各自尺寸。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>连续切换图标</h3>
            <ul>
                <li>
                    连续点击标为“点击修改图标（在三个图标之前切换）”的按钮。<br />
                    结果：回发后，后台按音量大、音量小、静音的顺序循环更换图标。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>IconFont</code>：指定字体图标，页面使用主页、汽车、相机、电话和音量图标。</li>
                <li><code>IconAlign</code>：控制图标相对文字的位置。</li>
            </ul>
        </section>
    </template>
</body>
</html>
