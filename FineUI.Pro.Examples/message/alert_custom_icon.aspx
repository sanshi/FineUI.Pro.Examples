<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alert_custom_icon.aspx.cs" Inherits="FineUI.Pro.Examples.message.alert_custom_icon" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button Text="点击弹出对话框（Icon）" runat="server" ID="btnHello" OnClick="btnHello_Click">
        </f:Button>
        <br />
        <br />
        <f:Button Text="在顶层窗口弹出对话框（IconUrl）" runat="server" ID="btnHello2" OnClick="btnHello2_Click">
        </f:Button>
        <br />
        <br />
        <f:Button Text="在顶层窗口弹出对话框（IconFont）" runat="server" ID="btnHello3" OnClick="btnHello3_Click">
        </f:Button>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对照内置图片、自定义图片地址和图标字体三种消息图标来源。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照图标来源</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnHello").ClientID %>'
                        title="点击弹出对话框（Icon）">点击弹出对话框（Icon）</strong>。<br />结果：后台回发后弹出提示框，消息旁显示该按钮所对应的图标。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnHello2").ClientID %>'
                        title="在顶层窗口弹出对话框（IconUrl）">在顶层窗口弹出对话框（IconUrl）</strong>。<br />结果：后台回发后弹出提示框，消息旁显示该按钮所对应的图标。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnHello3").ClientID %>'
                        title="在顶层窗口弹出对话框（IconFont）">在顶层窗口弹出对话框（IconFont）</strong>。<br />结果：后台回发后弹出提示框，消息旁显示该按钮所对应的图标。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Icon / IconUrl / IconFont</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnHello").ClientID %>'
                        title="点击弹出对话框（Icon）">点击弹出对话框（Icon）</strong>）：为新对话框分别选择内置图标、图片地址或字体图标；本页按按钮分开演示。</li>
            </ul>
        </section>
    </template>
</body>
</html>
