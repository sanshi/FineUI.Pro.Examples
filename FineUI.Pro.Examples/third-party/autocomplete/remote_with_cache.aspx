<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="remote_with_cache.aspx.cs"
    Inherits="FineUI.Pro.Examples.autocomplete.remote_with_cache" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/third-party/autocomplete/search.ashx" />
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">

        <link rel="stylesheet" href="<%= PageContext.ResolveUrl("~/res/third-party/jqueryuiautocomplete/jquery-ui.css") %>" />
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" LabelWidth="60px" BodyPadding="10px" EnableCollapse="false" Title="简单表单">
            <Items>
                <f:TextBox ID="TextBox1" runat="server" Label="标题" EmptyText="输入字母 ja 或者 sc 试试，必须输入两个字符后才有自动提示">
                </f:TextBox>
            </Items>
        </f:SimpleForm>
        <br />
        参考：http://jqueryui.com/autocomplete/#remote-with-cache
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/third-party/jqueryuiautocomplete/jquery-ui.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        var textbox1ID = '<%= TextBox1.ClientID %>';

        F.ready(function() {

            var cache = {};

            $('#' + textbox1ID + ' input').autocomplete({
                minLength: 2,
                source: function(request, response) {
                    var term = request.term;
                    if (term in cache) {
                        response(cache[term]);
                        return;
                    }

                    $.getJSON("search.ashx", request, function(data, status, xhr) {
                        cache[term] = data;
                        response(data);
                    });
                }
            });

        });

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>把远程自动补全结果缓存到浏览器，重复关键词无需每次请求服务器。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>查询后再次输入同一关键词</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>' title="标题">标题</strong>输入 <code>ja</code>，选择候选后清空，再输入相同内容。<br />结果：至少两个字符才查询；首次取得远程候选，再次相同查询复用缓存结果。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>source / cache / minLength</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>' title="标题">标题</strong>）：source 请求远程数据，按关键词缓存结果；输入长度不足时不发查询。</li>
    </ul>
</section>
</template>
</body>
</html>
