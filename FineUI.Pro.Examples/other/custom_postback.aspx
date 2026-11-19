<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="custom_postback.aspx.cs"
    Inherits="FineUI.Pro.Examples.other.custom_postback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" BodyPadding="10px" EnableCollapse="false" Title="简单表单">
            <Items>
                <f:TextBox ID="TextBox1" runat="server" ShowLabel="false" EmptyText="输入一些文字并按 ENTER 键">
                    <Listeners>
                        <f:Listener Event="enter" Handler="onTextBoxEnter" />
                    </Listeners>
                </f:TextBox>
                <f:TextBox ID="TextBox2" runat="server" ShowLabel="false">
                </f:TextBox>
            </Items>
        </f:SimpleForm>
    </form>

    <script type="text/javascript">
        function onTextBoxEnter(event) {
            F.doPostBack({
                eventName: 'TextBox1_ENTER'
            });
        }

        //var textbox1ID = '<%= TextBox1.ClientID %>';

        //F.ready(function () {

        //    F(textbox1ID).on("enter", function (event) {
        //        F.doPostBack({ eventName: 'TextBox1_ENTER' });
        //    });

        //});

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在文本框按回车时用 F.doPostBack 发送自定义事件，把当前输入复制到另一字段。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>按回车触发后台事件</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>'
                        title="输入一些文字并按 ENTER 键">输入一些文字并按 ENTER 键</strong>输入 <code>本次输入</code>，按回车。<br />结果：自定义事件回发，后台读取第一个文本框，将同样文字写入<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox2").ClientID %>'
                        title="第 2 个文本框">第 2 个文本框</strong>。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>F.doPostBack()</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>' title="输入一些文字并按 ENTER 键">输入一些文字并按 ENTER
                        键</strong>）：传入本页后台识别的事件名，按回车回调发送；不是普通按钮点击。</li>
            </ul>
        </section>
    </template>
</body>
</html>
