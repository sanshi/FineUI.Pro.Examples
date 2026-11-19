<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addtab.aspx.cs" Inherits="FineUI.Pro.Examples.other.addtab" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="Button1" runat="server" ClickHandler="onOpenHelloFineUIClick" Text="向父页面添加选项卡">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button4" runat="server" ClickHandler="onOpenHelloFineUI2Click" Text="向父页面添加选项卡（图标字体，与上个按钮添加的选项卡为同一个）">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button2" runat="server" ClickHandler="onCloseActiveTabClick" Text="关闭当前选项卡">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="关闭当前选项卡（服务器端注册脚本）">
        </f:Button>
    </form>
    <script type="text/javascript">
        var basePath = '<%= PageContext.ResolveUrl("~/") %>';

        function onOpenHelloFineUIClick(event) {
            parent.addExampleTab({
                id: 'hello_fineui_tab',
                iframeUrl: basePath + 'basic/hello.aspx',
                title: '你好 FineUI.Pro',
                icon: basePath + 'res/images/filetype/vs-aspx.png',
                refreshWhenExist: true
            });
        }

        function onOpenHelloFineUI2Click(event) {
            // 这里的 id 和上面的相同，所以会使用同一个选项卡
            parent.addExampleTab({
                id: 'hello_fineui_tab',
                iframeUrl: basePath + 'basic/login.aspx',
                title: '登录页面',
                iconFont: 'sign-in',
                refreshWhenExist: true
            });
        }

        function onCloseActiveTabClick(event) {
            parent.removeActiveTab();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示从 <code>iframe</code> 示例向父页面主标签区域打开新页，按同一 <code>ID</code> 复用标签并关闭当前标签。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>打开与复用父页面标签</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="向父页面添加选项卡">向父页面添加选项卡</strong>。<br />结果：在父框架中新建并激活本页指定的示例标签。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button4").ClientID %>'
                        title="向父页面添加选项卡（图标字体，与上个按钮添加的选项卡为同一个）">向父页面添加选项卡（图标字体，与上个按钮添加的选项卡为同一个）</strong>。<br />结果：使用同一个目标 <code>ID</code> 复用已有标签，不重复创建另一份页面。
                </li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>'
                        title="关闭当前选项卡">关闭当前选项卡</strong>。<br />结果：浏览器关闭本页所属的当前标签。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>addExampleTab()</code>（<strong>父页面主标签区域</strong>）：向父框架传入稳定 <code>ID</code>、地址、标题及图标；同一 <code>ID</code> 对应同一个标签。</li>
                <li><code>removeActiveTab()</code>（<strong>父页面主标签区域</strong>）：通过父框架关闭当前示例标签。</li>
            </ul>
        </section>
    </template>
</body>
</html>
