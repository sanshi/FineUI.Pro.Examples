<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="custom_display.aspx.cs"
    Inherits="FineUI.Pro.Examples.autocomplete.custom_display" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
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
                <f:TextBox ID="TextBox1" runat="server" Label="标题" EmptyText="输入字母 j 试试">
                </f:TextBox>
                <f:TextBox ID="TextBox2" Label="值" runat="server">
                </f:TextBox>
                <f:TextBox ID="TextBox3" Label="描述" runat="server">
                </f:TextBox>
            </Items>
        </f:SimpleForm>
        <br />
        参考：http://jqueryui.com/autocomplete/#custom-data
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/third-party/jqueryuiautocomplete/jquery-ui.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        var textbox1ID = '<%= TextBox1.ClientID %>';
        var textbox2ID = '<%= TextBox2.ClientID %>';
        var textbox3ID = '<%= TextBox3.ClientID %>';

        F.ready(function() {

            var projects = [{
                    value: "jquery",
                    label: "jQuery",
                    desc: "the write less, do more, JavaScript library"
                },
                {
                    value: "jquery-ui",
                    label: "jQuery UI",
                    desc: "the official user interface library for jQuery"
                },
                {
                    value: "sizzlejs",
                    label: "Sizzle JS",
                    desc: "a pure-JavaScript CSS selector engine"
                }
            ];

            $('#' + textbox1ID + ' input').autocomplete({
                minLength: 0,
                source: projects,
                select: function(event, ui) {
                    var $this = $(this);
                    $this.val(ui.item.label);
                    $('#' + textbox2ID + ' input').val(ui.item.value);
                    $('#' + textbox3ID + ' input').val(ui.item.desc);
                    return false;
                }
            }).autocomplete('instance')._renderItem = function(ul, item) {
                return $("<li>")
                    .append("<a><span class='autocomplete-item-title'>" + item.label + "</span><br/>" + item.desc + "</a>")
                    .appendTo(ul);
            };

        });

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>自定义自动补全候选项的多行显示，并把选中项的标题、值和描述分别回填。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>输入并选择候选项</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>' title="标题">标题</strong>输入 <code>j</code> 并选择 jQuery。<br />结果：标题字段显示 jQuery，值字段显示 jquery，描述字段显示该项目说明。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>autocomplete.source</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>' title="标题">标题</strong>）：提供本页本地候选数据或筛选函数。</li>
        <li><code>select / _renderItem</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>' title="标题">标题</strong>）：候选渲染负责多行外观，选择回调分别回填三个字段。</li>
    </ul>
</section>
</template>
</body>
</html>
