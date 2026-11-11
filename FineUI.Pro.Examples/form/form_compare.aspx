<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_compare.aspx.cs" Inherits="FineUI.Pro.Examples.form.form_compare" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" LabelWidth="200px" EnableCollapse="false" runat="server" ShowBorder="true"
            ShowHeader="true" Title="简单表单">
            <Items>
                <f:DatePicker ID="DatePicker1" Label="开始日期" Required="true" runat="server">
                </f:DatePicker>
                <f:DatePicker ID="DatePicker2" Label="结束日期（大于开始日期）" Required="true" CompareControl="DatePicker1" CompareOperator="GreaterThan"
                    CompareMessage="结束日期应该大于开始日期！" runat="server">
                </f:DatePicker>
                <f:TextBox ID="TextBox1" Required="true" Label="文本框 1" Text="FineUI.Pro" runat="server">
                </f:TextBox>
                <f:TextBox ID="TextBox2" Required="true" Label="文本框 2（等于文本框 1）" CompareControl="TextBox1" CompareOperator="Equal"
                    CompareMessage="文本框 2 应该等于文本框 1！" runat="server">
                </f:TextBox>
                <f:NumberBox ID="NumberBox1" Required="true" Label="数字框 1" Text="30" runat="server">
                </f:NumberBox>
                <f:NumberBox ID="NumberBox2" Required="true" Label="数字框 2（大于等于数字框 1）" CompareControl="NumberBox1" CompareOperator="GreaterThanEqual"
                    CompareMessage="数字框 2 应该大于等于数字框 1!" runat="server">
                </f:NumberBox>
                <f:Label ID="Label1" runat="server" Label="标签 1" Text="88">
                </f:Label>
                <f:NumberBox ID="NumberBox3" Required="true" Label="文本框 3（大于等于标签 1）" CompareControl="Label1" CompareOperator="GreaterThanEqual"
                    CompareType="Int" CompareMessage="文本框 3 应该大于等于标签 1！" runat="server">
                </f:NumberBox>
                <f:Button ID="btnSubmit" ValidateForms="SimpleForm1" OnClick="btnSubmit_Click" CssClass="marginr" Text="提交表单" runat="server">
                </f:Button>
                <f:Button ID="btnReset" Text="重置表单" runat="server" ClickHandler="onResetClick">
                </f:Button>
            </Items>
        </f:SimpleForm>
    </form>
    <script>
        var SimpleForm1ClientID = '<%= SimpleForm1.ClientID %>';

        function onResetClick(event) {
            F(SimpleForm1ClientID).reset();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示提交前比较日期、文本、数字和标签值，确保关联字段满足指定关系。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>比较日期和文本</h3>
            <ol>
                <li>
                    开始日期和结束日期选择同一天，点击“提交表单”。<br />
                    结果：结束日期提示必须大于开始日期。
                </li>
                <li>
                    关闭验证提示，将结束日期改为更晚的一天，文本框 2 输入与文本框 1 相同的“FineUI.Pro”。<br />
                    结果：日期先后和文本相等这两项规则均可通过。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-sort" aria-hidden="true"></i>比较数字和标签</h3>
            <ol>
                <li>
                    数字框 1 保持为 30，数字框 2 输入 29，点击“提交表单”。<br />
                    结果：数字框 2 提示必须大于等于数字框 1。
                </li>
                <li>
                    关闭验证提示，将数字框 2 改为 30，“文本框 3（大于等于标签 1）”输入 87，再次提交。<br />
                    结果：第三个数值字段提示必须大于等于标签 1 的 88。
                </li>
                <li>
                    关闭验证提示，将第三个数值改为 88，填好其余必填项后提交。<br />
                    结果：全部比较通过，才回发到后台，显示读取到的表单字段值。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>重新开始</h3>
            <ul>
                <li>
                    点击“重置表单”。<br />
                    结果：浏览器恢复各字段初始值，并清除验证错误。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CompareControl</code>：指定比较对象，例如结束日期与 DatePicker1 比较。</li>
                <li><code>CompareOperator</code>：本页使用 GreaterThan、Equal、GreaterThanEqual 三种关系。</li>
                <li><code>CompareMessage</code>：比较不通过时在对应字段显示的错误文字。</li>
                <li><code>CompareType</code>：与标签 88 比较时设为 Int，按整数比较。</li>
                <li><code>ValidateForms</code>：指定 SimpleForm1，全部字段验证通过后才回发。</li>
            </ul>
        </section>
    </template>
</body>
</html>
