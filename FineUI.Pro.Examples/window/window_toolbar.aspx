<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_toolbar.aspx.cs"
    Inherits="FineUI.Pro.Examples.window.window_toolbar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window2" Width="650px" Height="300px" Icon="TagBlue" Title="窗体" EnableMaximize="true" EnableCollapse="false" runat="server"
            EnableResize="true" BodyPadding="10px" AutoScroll="true" IsModal="false">
            <Content>
                <br />
                <br />
                <f:Label runat="server" ID="labTextInWindow"></f:Label>
            </Content>
            <Toolbars>
                <f:Toolbar ID="Toolbar3" Position="Top" runat="server">
                    <Items>
                        <f:ToolbarText Text="工具条文本一" ID="ToolbarText3" runat="server">
                        </f:ToolbarText>
                        <f:ToolbarSeparator ID="ToolbarSeparator2" runat="server">
                        </f:ToolbarSeparator>
                        <f:ToolbarText Text="工具条文本二" ID="ToolbarText4" runat="server">
                        </f:ToolbarText>
                        <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                        </f:ToolbarSeparator>
                        <f:Button ID="Button1" runat="server" Text="工具栏按钮">
                        </f:Button>
                    </Items>
                </f:Toolbar>
                <f:Toolbar ID="ToolbarExample2" runat="server" Position="Bottom" ToolbarAlign="Right">
                    <Items>
                        <f:Button runat="server" ID="btnChangeText" OnClick="btnChangeText_Click" Text="修改窗体内的文本值"></f:Button>
                        <f:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="关闭窗体">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把工具栏放入窗体顶部和底部，并由底部按钮回发修改正文。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>使用窗体内工具栏</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnChangeText").ClientID %>'
                        title="修改窗体内的文本值">修改窗体内的文本值</strong>。<br />结果：后台把窗体正文从初始值改为本次修改后的文字。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnClose").ClientID %>'
                        title="关闭窗体">关闭窗体</strong>。<br />结果：窗体隐藏。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Position</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Toolbar3").ClientID %>' title="第 1 个工具栏">第 1 个工具栏</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ToolbarExample2").ClientID %>'
                        title="第 2 个工具栏">第 2 个工具栏</strong>）：初始为 <code>Top</code>、<code>Bottom</code>，指定工具栏位于容器顶部或底部。</li>
                <li><code>ToolbarAlign</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ToolbarExample2").ClientID %>' title="第 2 个工具栏">第 2 个工具栏</strong>）：初始为
                    <code>Right</code>，指定工具栏项目的对齐方式。
                </li>
                <li><code>Text</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="窗体">窗体</strong>）：正文的值由修改按钮更新，工具栏不随正文内容一起替换。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
