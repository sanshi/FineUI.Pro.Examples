<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="card_avatar.aspx.cs" Inherits="FineUI.Pro.Examples.gridcard.card_avatar" %>

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
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" DataIDField="Id"
            DisplayType="Card" CardRendererFunction="renderCardWithAvatar" DataAttributeFields="Name,Gender,Avatar,EntranceYear,Status">
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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把学生头像、状态与成绩组织为个人卡片，用额外行属性提供展示资料。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看头像与成绩卡片</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>第一张卡片，再调整示例可用宽度。<br />结果：头像、姓名、<strong>状态</strong>徽章与成绩对应同一条记录；查看详情只是携带用户编号的示例链接，项目未提供实际详情页面。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DisplayType</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 <code>Card</code>，使用 Card
                    渲染记录，分页与选择仍基于同一组行数据。</li>
                <li><code>CardRendererFunction</code>（<strong>页面展示配置</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：根据当前行生成卡片内容，可调用列渲染结果取得格式化文字。
                </li>
                <li><code>DataAttributeFields</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>Name,Gender,Avatar,EntranceYear,Status</code>，把头像、姓名和<strong>状态</strong>等字段作为行附加属性提供给卡片模板。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
