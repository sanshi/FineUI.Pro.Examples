<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button.aspx.cs" Inherits="FineUI.Pro.Examples.csp.button" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Button/Button</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" CspScripts="true" CspScriptsAllowNonce="true" runat="server" />

        <f:Button ID="btnDefault" ClientIDMode="Static" Text="缺省按钮" CssClass="marginr" runat="server" />
        <f:Button ID="btnPrimary" Text="主按钮" ButtonColor="Primary" runat="server" />
        <br />
        <br />
        <f:Button ID="btnChangeEnable" Text="启用后面的按钮" OnClick="btnChangeEnable_Click" CssClass="marginr" runat="server" />
        <f:Button ID="btnEnable" Text="禁用的按钮" OnClick="btnEnable_Click" Enabled="false" runat="server" />
        <br />
        <br />
        <f:Button ID="btnChangePressed" Text="改变后面按钮的按下状态" OnClick="btnChangePressed_Click" CssClass="marginr" runat="server" />
        <f:Button ID="btnPressed" Text="按下的按钮" EnablePress="true" Pressed="true" runat="server" />
        <br />
        <br />
        <f:Button ID="btnTooltip" Text="这个按钮有提示信息（点击改变提示信息）" ToolTip="这是按钮的提示信息" OnClick="btnTooltip_Click" runat="server" />
        <br />
        <br />
        <br />
        <f:Button ID="Button4" Text="小按钮" Size="Small" CssClass="marginr" runat="server" />
        <f:Button ID="Button1" Text="普通按钮" CssClass="marginr" runat="server" />
        <f:Button ID="Button2" Text="中等按钮" Size="Medium" CssClass="marginr" runat="server" />
        <f:Button ID="Button3" Text="大按钮" Size="Large" runat="server" />
    </form>

    <script nonce="<%= PageManager.Instance.CspScriptsNonceValue %>" type="text/javascript">
        console.log('Hello world!');

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在本页 CSP 策略下执行后台按钮更新，验证启用状态与按下状态。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>验证按钮状态更新</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnChangeEnable").ClientID %>'
                        title="启用后面的按钮">启用后面的按钮</strong>。<br />结果：后台把禁用按钮改为可用，再点击该按钮可显示业务通知。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnChangePressed").ClientID %>'
                        title="改变后面按钮的按下状态">改变后面按钮的按下状态</strong>。<br />结果：后台切换另一个按钮的按下状态，连续点击可来回切换。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Enabled</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnEnable").ClientID %>' title="禁用的按钮">禁用的按钮</strong>）：初始为
                    <code>false</code>，控制按钮是否接受操作。
                </li>
                <li><code>EnablePress</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnPressed").ClientID %>' title="按下的按钮">按下的按钮</strong>）：初始为
                    <code>true</code>，允许按钮保持按下或抬起状态。
                </li>
                <li><code>Pressed</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnPressed").ClientID %>' title="按下的按钮">按下的按钮</strong>）：初始为
                    <code>true</code>，指定按钮当前的按下状态。
                </li>
                <li><code>CSP</code>（<strong class="example-control-reference" data-example-control="btnDefault"
                        title="缺省按钮">缺省按钮</strong>）：页面脚本按本端策略执行；本例关注实际按钮回发与状态更新，不需要把业务处理写成内联事件属性。</li>
            </ul>
        </section>
    </template>
</body>
</html>
