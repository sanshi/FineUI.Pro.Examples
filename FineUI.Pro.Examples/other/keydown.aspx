<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="keydown.aspx.cs" Inherits="FineUI.Pro.Examples.other.keydown" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" BodyPadding="10px"
            Title="简单表单">
            <Items>
                <f:TextBox ID="TextBox1" runat="server" ShowLabel="false" EmptyText="输入一些文字，下面的文本框会随之改变">
                    <Listeners>
                        <f:Listener Event="change" Handler="onTextBoxChange" />
                    </Listeners>
                </f:TextBox>
                <f:TextBox ID="TextBox2" runat="server" ShowLabel="false">
                </f:TextBox>
            </Items>
        </f:SimpleForm>
    </form>

    <script type="text/javascript">

        var textbox2ClientID = '<%= TextBox2.ClientID %>';

        function onTextBoxChange(event) {
            F(textbox2ClientID).setValue(this.getValue());
        }


        //F.ready(function () {
        //    var textbox1 = F(textbox1ClientID);
        //    var textbox2 = F(textbox2ClientID);


        //    function updateTextbox2() {
        //        textbox2.setValue(textbox1.getValue());
        //    }


        //    textbox1.on('change', function (e) {
        //        updateTextbox2();
        //    });

        //});

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示文本变化后在浏览器同步更新另一个输入框，无需后台请求。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>同步输入文字</h3>
            <ul>
                <li>
                    在第一个文本框中输入“client-side-sync”。<br />
                    结果：第二个文本框随变化显示相同文字。
                </li>
                <li>
                    修改或清空第一个文本框。<br />
                    结果：第二个文本框同步为新的内容或空值，整个过程在浏览器完成。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Event</code>：监听文本框的 change 事件。</li>
                <li><code>getValue()</code>：客户端处理函数读取第一个文本框当前值。</li>
                <li><code>setValue()</code>：把读取到的文字写入第二个文本框。</li>
            </ul>
        </section>
    </template>
</body>
</html>
