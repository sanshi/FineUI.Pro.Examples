<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_position.aspx.cs" Inherits="FineUI.Pro.Examples.window.window_position" %>

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

        <f:Window ID="Window1" Width="200px" Height="80px" PositionX="Left" PositionY="Top" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Left" PositionY="Top"
            </Content>
        </f:Window>

        <f:Window ID="Window2" Width="200px" Height="80px" PositionX="Left" PositionY="Center" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Left" PositionY="Center"
            </Content>
        </f:Window>

        <f:Window ID="Window3" Width="200px" Height="80px" PositionX="Left" PositionY="Bottom" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Left" PositionY="Bottom"
            </Content>
        </f:Window>


        <f:Window ID="Window4" Width="200px" Height="80px" PositionX="Center" PositionY="Top" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Center" PositionY="Top"
            </Content>
        </f:Window>

        <f:Window ID="Window5" Width="200px" Height="80px" PositionX="Center" PositionY="Center" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Center" PositionY="Center"
            </Content>
        </f:Window>

        <f:Window ID="Window6" Width="200px" Height="80px" PositionX="Center" PositionY="Bottom" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Center" PositionY="Bottom"
            </Content>
        </f:Window>

        <f:Window ID="Window7" Width="200px" Height="80px" PositionX="Right" PositionY="Top" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Right" PositionY="Top"
            </Content>
        </f:Window>

        <f:Window ID="Window8" Width="200px" Height="80px" PositionX="Right" PositionY="Center" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Right" PositionY="Center"
            </Content>
        </f:Window>

        <f:Window ID="Window9" Width="200px" Height="80px" PositionX="Right" PositionY="Bottom" DependsViewPortSize="false" runat="server" IsModal="false"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false">
            <Content>
                DependsViewPortSize="false" PositionX="Right" PositionY="Bottom"
            </Content>
        </f:Window>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对照九宫格定位，并用较长页面区分页面区域和视口。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>对照本页窗体效果</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>'
                        title="第 1 个窗口">第 1 个窗口</strong>。对照各窗体正文中的 Left、Center、Right 和 Top、Center、Bottom，再滚动页面。<br />结果：各窗体按指定横纵方向定位；本页关闭视口尺寸依赖，定位范围以页面规则为准。
                </li>
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
                <li><code>DependsViewPortSize</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="第 1 个窗口">第 1 个窗口</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="第 2 个窗口">第
                        2 个窗口</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window3").ClientID %>' title="第 3 个窗口">第 3 个窗口</strong>）：初始为
                    <code>false</code>，控制定位时是否以当前视口大小为依据。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
