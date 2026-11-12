<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="textbox_autopostback.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.textbox_autopostback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" EnableImplicitChangeEvents="true" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" LabelAlign="Top" EnableCollapse="false" Title="简单表单" ShowHeader="true">
            <Items>
                <f:TextBox runat="server" ID="TextBox1" Label="文本框一（自动回发）" EmptyText="输入字符会立即触发TextChanged事件" AutoPostBack="true"
                    OnTextChanged="TextBox1_TextChanged">
                </f:TextBox>
                <f:TextBox ID="TextBox2" runat="server" Label="文本框二" OnTextChanged="TextBox2_TextChanged" EmptyText="输入字符后点击提交按钮，会触发TextChanged事件">
                </f:TextBox>
                <f:TextBox runat="server" ID="TextBox3" Label="文本框三（失去焦点事件）" EmptyText="输入字符后失去焦点，会触发Blur事件" EnableBlurEvent="true" OnBlur="TextBox3_Blur">
                </f:TextBox>
                <f:Button runat="server" Text="提交" EnablePostBack="true">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult1" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <f:Label ID="labResult2" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <f:Label ID="labResult3" EncodeText="false" runat="server">
        </f:Label>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对比文本改变时自动回发、借提交按钮处理变化和失去焦点时回发这三种触发方式。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>输入变化后更新</h3>
            <ul>
                <li>
                    在“文本框一（自动回发）”中输入“hello”。<br />
                    结果：文本改变后自动回发，后台读取当前文本，下方显示“文本框一：hello”。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-send" aria-hidden="true"></i>借提交按钮处理变化</h3>
            <ol>
                <li>
                    在“文本框二”中输入“world”。<br />
                    结果：该字段不会主动回发，暂不更新对应结果。
                </li>
                <li>
                    点击“提交”。<br />
                    结果：此次请求触发文本框二的变化事件，后台读取输入，下方显示“文本框二：world”。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-keyboard" aria-hidden="true"></i>离开字段后更新</h3>
            <ul>
                <li>
                    在“文本框三（失去焦点事件）”中输入“world”，然后点击页面空白处。<br />
                    结果：失去焦点后回发，后台读取当前文本，下方显示“文本框三：world”。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：本页通过 PageManager.EnableImplicitChangeEvents=true 专门保留 WebForms 的历史兼容行为：TextChanged 由回发数据变化驱动，即使本次回发由其他控件发起也可能触发。提交按钮没有服务端事件，显式 EnablePostBack=true 只用于发起这次教学回发。请仔细考虑如下逻辑：</p>
            <ul>
                <li>在[文本框二]输入任意文本，比如：你好</li>
                <li>点击[提交]按钮</li>
                <li>下面会显示文本[文本框二：你好]（后台触发了[文本框二]的TextChanged事件）</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AutoPostBack</code>：第一个文本框设为 true，文本变化时主动发起回发。</li>
                <li><code>OnTextChanged</code>：文本变化事件，后台读取当前输入并更新对应标签。</li>
                <li><code>EnableImplicitChangeEvents</code>：本页在 PageManager 中开启，使未主动回发的文本框也能在其它控件发起的请求中报告变化。</li>
                <li><code>EnableBlurEvent</code>：第三个文本框设为 true，启用失去焦点事件。</li>
                <li><code>OnBlur</code>：失去焦点时回发处理，不随每次输入立即更新。</li>
            </ul>
        </section>
    </template>
</body>
</html>
