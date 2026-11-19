<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="server_error.aspx.cs" Inherits="FineUI.Pro.Examples.other.server_error" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="服务器异常（500）">
        </f:Button>
        <br />
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>有意在后台抛出异常，查看框架默认的请求错误反馈。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>触发并识别请求错误</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button5").ClientID %>'
                        title="服务器异常（500）">服务器异常（500）</strong>。<br />结果：后台返回 HTTP 500，框架显示服务器错误窗口，可关闭后继续操作页面。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>HTTP 500</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button5").ClientID %>'
                        title="服务器异常（500）">服务器异常（500）</strong>）：后台示例事件有意抛出异常，默认错误处理展示请求失败。</li>
            </ul>
        </section>
    </template>
</body>
</html>
