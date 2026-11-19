<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tablehtml_layout_contactus.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.tablehtml_layout_contactus" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/css/tablehtml.css" />
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">

        <link href="<%= PageContext.ResolveUrl("~/res/css/tablehtml.css") %>" rel="stylesheet" />
    </asp:PlaceHolder>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window1" runat="server" Title="联系我们" IsModal="false" EnableClose="false" EnableResize="true" Width="650px" BodyPadding="10px">
            <Items>
                <f:ContentPanel ID="ContentPanel1" runat="server" ShowBorder="false" ShowHeader="false">
                    <table class="tablehtml">
                        <tr>
                            <td class="f-widget-header label"><span class="redstar">*</span>姓：
                            </td>
                            <td class="f-widget-content content">
                                <f:TextBox ID="TextBox2" Label="姓" ShowLabel="false" Required="true" ShowRedStar="true" runat="server" MessageTarget="Qtip">
                                </f:TextBox>
                            </td>
                            <td class="f-widget-header label"><span class="redstar">*</span>名：
                            </td>
                            <td class="f-widget-content content">
                                <f:TextBox ID="TextBox4" Label="名" ShowLabel="false" Required="true" ShowRedStar="true" runat="server" MessageTarget="Qtip">
                                </f:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="f-widget-header label"><span class="redstar">*</span>电子邮箱：
                            </td>
                            <td class="f-widget-content" colspan="3">
                                <f:TextBox ID="TextBox1" Required="true" ShowRedStar="true" Label="电子邮箱" ShowLabel="false" RegexPattern="EMAIL"
                                    MessageTarget="Qtip" RegexMessage="请输入有效的邮箱地址" runat="server">
                                </f:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="f-widget-header label"><span class="redstar">*</span>主题：
                            </td>
                            <td class="f-widget-content" colspan="3">
                                <f:TextBox ID="TextBox3" Required="true" ShowRedStar="true" Label="主题" ShowLabel="false" runat="server" MessageTarget="Qtip">
                                </f:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="f-widget-header label"><span class="redstar">*</span>消息正文：
                            </td>
                            <td class="f-widget-content" colspan="3">
                                <f:TextArea ID="TextArea1" Height="220px" Required="true" ShowRedStar="true" Label="消息正文" ShowLabel="false" MessageTarget="Qtip"
                                    runat="server">
                                </f:TextArea>
                            </td>
                        </tr>
                    </table>
                </f:ContentPanel>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="Button1" Text="发送" IconFont="_Send" ValidateForms="ContentPanel1" runat="server">
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
                    在<strong class="example-control-reference" data-example-control="<%= TextBox2.ClientID %>" title="姓">姓</strong>、<strong
                        class="example-control-reference" data-example-control="<%= TextBox4.ClientID %>" title="名">名</strong>填写联系人，邮箱输入
                    <code>reader</code>&#64;<code>example.com</code>，填写主题和<strong class="example-control-reference"
                        data-example-control="<%= TextArea1.ClientID %>" title="消息正文">消息正文</strong>。<br />
                    结果：姓名字段并排，其余字段纵向排列。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：推荐使用表单的<code>EnableTableStyle</code>属性，更简单，参考示例：表格样式->表格样式（<strong class="example-control-reference"
                    data-example-control="<%= Window1.ClientID %>" title="联系我们">联系我们</strong>）。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ShowLabel</code>（<strong class="example-control-reference" data-example-control="<%= TextBox2.ClientID %>"
                        title="姓">姓</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox4.ClientID %>"
                        title="名">名</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox1.ClientID %>"
                        title="电子邮箱">电子邮箱</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox3.ClientID %>"
                        title="主题">主题</strong>、<strong class="example-control-reference" data-example-control="<%= TextArea1.ClientID %>"
                        title="消息正文">消息正文</strong>）：隐藏控件内置标签，改用 HTML 表格单元格显示。</li>
                <li><code>tablehtml</code>（本页全部文本框，如<strong class="example-control-reference" data-example-control="<%= TextBox2.ClientID %>"
                        title="姓">姓</strong>）：手写 HTML 表格使用公共 <code>tablehtml.css</code> 形成边线与标签区域。</li>
            </ul>
        </section>
    </template>
</body>
</html>
