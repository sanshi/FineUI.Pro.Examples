<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="email.aspx.cs" Inherits="FineUI.Pro.Examples.autocomplete.email" %>

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
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" BodyPadding="10px" EnableCollapse="false" Title="简单表单">
            <Items>
                <f:TextBox ID="TextBox1" runat="server" ShowLabel="false" EmptyText="随便输入个字母试试">
                </f:TextBox>
            </Items>
        </f:SimpleForm>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/third-party/jqueryuiautocomplete/jquery-ui.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        var textbox1ID = '<%= TextBox1.ClientID %>';

        F.ready(function() {

            var availableTags = [
                "qq.com",
                "163.com",
                "gmail.com",
                "outlook.com",
                "126.com",
                "sina.com",
                "yahoo.com",
                "sohu.com",
                "foxmail.com",
                "live.com",
                "mail.ustc.edu.cn"
            ];


            function getFullEmails(name) {
                var emails = [];
                for (var i = 0, count = availableTags.length; i < count; i++) {
                    emails.push(name + "@" + availableTags[i]);
                }
                return emails;
            }

            $('#' + textbox1ID + ' input').autocomplete({
                source: function(request, response) {
                    if (request.term.indexOf('@') === -1) {
                        response(getFullEmails(request.term));
                    }
                }
            });

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>根据已输入的邮件用户名生成多个邮箱域名候选。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>输入并选择候选项</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>'
                        title="随便输入个字母试试">随便输入个字母试试</strong>输入 <code>user</code>，再选择一个完整邮件地址。<br />结果：输入框回填所选的完整地址。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>autocomplete.source</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>'
                        title="随便输入个字母试试">随便输入个字母试试</strong>）：客户端根据当前用户名生成包含不同邮箱后缀的候选。</li>
                <li><code>select</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>'
                        title="随便输入个字母试试">随便输入个字母试试</strong>）：选择候选后把其显示值写回当前输入框。</li>
            </ul>
        </section>
    </template>
</body>
</html>
