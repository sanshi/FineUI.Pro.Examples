<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datepicker_autopostback.aspx.cs"
    Inherits="FineUI.Pro.Examples.datepicker.datepicker_autopostback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false" Title="简单表单（AutoPostBack）" runat="server">
            <Items>
                <f:DatePicker runat="server" Required="true" OnTextChanged="DatePicker1_TextChanged" Label="开始日期" EmptyText="请选择开始日期" ID="DatePicker1"
                    ShowRedStar="true">
                </f:DatePicker>
                <f:DatePicker ID="DatePicker2" Required="true" Readonly="false" CompareControl="DatePicker1" DateFormatString="yyyy-MM-dd"
                    CompareOperator="GreaterThan" CompareMessage="结束日期应该大于开始日期" Label="结束日期" runat="server" ShowRedStar="true">
                </f:DatePicker>
                <f:Button ID="Button1" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="Button1_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" ShowLabel="false" runat="server">
        </f:Label>
        <br />
        <f:SimpleForm ID="SimpleForm2" IsFluid="true" BodyPadding="10px" EnableCollapse="false" Title="简单表单（EnableDateSelectEvent）" runat="server">
            <Items>
                <f:DatePicker runat="server" Required="true" EnableDateSelectEvent="true" OnDateSelect="DatePicker3_DateSelect" Label="开始日期" EmptyText="请选择开始日期"
                    ID="DatePicker3" ShowRedStar="true">
                </f:DatePicker>
                <f:DatePicker ID="DatePicker4" Required="true" Readonly="false" CompareControl="DatePicker3" DateFormatString="yyyy-MM-dd"
                    CompareOperator="GreaterThan" CompareMessage="结束日期应该大于开始日期" Label="结束日期" runat="server" ShowRedStar="true">
                </f:DatePicker>
                <f:Button ID="Button2" runat="server" ValidateForms="SimpleForm2" Text="提交表单" OnClick="Button2_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult2" ShowLabel="false" runat="server">
        </f:Label>



    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对比文本变化和日历选中两种事件，让结束日期自动设为开始日期后<code>3</code>天。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>文本变化时联动</h3>
            <ol>
                <li>
                    在第一组开始日期输入明天的日期，使用<code>yyyy</code>-<code>MM</code>-<code>dd</code>完整格式。<br />
                    结果：输入改变后即触发回发，不必先移开焦点；后台将结束日期改为开始日期后<code>3</code>天。
                </li>
                <li>
                    再从第一组日历中选择今天。<br />
                    结果：同一变化处理读取新开始日期，结束日期改为今天后第<code>3</code>天。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>仅日历选中时联动</h3>
            <ol>
                <li>
                    在第二组开始日期手工输入明天的日期，再移开焦点。<br />
                    结果：不会因为手工输入触发<code>OnDateSelect</code>，第二组结束日期尚未联动。
                </li>
                <li>
                    打开第二组日历，从面板中选择今天。<br />
                    结果：选中日期事件回发，第二组结束日期变为今天后第<code>3</code>天。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：</p>
            <ul>
                <li>手工输入<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>" title="简单表单（AutoPostBack）">第一个表单</strong>的开始日期，会自动回发。</li>
                <li>手工输入<strong class="example-control-reference" data-example-control="<%= SimpleForm2.ClientID %>" title="简单表单（EnableDateSelectEvent）">第二个表单</strong>的开始日期，不会自动回发。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>OnTextChanged</code>（<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>" title="简单表单（AutoPostBack）的开始日期">简单表单（AutoPostBack）的开始日期</strong>）：第一组在文字改变时回发，手工输入和面板选择都可使结束日期变为<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>" title="简单表单（AutoPostBack）的开始日期">开始日期</strong>后<code>3</code>天。</li>
                <li><code>OnDateSelect</code>（<strong class="example-control-reference" data-example-control="<%= DatePicker3.ClientID %>" title="简单表单（EnableDateSelectEvent）的开始日期">简单表单（EnableDateSelectEvent）的开始日期</strong>）：第二组仅在面板选中日期时回发；手工输入不会执行此联动。</li>
            </ul>
        </section>
    </template>
</body>
</html>
