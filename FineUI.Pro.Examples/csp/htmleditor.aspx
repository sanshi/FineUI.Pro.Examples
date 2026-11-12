<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="htmleditor.aspx.cs" Inherits="FineUI.Pro.Examples.csp.htmleditor" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" CspScripts="true" CspScriptsAllowNonce="false" CspScriptsAllowUnsafeInline="true" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" LabelAlign="Top" EnableCollapse="false" Title="表单">
            <Items>
                <f:HtmlEditor runat="server" Label="文本编辑器" ID="HtmlEditor1" Editor="UEditor" BasePath="~/res/third-party/ueditor/" Height="250px">
                </f:HtmlEditor>
                <f:TextArea ID="TextArea1" Label="多行文本框" runat="server" Height="150px"
                    Text="FineUI的使命是创建 No JavaScript，No CSS，No UpdatePanel，No ViewState 的网站应用程序。">
                </f:TextArea>
                <f:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="获取 HTML 编辑器的内容" CssClass="marginr">
                </f:Button>
                <f:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="设置 HTML 编辑器的内容">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <br />

    </form>
    <script type="text/javascript">
        console.log('Hello world!');

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在富文本编辑器所需的 CSP 兼容例外下，验证 HTML 内容的读取与设置。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>验证编辑器内容往返</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="获取 HTML 编辑器的内容">获取 HTML 编辑器的内容</strong>。<br />结果：后台读取编辑器当前 HTML，写入下方多行文本框。</li>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextArea1").ClientID %>'
                        title="多行文本框">多行文本框</strong>输入 <code>&lt;p&gt;CSP 编辑器测试&lt;/p&gt;</code>，点击设置内容按钮，再重新读取。<br />结果：编辑器显示新文字，再次读取能得到对应 HTML。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>由于第三方类库（UEditor）使用了内联脚本，因此需要启用CspScriptsAllowUnsafeInline，允许所有的内联脚本执行。</li>
                <li>一般情况下推荐启用CspScriptsAllowNonce属性，这样更加安全。</li>
                <li>文章：<a target="_blank"
                        href="https://fineui.com/docs/#/Questions/5000_CSP_unsafe_inline">https://fineui.com/docs/#/Questions/5000_CSP_unsafe_inline</a></li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Editor</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor1").ClientID %>' title="文本编辑器">文本编辑器</strong>）：初始为
                    <code>UEditor</code>，选择本页使用的第三方富文本编辑器。
                </li>
                <li><code>BasePath</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor1").ClientID %>' title="文本编辑器">文本编辑器</strong>）：初始为
                    <code>~/res/third-party/ueditor/</code>，指定编辑器脚本、皮肤等文件的基础路径。
                </li>
                <li><code>CSP 兼容配置</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor1").ClientID %>'
                        title="文本编辑器">文本编辑器</strong>）：第三方编辑器需要本页明确允许的脚本策略例外；该页面不能当作没有例外的严格 CSP 示范。</li>
            </ul>
        </section>
    </template>
</body>
</html>
