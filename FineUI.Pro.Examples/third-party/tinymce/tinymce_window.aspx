<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tinymce_window.aspx.cs" ValidateRequest="false"
    Inherits="FineUI.Pro.Examples.aspnet.tinymce_window" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        /* 通过 CSS 设置 */
        .mce-menu {
            z-index: 99999 !important;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window1" runat="server" Width="900px" Height="500px" Layout="Fit" BodyPadding="10px" EnableCollapse="false" Title="简单表单" IsModal="false"
            EnableResize="true">
            <Items>
                <f:SimpleForm ID="SimpleForm1" Layout="Fit" runat="server" LabelAlign="Top" ShowBorder="false" ShowHeader="false">
                    <Items>
                        <f:HtmlEditor runat="server" Label="文本编辑器" ID="HtmlEditor1" Editor="TinyMCE" BasePath="~/res/third-party/tinymce/" ToolbarSet="Full">
                        </f:HtmlEditor>
                    </Items>
                </f:SimpleForm>
            </Items>
            <Toolbars>
                <f:Toolbar Position="Bottom" ToolbarAlign="Right" runat="server">
                    <Items>
                        <f:Button ID="Button2" runat="server" CssClass="marginr" Text="设置编辑器的值" OnClick="Button2_Click">
                        </f:Button>
                        <f:Button ID="Button1" runat="server" Text="获取编辑器的值" OnClick="Button1_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>
        <br />
        注：本示例不支持文件上传，请根据UEditor官网文档自行配置。
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>让 TinyMCE 填充可调整大小的窗体，重点查看编辑区随容器变化。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>调整窗体中的编辑区</h3>
            <ul>
                <li>拖动<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>'
                        title="简单表单">简单表单</strong>的边缘，分别放大和缩小。<br />结果：<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor1").ClientID %>'
                        title="文本编辑器">文本编辑器</strong>跟随窗体内容区域重新计算大小，工具栏和编辑内容保留。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Layout</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="简单表单">简单表单</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("SimpleForm1").ClientID %>'
                        title="表单">表单</strong>）：初始为 <code>Fit</code>，规定容器内子控件的排列和空间分配方式。</li>
                <li><code>EnableResize</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="简单表单">简单表单</strong>）：初始为
                    <code>true</code>，控制是否允许拖动窗体边缘调整大小。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
