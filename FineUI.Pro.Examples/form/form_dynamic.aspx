<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_dynamic.aspx.cs" Inherits="FineUI.Pro.Examples.form.form_dynamic" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form BodyPadding="10px" ID="Form2" IsFluid="true" EnableCollapse="false"
            Title="表单" LabelWidth="120px" LabelAlign="Top" runat="server">
            <Rows>
                <f:FormRow>
                    <Items>
                        <f:Label ID="Label1" runat="server" ShowLabel="false" Text="这是一个标签">
                        </f:Label>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>


        <f:Button ID="Button1" runat="server" ValidateForms="Form2" ValidateTarget="Top"
            Text="验证表单并提交" OnClick="Button1_Click">
        </f:Button>

    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示后台创建用户名文本框和性别下拉列表，并处理动态字段的校验、变化事件与提交。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>操作动态字段</h3>
            <ol>
                <li>
                    用户名留空，点击“验证表单并提交”。<br />
                    结果：动态用户名字段显示必填错误，提交业务不执行。
                </li>
                <li>
                    在性别列表选择“女”。<br />
                    结果：选择事件回发，提示“选择的性别：女”。
                </li>
                <li>
                    用户名输入“tom”，再次点击“验证表单并提交”。<br />
                    结果：后台读取动态字段的当前值，提示用户名tom及当前性别；字段仍留在原表单中。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：用户名和性别两个控件是动态创建的。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ID</code>：动态字段使用稳定标识 tbxUserName、ddlGender，后台据此读取当前值。</li>
            </ul>
        </section>
    </template>
</body>
</html>
