<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alert_download.aspx.cs"
    Inherits="FineUI.Pro.Examples.message.alert_download" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/message/alert_download_textfile.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button Text="操作（先弹出提示框，点击确定后下载文件）" runat="server" ID="btnOperation" OnClick="btnOperation_Click">
        </f:Button>
    </form>
    <script>
        function confirmOKCallback() {
            window.location.href = F.resolveUrl('/message/alert_download_textfile.ashx');
        }

        function confirmCancelCallback() {
            F.customEvent('ConfirmCancel');
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>通过确认对话框控制是否开始文件下载。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>确认后下载</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOperation").ClientID %>'
                        title="操作（先弹出提示框，点击确定后下载文件）">操作（先弹出提示框，点击确定后下载文件）</strong>。<br />结果：先显示下载确认框，此时没有开始下载。</li>
                <li>在确认框点击确定。<br />结果：开始下载示例文件。</li>
                <li>重新加载示例，重复第一步后点击取消。<br />结果：显示取消提示，不下载文件；窗体保持原状态。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ok / cancel</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOperation").ClientID %>'
                        title="操作（先弹出提示框，点击确定后下载文件）">操作（先弹出提示框，点击确定后下载文件）</strong>）：确认回调负责开始下载，取消回调只返回取消结果。</li>
            </ul>
        </section>
    </template>
</body>
</html>
