<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inline_window.aspx.cs" Inherits="FineUI.Pro.Examples.autocomplete.inline_window" %>

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
        <f:Window ID="SimpleForm1" runat="server" Width="500px" Layout="Fit" BodyPadding="10px" EnableCollapse="false" Title="简单表单">
            <Items>
                <f:SimpleForm ShowBorder="false" ShowHeader="false" runat="server">
                    <Items>
                        <f:TextBox ID="TextBox1" runat="server" ShowLabel="false" EmptyText="输入字母 a 试试">
                        </f:TextBox>
                        <f:Button Text="获取输入值" ID="Button1" runat="server" OnClick="Button1_Click"></f:Button>
                        <f:Label runat="server" ID="labResult"></f:Label>
                    </Items>
                </f:SimpleForm>
            </Items>
        </f:Window>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/third-party/jqueryuiautocomplete/jquery-ui.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        var textbox1ID = '<%= TextBox1.ClientID %>';

        F.ready(function() {

            var availableTags = [
                "ActionScript",
                "AppleScript",
                "Asp",
                "BASIC",
                "C",
                "C++",
                "Clojure",
                "COBOL",
                "ColdFusion",
                "Erlang",
                "Fortran",
                "Groovy",
                "Haskell",
                "Java",
                "JavaScript",
                "Lisp",
                "Perl",
                "PHP",
                "Python",
                "Ruby",
                "Scala",
                "Scheme"
            ];

            $('#' + textbox1ID + ' input').autocomplete({
                source: availableTags,
                open: function(event, ui) {
                    var inputEl = $(this);
                    // 当前输入框所在窗体的z-index
                    var wndZIndex = parseInt(inputEl.parents('.f-window').css('z-index'), 10);

                    // 设置autocomplete弹出层的z-index
                    inputEl.autocomplete('widget').css('z-index', wndZIndex + 1);
                }
            });

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在弹出窗体内使用 jQuery UI 自动补全，让候选菜单显示在窗体上方。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>输入并选择候选项</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>'
                        title="输入字母 a 试试">输入字母 a 试试</strong>输入 <code>ja</code>，从候选项中选择 Java。<br />结果：输入框显示 Java，候选菜单关闭。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>autocomplete.source</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>' title="输入字母 a 试试">输入字母 a
                        试试</strong>）：提供本页本地候选数据或筛选函数。</li>
                <li><code>open / z-index</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>' title="输入字母 a 试试">输入字母 a
                        试试</strong>）：打开菜单后调整候选层级，避免菜单被窗体遮挡。</li>
            </ul>
        </section>
    </template>
</body>
</html>
