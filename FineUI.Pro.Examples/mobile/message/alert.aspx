<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alert.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.message.alert" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigSpace="10" BodyPadding="10px" runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Title="提示对话框" runat="server" HeaderStyle="true">
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Button Text="提示对话框" runat="server" ID="Button1" OnClick="Button1_Click">
                </f:Button>
                <f:Button Text="提示对话框（ButtonFill）" runat="server" ID="Button2" OnClick="Button2_Click">
                </f:Button>
                <f:Button Text="提示对话框（ButtonPlain）" runat="server" ID="Button3" OnClick="Button3_Click">
                </f:Button>
            </Items>
        </f:Panel>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示移动提示对话框的结果处理与按钮样式。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>打开并处理当前对话框</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="第 1 个按钮（提示对话框）">第 1 个按钮（提示对话框）</strong>。<br />结果：本页显示提示对话框。</li>
                <li>点击<strong>确定</strong>，再重新打开并确定。<br />结果：提示框关闭，原页面继续保留。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>比较按钮样式</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>'
                        title="提示对话框（ButtonFill）">提示对话框（ButtonFill）</strong>。<br />结果：对话框底部按钮填充可用宽度。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>'
                        title="提示对话框（ButtonPlain）">提示对话框（ButtonPlain）</strong>。<br />结果：对话框使用本页简洁按钮样式。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ButtonFill</code>（<strong>对话框配置</strong>）：让对话框按钮填满底部工具栏。</li>
                <li><code>ButtonPlain</code>（<strong>对话框配置</strong>）：使用本页简洁按钮外观。</li>
            </ul>
        </section>
    </template>
</body>
</html>
