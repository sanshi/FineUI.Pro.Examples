<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="label.aspx.cs" Inherits="FineUI.Pro.Examples.form.label" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .customlabel .f-field-label {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Label ID="Label1" Text="普通的 Label 标签，会自动编码字符串（比如：<strong></strong>）" runat="server">
        </f:Label>
        <br />
        <f:Label ID="Label4" EncodeText="false" Text="<a href='http://www.ustc.edu.cn/' target='_blank'>中国科学技术大学（Label 标签生成的链接）</a>"
            runat="server">
        </f:Label>
        <br />
        <f:Label ID="Label2" EncodeText="false" CssClass="customlabel" Text="修改文本的样式（CssClass）" runat="server">
        </f:Label>
        <br />
        <f:Label ID="Label3" Enabled="false" EncodeText="false" Text="<span style='color:red;font-weight:bold;'>修改文本的样式（内嵌HTML）</span>"
            runat="server">
        </f:Label>
        <br />
        <f:Button ID="btnChangeEnable" Text="启用/禁用最后一个标签" runat="server" OnClick="btnChangeEnable_Click" />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示文本标签显示普通文字、可信 HTML 和自定义样式，并切换可用状态。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>对比文字与 HTML</h3>
            <ul>
                <li>
                    对照第一段标签文字和“中国科学技术大学”链接。<br />
                    结果：第一段中的 &lt;strong&gt;&lt;/strong&gt; 按文字显示；允许 HTML 的标签显示真正的链接和内嵌样式。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>切换标签状态</h3>
            <ul>
                <li>
                    点击“启用/禁用最后一个标签”。<br />
                    结果：回发后，后台反转最后一个标签的可用状态，文字和自定义样式保留。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EncodeText</code>：默认编码文字；设为 false 时按可信 HTML 显示链接或内嵌样式。</li>
                <li><code>CssClass</code>：给标签设置自定义样式类。</li>
                <li><code>Enabled</code>：控制标签的可用状态。</li>
            </ul>
        </section>
    </template>
</body>
</html>
