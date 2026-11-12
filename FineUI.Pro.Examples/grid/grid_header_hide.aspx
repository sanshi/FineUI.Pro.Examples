<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_header_hide.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_header_hide" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="false" Title="表格" Height="200px" runat="server" EnableCollapse="false"
            ShowGridHeader="false" EnableRowLines="false" EnableAlternateRowColor="false">
            <Columns>
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="姓名" />
            </Columns>
        </f:Grid>
        <br /><br />
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>隐藏整行列标题，保留学生数据及表格面板标题。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看没有列标题的表格</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>顶部与第一行数据。<br />结果：<strong>姓名</strong>等列标题不显示，第一行直接呈现记录；面板自身标题仍在，隐藏列标题不等于隐藏整个表格标题栏。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：本表格隐藏了表头、行分隔线、间隔行背景色。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ShowGridHeader</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 <code>false</code>，初始为
                    <code>false</code>，不显示数据列标题行。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
