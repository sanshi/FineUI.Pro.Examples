<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_dynamic_columns.aspx.cs"
    Inherits="FineUI.Pro.Examples.data.grid_dynamic_columns" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" runat="server" EnableCheckBoxSelect="true" Title="表格（动态创建的列）">
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>用代码动态创建表格列，再把数据按字段绑定到这些列。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>核对动态生成的列</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（动态创建的列）">表格（动态创建的列）</strong>的姓名、性别与入学年份等列。<br />结果：列来自后台创建代码，而不是模板中逐列声明；显示值仍按每列的数据字段读取。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>所有动态创建控件的代码都要放到 Page_Init 中，详情：<a href="http://www.cnblogs.com/sanshi/archive/2012/11/19/2776672.html">三石的博客</a>。</li>
                <li>FineUI.Pro支持在页面第一次初始化时动态创建控件，但是不支持在回发时动态创建控件。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Columns / DataSource</code>（<strong>表格配置</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（动态创建的列）">表格（动态创建的列）</strong>）：先创建或替换列集合，再绑定与该结构相符的数据；列标识与数据字段分别承担定位和取值职责。</li>
            </ul>
        </section>
    </template>
</body>
</html>
