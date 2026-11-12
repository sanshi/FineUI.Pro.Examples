<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="triggerbox.aspx.cs" Inherits="FineUI.Pro.Examples.form.triggerbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false" ShowBorder="true" Title="表单" ShowHeader="true" runat="server">
            <Items>
                <f:TriggerBox ID="tbxMyBox1" ShowLabel="false" Readonly="false" TriggerIcon="Search" EmptyText="打开弹出窗口" runat="server" EnableClickAction="true">
                    <Listeners>
                        <f:Listener Event="triggerclick" Handler="onMyBox1TriggerClick" />
                    </Listeners>
                </f:TriggerBox>
            </Items>
        </f:SimpleForm>
        <f:Window ID="Window1" Title="弹出窗口" BodyPadding="10px" IsModal="true" Hidden="true" Target="Top" Width="450px" Height="300px" runat="server">
            <Items>
                <f:Button ID="btnCloseWindow" Text="关闭当前窗口" OnClick="btnCloseWindow_Click" runat="server">
                </f:Button>
            </Items>
        </f:Window>


    </form>

    <script>
        var Window1ClientID = '<%= Window1.ClientID %>';

        // 点击触发器（或点输入框，EnableClickAction=true）：直接在客户端开窗，不回发
        function onMyBox1TriggerClick(event) {
            F(Window1ClientID).show();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示点击触发器打开弹窗，再通过窗内按钮关闭弹窗并向输入框回填文字。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>打开、关闭并回填</h3>
            <ol>
                <li>
                    点击提示为<strong class="example-control-reference" data-example-control="<%= tbxMyBox1.ClientID %>" title="打开弹出窗口">打开弹出窗口</strong>的输入框，或点击右侧搜索图标。<br />
                    结果：浏览器直接显示标题为<strong class="example-control-reference" data-example-control="<%= Window1.ClientID %>" title="弹出窗口">弹出窗口</strong>的窗体，打开时无需回发。
                </li>
                <li>
                    点击窗体内的<strong class="example-control-reference" data-example-control="<%= btnCloseWindow.ClientID %>" title="关闭当前窗口">关闭当前窗口</strong>按钮。<br />
                    结果：按钮回发后，后台隐藏窗体，输入框显示“弹出窗口被关闭了”。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：点击输入框即可弹出窗体（<code>EnableClickAction</code>=<code>true</code>）。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>TriggerIcon</code>（<strong class="example-control-reference" data-example-control="<%= tbxMyBox1.ClientID %>" title="打开弹出窗口">打开弹出窗口</strong>）：设为 <code>Search</code>，显示搜索图标。</li>
                <li><code>EnableClickAction</code>（<strong class="example-control-reference" data-example-control="<%= tbxMyBox1.ClientID %>" title="打开弹出窗口">打开弹出窗口</strong>）：设为 <code>true</code>，点击输入区域也触发 <code>triggerclick</code>。</li>
                <li><code>Hidden</code>（<strong class="example-control-reference" data-example-control="<%= Window1.ClientID %>" title="弹出窗口">弹出窗口</strong>）：窗口初始为 <code>true</code>；关闭按钮处理后再次隐藏。</li>
                <li><code>OnClick</code>（<strong class="example-control-reference" data-example-control="<%= btnCloseWindow.ClientID %>" title="关闭当前窗口">关闭当前窗口</strong>）：窗内按钮绑定后台事件，关闭窗口并回填输入框。</li>
            </ul>
        </section>
    </template>
</body>
</html>
