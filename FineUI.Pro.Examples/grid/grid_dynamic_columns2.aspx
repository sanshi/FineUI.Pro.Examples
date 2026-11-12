<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_dynamic_columns2.aspx.cs"
    Inherits="FineUI.Pro.Examples.data.grid_dynamic_columns2" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/Code/ITemplate.cs" />
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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在页面初始化时动态创建数据列及性别模板列，再绑定学生记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看动态创建的模板列</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（动态创建的列）">表格（动态创建的列）</strong>的性别（模板列），再选择一行并点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="选中了哪些行">选中了哪些行</strong>。<br />结果：性别模板正常输出文字，回发后列结构与选中行仍可识别；动态列每次在初始化阶段重建，不只首次加载时创建。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>所有动态创建控件的代码都要放到 Page_Init 中，详情：<a href="http://www.cnblogs.com/sanshi/archive/2012/11/19/2776672.html">三石的博客</a>。</li>
                <li>FineUI.Pro支持在页面第一次初始化时动态创建控件，但是不支持在回发时动态创建控件。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Columns.Add / ItemTemplate</code>（<strong>本页服务器列与行处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（动态创建的列）">表格（动态创建的列）</strong>）：在 Page_Init
                    添加列，并给性别列指定自定义模板。</li>
            </ul>
        </section>
    </template>
</body>
</html>
