<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reportviewer.aspx.cs" Inherits="FineUI.Pro.Examples.aspnet.reportviewer" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        见示例项目：<a href="https://pan.baidu.com/s/1o9Ni8Ca" target="_blank">FineUI.Pro.ReportViewer</a>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>提供独立 ReportViewer 集成示例的下载入口，本页不直接渲染报表。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-link" aria-hidden="true"></i>访问独立集成示例</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control="form1" title="页面表单">ReportViewer
                        示例链接</strong>中的下载链接。<br />结果：浏览器打开对应的外部下载页面；本页没有报表查询、预览或导出操作。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>href</code>（<strong class="example-control-reference" data-example-control="form1"
                        title="页面表单">页面表单</strong>）：链接指向独立示例项目，是否可下载由外部服务当前状态决定。</li>
            </ul>
        </section>
    </template>
</body>
</html>
