<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_fixedposition.aspx.cs" Inherits="FineUI.Pro.Examples.window.window_fixedposition" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">
        <style>
            body {
                background: url('<%= PageContext.ResolveUrl("~/res/images/bg/small/3.jpg") %>') !important;
            }

        </style>
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <div style="height: 1200px;">
        </div>

        <f:Window ID="Window1" Width="200px" Height="80px" PositionX="Left" PositionY="Top" runat="server" IsModal="false" AutoScroll="true" BodyPadding="10px"
            ShowHeader="false" FixedPosition="true">
            <Content>
                PositionX="Left" PositionY="Top"
            </Content>
        </f:Window>

        <f:Window ID="Window2" Width="200px" Height="80px" PositionX="Left" PositionY="Center" runat="server" IsModal="false" AutoScroll="true"
            BodyPadding="10px" ShowHeader="false" FixedPosition="true">
            <Content>
                PositionX="Left" PositionY="Center"
            </Content>
        </f:Window>

        <f:Window ID="Window3" Width="200px" Height="80px" PositionX="Left" PositionY="Bottom" runat="server" IsModal="false" AutoScroll="true"
            BodyPadding="10px" ShowHeader="false" FixedPosition="true">
            <Content>
                PositionX="Left" PositionY="Bottom"
            </Content>
        </f:Window>


        <f:Window ID="Window4" Width="200px" Height="80px" PositionX="Center" PositionY="Top" runat="server" IsModal="false" AutoScroll="true"
            BodyPadding="10px" ShowHeader="false" FixedPosition="true">
            <Content>
                PositionX="Center" PositionY="Top"
            </Content>
        </f:Window>

        <f:Window ID="Window5" Width="200px" Height="80px" PositionX="Center" PositionY="Center" runat="server" IsModal="false" AutoScroll="true"
            BodyPadding="10px" ShowHeader="false" FixedPosition="true">
            <Content>
                PositionX="Center" PositionY="Center"
            </Content>
        </f:Window>

        <f:Window ID="Window6" Width="200px" Height="80px" PositionX="Center" PositionY="Bottom" runat="server" IsModal="false" AutoScroll="true"
            BodyPadding="10px" ShowHeader="false" FixedPosition="true">
            <Content>
                PositionX="Center" PositionY="Bottom"
            </Content>
        </f:Window>

        <f:Window ID="Window7" Width="200px" Height="80px" PositionX="Right" PositionY="Top" runat="server" IsModal="false" AutoScroll="true" BodyPadding="10px"
            ShowHeader="false" FixedPosition="true">
            <Content>
                PositionX="Right" PositionY="Top"
            </Content>
        </f:Window>

        <f:Window ID="Window8" Width="200px" Height="80px" PositionX="Right" PositionY="Center" runat="server" IsModal="false" AutoScroll="true"
            BodyPadding="10px" ShowHeader="false" FixedPosition="true">
            <Content>
                PositionX="Right" PositionY="Center"
            </Content>
        </f:Window>

        <f:Window ID="Window9" Width="200px" Height="80px" PositionX="Right" PositionY="Bottom" runat="server" IsModal="false" AutoScroll="true"
            BodyPadding="10px" ShowHeader="false" FixedPosition="true">
            <Content>
                PositionX="Right" PositionY="Bottom"
            </Content>
        </f:Window>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对照固定定位的九种横纵组合，滚动时保持相对视口的位置。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>对照本页窗体效果</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>'
                        title="第 1 个窗口">第 1 个窗口</strong>。滚动页面，比较各窗体相对浏览器边缘的位置。<br />结果：各窗体不随页面内容滚走，仍保持本页指定的左中右与上中下组合。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>PositionX</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="第 1 个窗口">第 1 个窗口</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="第 2 个窗口">第
                        2 个窗口</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window3").ClientID %>' title="第 3 个窗口">第 3 个窗口</strong>）：初始为
                    <code>Left</code>、<code>Center</code>、<code>Right</code>，指定窗体在水平方向的对齐位置。
                </li>
                <li><code>PositionY</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="第 1 个窗口">第 1 个窗口</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="第 2 个窗口">第
                        2 个窗口</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window3").ClientID %>' title="第 3 个窗口">第 3 个窗口</strong>）：初始为
                    <code>Top</code>、<code>Center</code>、<code>Bottom</code>，指定窗体在垂直方向的对齐位置。
                </li>
                <li><code>FixedPosition</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="第 1 个窗口">第 1 个窗口</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="第 2 个窗口">第
                        2 个窗口</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window3").ClientID %>' title="第 3 个窗口">第 3 个窗口</strong>）：初始为
                    <code>true</code>，采用固定定位，页面滚动时保持相对视口的位置。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
