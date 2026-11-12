<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="card_switch_avatar.aspx.cs" Inherits="FineUI.Pro.Examples.gridcard.card_switch_avatar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/js/gridcard.js" />
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">

        <link type="text/css" rel="stylesheet" href="<%= PageContext.ResolveUrl("~/res/css/gridcard.css") %>" />
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" EnableCheckBoxSelect="true"
            DataIDField="Id" DisplayType="Card" CardRendererFunction="renderCardWithAvatar" DataAttributeFields="Name,Gender,Avatar,EntranceYear,Status">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:ToolbarFill runat="server"></f:ToolbarFill>
                        <f:Button IconFont="_Table" ID="btnDisplayDefault" EnablePress="true" Pressed="false" runat="server"
                            ClickHandler="onDisplayDefaultClick"></f:Button>
                        <f:Button IconFont="_Gallery" ID="btnDisplayCard" EnablePress="true" Pressed="true" runat="server" ClickHandler="onDisplayCardClick">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="UserProfile" Width="250" RendererFunction="renderUserProfile" HeaderText="基本信息"></f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业" />
                <f:RenderField ColumnID="ChineseScore" DataField="ChineseScore" HeaderText="语文成绩" />
                <f:RenderField ColumnID="MathScore" DataField="MathScore" HeaderText="数学成绩" />
                <f:RenderField ColumnID="TotalScore" DataField="TotalScore" HeaderText="总成绩" />
                <f:RenderField ColumnID="Status" DataField="Status" RendererFunction="renderStatus" HeaderText="状态" />
            </Columns>
        </f:Grid>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/gridcard.js") %>"></script>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';
        var btnDisplayDefaultClientID = '<%= btnDisplayDefault.ClientID %>';
        var btnDisplayCardClientID = '<%= btnDisplayCard.ClientID %>';

        function onDisplayDefaultClick(event) {
            F(btnDisplayDefaultClientID).setPressed(true);
            F(btnDisplayCardClientID).setPressed(false);

            F(Grid1ClientID).setDisplayType('default');
        }

        function onDisplayCardClick(event) {
            F(btnDisplayDefaultClientID).setPressed(false);
            F(btnDisplayCardClientID).setPressed(true);

            F(Grid1ClientID).setDisplayType('card');
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在初始卡片显示基础上切换表格与卡片，复用同一份记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>切换显示形式</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnDisplayDefault").ClientID %>'
                        title="表格模式（表格图标）">表格模式（表格图标）</strong>，再点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnDisplayCard").ClientID %>'
                        title="卡片模式（卡片图标）">卡片模式（卡片图标）</strong>。<br />结果：记录在行列形式与卡片形式之间转换，名称、性别等数据保留；模式按钮按下<strong>状态</strong>与实际显示一致，不发起业务保存。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DisplayType</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>Card</code>，初次采用本页声明的模式，按钮在 Default 与 Card 之间切换。
                </li>
                <li><code>CardRendererFunction</code>（<strong>页面展示配置</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：卡片模式调用对应内容函数；表格模式仍使用原列定义。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
