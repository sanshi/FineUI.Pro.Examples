<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_excel_dynamic_columns.aspx.cs" EnableEventValidation="false"
    Inherits="FineUI.Pro.Examples.data.grid_excel_dynamic_columns" %>

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
        <f:Button ID="Button1" runat="server" Text="导出Excel文件" OnClick="ExportExcel" EnableAjax="false" DisableControlBeforePostBack="false">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>导出包含动态模板列的表格，通过渲染模板内容生成文件。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>导出模板中的当前内容</h3>
            <ul>
                <li>修改可输入的模板内容后，点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="导出Excel文件">导出Excel文件</strong>。<br />结果：普通回发返回 myexcel.xls 附件，导出处理遍历表格列与行，取得模板控件的渲染 HTML，合并普通列内容。文件实质是 Excel 可读取的 HTML 表格，非原生
                    XLSX。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RenderControl</code>（<strong>本页服务器列与行处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（动态创建的列）">表格（动态创建的列）</strong>）：进入当前行模板读取渲染结果，避免把模板占位标记当成导出内容。</li>
                <li><code>EnableAjax / Response</code>（<strong>本页服务器列与行处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（动态创建的列）">表格（动态创建的列）</strong>）：下载按钮使用普通请求，附件响应交给浏览器处理。</li>
            </ul>
        </section>
    </template>
</body>
</html>
