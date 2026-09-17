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
                <f:TextArea ID="TextArea1" Label="多行文本框" runat="server" Height="150px" Text="FineUI的使命是创建 No JavaScript，No CSS，No UpdatePanel，No ViewState 的网站应用程序。">
                </f:TextArea>
                <f:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="获取 HTML 编辑器的内容"
                    CssClass="marginr">
                </f:Button>
                <f:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="设置 HTML 编辑器的内容">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <br />
        注：
        <ul>
            <li>由于第三方类库（UEditor）使用了内联脚本，因此需要启用CspScriptsAllowUnsafeInline，允许所有的内联脚本执行。</li>
            <li>一般情况下推荐启用CspScriptsAllowNonce属性，这样更加安全。</li>
            <li>文章：<a target="_blank" href="https://fineui.com/docs/#/Questions/5000_CSP_unsafe_inline">https://fineui.com/docs/#/Questions/5000_CSP_unsafe_inline</a></li>
        </ul>
    </form>
    <script type="text/javascript">

        console.log('Hello world!');

    </script>
</body>
</html>
