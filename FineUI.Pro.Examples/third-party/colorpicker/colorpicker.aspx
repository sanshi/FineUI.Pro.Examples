<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="colorpicker.aspx.cs" Inherits="FineUI.Pro.Examples.third_party.colorpicker.colorpicker" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">
        <link rel="stylesheet" href="<%= PageContext.ResolveUrl("~/res/third-party/spectrum/spectrum.css") %>" />
        <style>
            .mycolor .f-field-body {
                display: inline-block !important;
                width: 150px;
                margin-right: 5px;
            }

            .mycolor .sp-replacer {
                border-width: 0;
                background-color: transparent;
            }

            .mycolor .sp-dd {
                display: none;
            }

            .mycolor .sp-preview {
                margin-right: 0;
                height: 100%;
            }

        </style>
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="表单" ShowHeader="true">
            <Items>
                <f:DatePicker runat="server" Required="true" Label="日期一" EmptyText="请选择日期一" ID="DatePicker1" ShowRedStar="true">
                </f:DatePicker>
                <f:TextBox ID="tbxMyBox" CssClass="mycolor" Text="#f90" Required="true" ShowRedStar="true" Label="选择颜色" runat="server">
                </f:TextBox>
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <f:Label ID="labResult" ShowLabel="false" EncodeText="false" runat="server">
        </f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/third-party/spectrum/spectrum.js") %>" type="text/javascript"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/third-party/spectrum/i18n/jquery.spectrum-zh-cn.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        var tbxMyBoxClientID = '<%= tbxMyBox.ClientID %>';

        F.ready(function() {

            var tbxMyBox = F(tbxMyBoxClientID);

            tbxMyBox.bodyEl.spectrum({
                preferredFormat: "hex3",
                showInput: true,
                showPalette: true,
                palette: [
                    ["#000", "#444", "#666", "#999", "#ccc", "#eee", "#f3f3f3", "#fff"],
                    ["#f00", "#f90", "#ff0", "#0f0", "#0ff", "#00f", "#90f", "#f0f"],
                    ["#f4cccc", "#fce5cd", "#fff2cc", "#d9ead3", "#d0e0e3", "#cfe2f3", "#d9d2e9", "#ead1dc"],
                    ["#ea9999", "#f9cb9c", "#ffe599", "#b6d7a8", "#a2c4c9", "#9fc5e8", "#b4a7d6", "#d5a6bd"],
                    ["#e06666", "#f6b26b", "#ffd966", "#93c47d", "#76a5af", "#6fa8dc", "#8e7cc3", "#c27ba0"],
                    ["#c00", "#e69138", "#f1c232", "#6aa84f", "#45818e", "#3d85c6", "#674ea7", "#a64d79"],
                    ["#900", "#b45f06", "#bf9000", "#38761d", "#134f5c", "#0b5394", "#351c75", "#741b47"],
                    ["#600", "#783f04", "#7f6000", "#274e13", "#0c343d", "#073763", "#20124d", "#4c1130"]
                ]
            });


        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把第三方颜色选择器绑定到 FineUI 文本框，并提交选择后的颜色值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>选色并读取字段</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxMyBox").ClientID %>'
                        title="选择颜色">选择颜色</strong>，在调色板选择一个色块。<br />结果：颜色值回填输入框，颜色外观同步改变。</li>
                <li>选择日期后点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSubmit").ClientID %>'
                        title="提交表单">提交表单</strong>。<br />结果：验证通过后回发，后台读取当前日期和颜色值并显示通知。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CssClass</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxMyBox").ClientID %>' title="选择颜色">选择颜色</strong>）：初始为
                    <code>mycolor</code>，使用本页定义的 CSS 类设置外观。
                </li>
                <li><code>Required</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DatePicker1").ClientID %>' title="日期一">日期一</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxMyBox").ClientID %>'
                        title="选择颜色">选择颜色</strong>）：初始为 <code>true</code>，要求先填写或选择该字段，未通过时阻止表单提交。</li>
                <li><code>ValidateForms</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSubmit").ClientID %>' title="提交表单">提交表单</strong>）：初始为
                    <code>SimpleForm1</code>，提交前验证指定表单；验证失败时显示提示并阻止回发。
                </li>
                <li><code>ColorPicker</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxMyBox").ClientID %>'
                        title="选择颜色">选择颜色</strong>）：在页面就绪后绑定颜色文本框，选色回调更新其值。</li>
            </ul>
        </section>
    </template>
</body>
</html>
