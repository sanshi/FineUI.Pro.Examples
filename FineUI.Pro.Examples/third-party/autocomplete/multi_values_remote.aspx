<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="multi_values_remote.aspx.cs"
    Inherits="FineUI.Pro.Examples.autocomplete.multi_values_remote" %>

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
                <f:TextBox ID="TextBox1" runat="server" Label="标题" EmptyText="输入字母 a 试试，可以输入多个值">
                </f:TextBox>
            </Items>
        </f:SimpleForm>
        <br />
        参考：http://jqueryui.com/autocomplete/#multiple-remote
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/third-party/jqueryuiautocomplete/jquery-ui.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        var textbox1ID = '<%= TextBox1.ClientID %>';

        F.ready(function() {

            // 将字符串 val 以逗号空格作为分隔符，分隔成数组
            function split(val) {
                return val.split(/,\s*/);
            }

            // 取得以逗号空格为分隔符的最后一个单词
            // 比如，输入为 "C++, C#, JavaScript" 则输入出 "JavaScript"
            function extractLast(term) {
                return split(term).pop();
            }

            $('#' + textbox1ID + ' input').bind("keydown", function(event) {
                // 通过 Tab 选择一项时，不会使当前文本框失去焦点
                if (event.keyCode === $.ui.keyCode.TAB &&
                    $(this).data("autocomplete").menu.active) {
                    event.preventDefault();
                }
            }).autocomplete({
                minLength: 0,
                source: function(request, response) {
                    $.getJSON("search.ashx", {
                        term: extractLast(request.term)
                    }, response);
                },
                search: function() {
                    // 自定义的minLength（如果要限制两个字符才提示，把下面的1改为2即可）
                    var term = extractLast(this.value);
                    if (term.length < 1) {
                        return false;
                    }
                },
                focus: function() {
                    // 阻止某一项获得焦点时，更新文本框的值
                    return false;
                },
                select: function(event, ui) {
                    var terms = split(this.value);
                    // 移除用户正在输入项
                    terms.pop();
                    // 添加用户选择的项
                    terms.push(ui.item.value);
                    // 添加占位符，确保字符串的最后以逗号空格结束
                    terms.push("");
                    this.value = terms.join(", ");
                    return false;
                }
            });

        });

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>按最后一个逗号后的文字查询候选，并把多次选择追加为逗号分隔的值。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>输入并选择候选项</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>' title="标题">标题</strong>输入 <code>a</code> 并选择 ActionScript，再输入 <code>py</code> 并选择 Python。<br />结果：已有选择保留，输入框依次变为 ActionScript, Python,；候选由服务器查询返回。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>autocomplete.source</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>' title="标题">标题</strong>）：使用远程接口返回候选，只查询当前正在输入的最后一段。</li>
        <li><code>select / extractLast</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>' title="标题">标题</strong>）：只替换最后一段输入，保留前面已经选择的项目。</li>
    </ul>
</section>
</template>
</body>
</html>
