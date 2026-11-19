<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ueditor_config.aspx.cs" ValidateRequest="false"
    Inherits="FineUI.Pro.Examples.aspnet.ueditor_config" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" LabelAlign="Top" EnableCollapse="false" Title="表单">
            <Items>
                <f:HtmlEditor runat="server" Label="文本编辑器" ID="HtmlEditor1" Editor="UEditor" BasePath="~/res/third-party/ueditor/" ToolbarSet="Full"
                    Height="350px">
                    <Options>
                        <f:OptionItem Key="lang" Value="en" />
                        <f:OptionItem Key="toolbars"
                            Value="[['bold', 'italic', 'underline', 'strikethrough', '|', 'insertorderedlist', 'insertunorderedlist', '|', 'justifyleft', 'justifycenter', 'justifyright', '|', 'link', 'unlink', '|', 'source']]"
                            PersistOriginal="true" />
                    </Options>
                </f:HtmlEditor>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Button ID="Button2" runat="server" CssClass="marginr" Text="设置编辑器的值" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button1" runat="server" Text="获取编辑器的值" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        注：本示例通过 Options 属性设置 UEditor 的语言（英文）和工具栏（自定义）。参考文档：http://fex.baidu.com/ueditor/#start-config
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>通过 Options 覆盖 UEditor 的默认配置，重点对照自定义工具栏或菜单。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>对照自定义配置</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor1").ClientID %>'
                        title="文本编辑器">文本编辑器</strong>的顶部工具栏与菜单区域。<br />结果：工具栏和编辑器选项按本页 Options 设置生效，不沿用默认完整工具栏。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Options</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor1").ClientID %>' title="文本编辑器">文本编辑器</strong>）：把本页提供的配置对象传给
                    UEditor；具体键名使用该编辑器自己的 API。</li>
            </ul>
        </section>
    </template>
</body>
</html>
