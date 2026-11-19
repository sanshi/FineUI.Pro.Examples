<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="triggerbox_iframe.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.triggerbox_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/triggerbox_iframe_iframe.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" Title="在父页面弹出窗体" BodyPadding="10px" runat="server" EnableCollapse="false">
            <Items>
                <f:TriggerBox ID="TriggerBox1" EnableEdit="false" Text="TriggerBox1" TriggerIcon="Search" Label="触发器" runat="server">
                    <Listeners>
                        <f:Listener Event="triggerclick" Handler="onTriggerBox1TriggerClick" />
                    </Listeners>
                </f:TriggerBox>
                <f:DatePicker ID="DatePicker1" EnableEdit="false" Label="日期选择器" Required="true" runat="server">
                </f:DatePicker>
                <f:Button ID="Button1" runat="server" OnClick="Button1_Click" ValidateForms="SimpleForm1" Text="提交">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <f:Window ID="Window1" Title="编辑" Hidden="true" EnableIFrame="true" runat="server" EnableMaximize="true" EnableResize="true" Target="Parent"
            OnClose="Window1_Close" IsModal="true" Width="650px" Height="500px">
        </f:Window>
        <br />
        <f:SimpleForm ID="SimpleForm2" IsFluid="true" Title="在本页面弹出窗体" BodyPadding="10px" runat="server" EnableCollapse="false">
            <Items>
                <f:TriggerBox ID="TriggerBox2" EnableEdit="false" Text="TriggerBox2" TriggerIcon="Search" Label="触发器" runat="server">
                    <Listeners>
                        <f:Listener Event="triggerclick" Handler="onTriggerBox2TriggerClick" />
                    </Listeners>
                </f:TriggerBox>
                <f:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="提交">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <f:Window ID="Window2" Title="编辑" Hidden="true" EnableIFrame="true" runat="server" EnableMaximize="true" EnableResize="true" Target="Self"
            OnClose="Window2_Close" IsModal="true" Width="650px" Height="500px">
        </f:Window>
        <br />
        <f:Label ID="labResult" CssStyle="font-weight:bold;" runat="server">
        </f:Label>
        <br />
        <f:HiddenField ID="HiddenField1" runat="server">
        </f:HiddenField>
        <f:HiddenField ID="HiddenField2" runat="server">
        </f:HiddenField>
    </form>

    <script>
        // 控件在命名容器里（TriggerBox 在 SimpleForm 内），客户端 id 带前缀，必须由服务端输出 ClientID。
        // 回写清单也是按 ClientID 查控件的，同样不能写字面 id
        var window1ClientID = '<%= Window1.ClientID %>';
        var window2ClientID = '<%= Window2.ClientID %>';
        var triggerBox1ClientID = '<%= TriggerBox1.ClientID %>';
        var triggerBox2ClientID = '<%= TriggerBox2.ClientID %>';
        var hiddenField1ClientID = '<%= HiddenField1.ClientID %>';
        var hiddenField2ClientID = '<%= HiddenField2.ClientID %>';

        // 触发器点击：先告诉窗体关闭时把值回写到哪些控件，再按当前输入值打开 IFrame 窗体。
        // 当前值只有浏览器知道，所以整段写在这里；encodeURIComponent 防止值里的 & # 截断 URL
        function onTriggerBox1TriggerClick(event) {
            F(window1ClientID).setSaveStateControlIds([triggerBox1ClientID, hiddenField1ClientID]);
            F(window1ClientID).show('./triggerbox_iframe_iframe.aspx?param1=' + encodeURIComponent(F(triggerBox1ClientID).getValue()));
        }

        function onTriggerBox2TriggerClick(event) {
            F(window2ClientID).setSaveStateControlIds([triggerBox2ClientID, hiddenField2ClientID]);
            F(window2ClientID).show('./triggerbox_iframe_iframe.aspx?param1=' + encodeURIComponent(F(triggerBox2ClientID).getValue()));
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示触发器把当前值传入子窗体，并在回填后让父页后台读取最新字段。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>传入、回填与提交</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TriggerBox1").ClientID %>'
                        title="在父页面弹出窗体的触发器">在父页面弹出窗体的触发器</strong>右侧搜索图标。<br />结果：客户端把当前文字编码到子页参数，并指定关闭时需要回写的控件；子页显示当前值。</li>
                <li>在子页修改选择并按该页入口确认。<br />结果：选择值回填对应触发器和隐藏字段，窗体关闭。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="在父页面弹出窗体的提交">在父页面弹出窗体的提交</strong>。<br />结果：父页回发读取已经回填的当前值，并在结果标签中显示。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableEdit</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TriggerBox1").ClientID %>'
                        title="在父页面弹出窗体的触发器">在父页面弹出窗体的触发器</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TriggerBox2").ClientID %>'
                        title="在本页面弹出窗体的触发器">在本页面弹出窗体的触发器</strong>）：初始为<code>false</code>，触发器禁止直接编辑，由子页回填。</li>
                <li><code>setSaveStateControlIds()</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="第 1 个窗口（编辑）">第 1 个窗口（编辑）</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>'
                        title="第 2 个窗口（编辑）">第 2 个窗口（编辑）</strong>）：打开前指定关闭回发需要保留的字段，避免回填值丢失。</li>
                <li><code>Target</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="第 1 个窗口（编辑）">第 1 个窗口（编辑）</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>'
                        title="第 2 个窗口（编辑）">第 2 个窗口（编辑）</strong>）：各组分别设为<code>Parent</code>、<code>Self</code>，两组分别在父页面和当前页面显示窗体。</li>
            </ul>
        </section>
    </template>
</body>
</html>
