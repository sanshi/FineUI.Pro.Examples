<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notify_addtab.aspx.cs"
    Inherits="FineUI.Pro.Examples.message.notify_addtab" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .addtabcontainer {
            text-align: center;
            padding-top: 20px;
            padding-bottom: 20px;
            font-size: 14px;
            font-weight: bold;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button Text="弹出通知对话框" runat="server" ID="btnOperation1" OnClick="btnOperation1_Click1">
        </f:Button>
        <br />
        <br />
    </form>

    <script type="text/javascript">
        var basePath = '<%= PageContext.ResolveUrl("~/") %>';

        function openExampleHello(notifyId) {
            parent.addExampleTab({
                iframeUrl: basePath + 'basic/hello.aspx',
                title: '你好 FineUI.Pro',
                icon: basePath + 'res/images/filetype/vs-aspx.png',
                refreshWhenExist: true
            });

            // 关闭通知对话框
            F(notifyId).hide();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在通知正文中提供链接，把指定示例打开到父框架的主选项卡。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-link" aria-hidden="true"></i>从通知打开示例</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOperation1").ClientID %>'
                        title="弹出通知对话框">弹出通知对话框</strong>。<br />结果：通知中显示向父页面添加选项卡的链接。</li>
                <li>点击通知正文中的链接。<br />结果：从框架打开时新增或激活对应示例标签，并隐藏通知；单独打开时按页面提供的打开方式访问示例。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>addExampleTab</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOperation1").ClientID %>'
                        title="弹出通知对话框">弹出通知对话框</strong>）：由通知链接的客户端回调请求父页面打开示例；链接文字不作为脚本执行。</li>
            </ul>
        </section>
    </template>
</body>
</html>
