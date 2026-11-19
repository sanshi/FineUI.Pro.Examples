<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="layout_contactus.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.layout_contactus" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window1" runat="server" Title="联系我们" IsModal="false" EnableClose="false" EnableResize="true" Width="550px" AutoScroll="true">
            <Items>
                <f:Form ID="Form1" LabelAlign="Top" BodyPadding="10px" ShowBorder="false" ShowHeader="false" runat="server">
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
            <p>演示姓名并排、其余字段纵向排列的联系表单布局。</p>
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
            <p>注：设置[<strong class="example-control-reference" data-example-control="<%= TextArea1.ClientID %>" title="消息正文">消息正文</strong>]的最小高度为
                <code>100px</code>，窗体高度变小时会出现纵向滚动条。
            </p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ColumnWidth</code>（<strong class="example-control-reference" data-example-control="<%= TextBox2.ClientID %>"
                        title="姓">姓</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox4.ClientID %>"
                        title="名">名</strong>）：姓与名各占一半宽度。</li>
                <li><code>LabelAlign</code>（<strong class="example-control-reference" data-example-control="<%= Form1.ClientID %>" title="表单">表单</strong>）：初始为
                    <code>Top</code>，标签在字段上方。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
