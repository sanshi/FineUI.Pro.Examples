<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="layout_panel_column.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.layout_panel_column" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="Form1" IsFluid="true" MessageTarget="Qtip" BodyPadding="10px" Title="表单" runat="server">
            <Items>
                <f:Panel ID="Panel2" ShowHeader="false" CssClass="" ShowBorder="false" Layout="Column" runat="server">
                    <Items>
                        <f:Label ID="Label2" Width="100px" runat="server" CssClass="marginr" ShowLabel="false"
                            Text="用户名：">
                        </f:Label>
                        <f:TextBox ID="TextBox2" ShowLabel="false" Label="用户名" Required="true" Width="150px" CssClass="marginr" runat="server">
                        </f:TextBox>
                        <f:Button ID="Button3" Text="按钮一" CssClass="marginr" runat="server">
                        </f:Button>
                        <f:Button ID="Button4" Text="按钮二" runat="server">
                        </f:Button>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel1" ShowHeader="false" ShowBorder="false" Layout="Column" runat="server">
                    <Items>
                        <f:Label ID="Label1" runat="server" Width="100px" CssClass="marginr" ShowLabel="false"
                            Text="作息起止时间：">
                        </f:Label>
                        <f:DatePicker ID="DatePicker1" ShowLabel="false" Label="作息开始时间" Required="true" CssClass="marginr" Width="150px" runat="server">
                        </f:DatePicker>
                        <f:DatePicker ID="DatePicker2" ShowLabel="false" Label="作息结束时间" Required="true" CompareControl="DatePicker1" CompareOperator="GreaterThan"
                            CompareMessage="结束日期应该大于开始日期！" Width="150px" runat="server">
                        </f:DatePicker>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel3" ShowHeader="false" ShowBorder="false" Layout="Column" CssClass="" runat="server">
                    <Items>
                        <f:Label ID="Label3" runat="server" Width="100px" CssClass="marginr" ShowLabel="false"
                            Text="上班起止时间：">
                        </f:Label>
                        <f:DatePicker ID="DatePicker3" ShowLabel="false" Label="上班开始时间" Required="true" CssClass="marginr" ColumnWidth="50%" runat="server">
                        </f:DatePicker>
                        <f:DatePicker ID="DatePicker4" ShowLabel="false" Label="上班结束时间" Required="true" CompareControl="DatePicker3" CompareOperator="GreaterThan"
                            CompareMessage="结束日期应该大于开始日期！" ColumnWidth="50%" runat="server">
                        </f:DatePicker>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel4" ShowHeader="false" ShowBorder="false" Layout="Column" CssClass="" runat="server">
                    <Items>
                        <f:Label ID="Label4" runat="server" Width="100px" CssClass="marginr" ShowLabel="false"
                            Text="工作时间：">
                        </f:Label>
                        <f:TextBox ID="TextBoxExample2" ClientIDMode="Static" Width="40px" ShowLabel="false" Label="工作时间（小时）" Required="true" runat="server">
                        </f:TextBox>
                        <f:Label runat="server" Text="小时" MarginLeft="5px" MarginRight="10px">
                        </f:Label>
                        <f:TextBox Width="40px" ShowLabel="false" Label="工作时间（分钟）" Required="true" ID="TextBox3" runat="server">
                        </f:TextBox>
                        <f:Label ID="Label6" runat="server" Text="分钟" MarginLeft="5px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Button ID="Button1" Text="提交表单" ValidateForms="Form1" ValidateMessageBox="true" OnClick="Button1_Click" runat="server">
                </f:Button>
            </Items>
        </f:Form>



    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示用列布局组合独立标签、输入框、按钮和日期区间，同时保留字段验证。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>固定宽度与比例宽度</h3>
            <ul>
                <li>
                    对照用户名、<strong class="example-control-reference" data-example-control="<%= Label1.ClientID %>" title="作息起止时间">作息起止时间</strong>与<strong class="example-control-reference" data-example-control="<%= Label3.ClientID %>" title="上班起止时间">上班起止时间</strong>这几行。<br />
                    结果：独立标签与输入框并排；一组日期使用固定宽度，另一组按剩余宽度等分。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注意：</p>
            <ul>
                <li>表单字段的<code>ShowLabel</code>=<code>false</code>，表单验证失败的对话框消息中用到了 Label 属性。 </li>
                <li>表单验证失败的错误提示类型是<code>Qtip</code>，而不是默认的<code>Side</code>。 </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Layout</code>（本页全部面板，如<strong class="example-control-reference" data-example-control="<%= Panel2.ClientID %>" title="第 1 个面板">第 1 个面板</strong>）：行面板使用 <code>Column</code>，把标签、字段和按钮并排排列。</li>
                <li><code>Width</code>（<strong class="example-control-reference" data-example-control="<%= Label2.ClientID %>" title="第 1 个标签（用户名）">第 1 个标签（用户名）</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox2.ClientID %>" title="第 1 个文本框（用户名）">第 1 个文本框（用户名）</strong>、<strong class="example-control-reference" data-example-control="<%= Label1.ClientID %>" title="作息起止时间">作息起止时间</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>" title="作息开始时间">作息开始时间</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker2.ClientID %>" title="作息结束时间">作息结束时间</strong>、<strong class="example-control-reference" data-example-control="<%= Label3.ClientID %>" title="上班起止时间">上班起止时间</strong>、<strong class="example-control-reference" data-example-control="<%= Label4.ClientID %>" title="工作时间">工作时间</strong>、<strong class="example-control-reference" data-example-control="TextBoxExample2" title="工作时间（小时）">工作时间（小时）</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox3.ClientID %>" title="工作时间（分钟）">工作时间（分钟）</strong>）：为独立标签、用户名及部分日期字段指定固定宽度。</li>
                <li><code>ColumnWidth</code>（<strong class="example-control-reference" data-example-control="<%= DatePicker3.ClientID %>" title="上班开始时间">上班开始时间</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker4.ClientID %>" title="上班结束时间">上班结束时间</strong>）：上班起止日期各占剩余宽度的一半。</li>
                <li><code>ShowLabel</code>（<strong class="example-control-reference" data-example-control="<%= Label2.ClientID %>" title="第 1 个标签（用户名）">第 1 个标签（用户名）</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox2.ClientID %>" title="第 1 个文本框（用户名）">第 1 个文本框（用户名）</strong>、<strong class="example-control-reference" data-example-control="<%= Label1.ClientID %>" title="作息起止时间">作息起止时间</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>" title="作息开始时间">作息开始时间</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker2.ClientID %>" title="作息结束时间">作息结束时间</strong>、<strong class="example-control-reference" data-example-control="<%= Label3.ClientID %>" title="上班起止时间">上班起止时间</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker3.ClientID %>" title="上班开始时间">上班开始时间</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker4.ClientID %>" title="上班结束时间">上班结束时间</strong>、<strong class="example-control-reference" data-example-control="<%= Label4.ClientID %>" title="工作时间">工作时间</strong>、<strong class="example-control-reference" data-example-control="TextBoxExample2" title="工作时间（小时）">工作时间（小时）</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox3.ClientID %>" title="工作时间（分钟）">工作时间（分钟）</strong>）：内置标签隐藏，改由行内独立 Label 显示。</li>
            </ul>
        </section>
    </template>
</body>
</html>
