<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="card_switch_default.aspx.cs" Inherits="FineUI.Pro.Examples.gridcard.card_switch_default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/js/gridcard.js" />
    <style>
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" DataIDField="Id" Height="500px"
            DisplayType="Default" CardRendererFunction="renderCard">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:ToolbarFill runat="server"></f:ToolbarFill>
                        <f:Button IconFont="_Table" ID="btnDisplayDefault" EnablePress="true" Pressed="true" runat="server"
                            ClickHandler="onDisplayDefaultClick"></f:Button>
                        <f:Button IconFont="_Gallery" ID="btnDisplayCard" EnablePress="true" Pressed="false" runat="server" ClickHandler="onDisplayCardClick">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名"></f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别"></f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份"></f:RenderField>
                <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd"
                    HeaderText="入学日期">
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校"></f:RenderCheckField>
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业"></f:RenderField>
            </Columns>
        </f:Grid>
    </form>
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
            <p>在初始表格显示基础上切换表格与卡片，复用同一份记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>切换显示形式</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnDisplayCard").ClientID %>'
                        title="卡片模式（卡片图标）">卡片模式（卡片图标）</strong>，再点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnDisplayDefault").ClientID %>'
                        title="表格模式（表格图标）">表格模式（表格图标）</strong>。<br />结果：记录在行列形式与卡片形式之间转换，名称、<strong>性别</strong>等数据保留；模式按钮按下状态与实际显示一致，不发起业务保存。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DisplayType</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>Default</code>，初次采用本页声明的模式，按钮在 Default 与 Card 之间切换。
                </li>
                <li><code>CardRendererFunction</code>（<strong>页面展示配置</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：卡片模式调用对应内容函数；表格模式仍使用原列定义。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
