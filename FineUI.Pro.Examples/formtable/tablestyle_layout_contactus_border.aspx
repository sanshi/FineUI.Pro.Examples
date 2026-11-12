<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tablestyle_layout_contactus_border.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.tablestyle_layout_contactus_border" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/css/tablestyle-noborder.css" />
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">

        <link href="<%= PageContext.ResolveUrl("~/res/css/tablestyle-noborder.css") %>" rel="stylesheet" />
    </asp:PlaceHolder>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window1" runat="server" Title="联系我们" IsModal="false" EnableClose="false" EnableResize="true" Width="550px" BodyPadding="0"
            AutoScroll="true">
            <Items>
                <f:Form ID="Form1" ShowBorder="false" ShowHeader="false" runat="server" EnableTableStyle="true" MessageTarget="Qtip">
                    <Items>
                        <f:Panel ID="Panel2" Layout="Column" ShowHeader="false" ShowBorder="false" runat="server">
                            <Items>
                                <f:TextBox ID="TextBox2" Label="姓" Margin="0 5 0 0" Required="true" ShowRedStar="true" ColumnWidth="50%" runat="server">
                                </f:TextBox>
                                <f:TextBox ID="TextBox4" Label="名" Required="true" ShowRedStar="true" ColumnWidth="50%" runat="server">
                                </f:TextBox>
                            </Items>
                        </f:Panel>
                        <f:TextBox ID="TextBox1" Required="true" ShowRedStar="true" Label="电子邮箱" RegexPattern="EMAIL" RegexMessage="请输入有效的邮箱地址" runat="server">
                        </f:TextBox>
                        <f:TextBox ID="TextBox3" Required="true" ShowRedStar="true" Label="主题" runat="server">
                        </f:TextBox>
                        <f:TextArea ID="TextArea1" Height="120px" Required="true" ShowRedStar="true" Label="消息正文" runat="server">
                        </f:TextArea>
                    </Items>
                </f:Form>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="Button1" Text="发送" IconFont="_Send" ValidateForms="Form1" runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示把联系表单的字段组织成表格风格的标签与输入区域。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>对照字段排列</h3>
            <ol>
                <li>
                    在“姓、名”填写联系人，邮箱输入 reader&#64;example.com，填写主题和消息正文。<br />
                    结果：姓名字段并排，其余字段纵向排列；本页通过样式去掉单元格边框。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ColumnWidth</code>：姓与名各占一半宽度。</li>
                <li><code>EnableTableStyle</code>：启用表格风格；去边框页另外通过本页 CSS 修改单元格边线。</li>
                <li><code>border-width</code>：本页的表格风格补充样式去掉字段边线，保留原来的布局结构。</li>
            </ul>
        </section>
    </template>
</body>
</html>
