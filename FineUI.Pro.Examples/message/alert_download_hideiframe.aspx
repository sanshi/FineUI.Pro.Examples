<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alert_download_hideiframe.aspx.cs"
    Inherits="FineUI.Pro.Examples.message.alert_download_hideiframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/message/alert_download_hideiframe_window.aspx;~/message/alert_download_textfile.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window2" Width="650px" Height="300px" Icon="TagBlue" Title="窗体（EnableIFrame=true）" EnableMaximize="true" EnableCollapse="false"
            runat="server" EnableResize="true" IsModal="false" EnableIFrame="true" IFrameUrl="~/message/alert_download_hideiframe_window.aspx">
        </f:Window>
    </form>
    <script>
        function showConfirm() {
            F.confirm({
                message: '操作成功！点击确定按钮开始下载文件，点取消按钮弹出对话框',
                ok: function() {
                    window.location.href = F.resolveUrl('/message/alert_download_textfile.ashx');
                },
                cancel: function() {
                    F.customEvent('ConfirmCancel');
                }
            });
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在 IFrame 窗体内触发下载确认，确定后先隐藏父窗体再下载文件。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>确认后下载</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>'
                        title="窗体（EnableIFrame=true）">窗体（EnableIFrame=true）中的操作按钮</strong>。<br />结果：先显示下载确认框，此时没有开始下载。</li>
                <li>在确认框点击确定。<br />结果：先隐藏承载子页的父窗体，再开始下载示例文件。</li>
                <li>重新加载示例，重复第一步后点击取消。<br />结果：显示取消提示，不下载文件；窗体保持原状态。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ok / cancel</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>'
                        title="窗体（EnableIFrame=true）">窗体（EnableIFrame=true）</strong>）：确认回调负责开始下载，取消回调只返回取消结果。</li>
                <li><code>EnableIFrame</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>'
                        title="窗体（EnableIFrame=true）">窗体（EnableIFrame=true）</strong>）：初始为 <code>true</code>，在窗体或面板中用 IFrame 加载独立页面。</li>
                <li><code>IFrameUrl</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>'
                        title="窗体（EnableIFrame=true）">窗体（EnableIFrame=true）</strong>）：初始为 <code>~/message/alert_download_hideiframe_window.aspx</code>，指定 IFrame
                    实际加载的页面地址。</li>
            </ul>
        </section>
    </template>
</body>
</html>
