<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cssstyle.aspx.cs" Inherits="FineUI.Pro.Examples.other.cssstyle" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        .red {
            font-weight: bold;
            color: Red;
        }

        .green {
            font-weight: bold;
            font-style: italic;
            font-size: 1.5em;
            color: Green;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />

        <br />
        <f:Label ID="Label1" runat="server" Text="文本一，注意观察文本的样式">
        </f:Label>
        <br />
        <f:Button CssClass="marginr" ID="Button1" runat="server" OnClick="Button1_Click" Text="通过 CssStyle 修改文本的样式">
        </f:Button>
        <f:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="清空 CssStyle 设置的样式">
        </f:Button>

        <br />
        <br />
        <br />
        <br />
        <f:Label ID="Label2" runat="server" Text="文本二，注意观察文本的样式">
        </f:Label>
        <br />
        <f:Button CssClass="marginr" ID="Button2" runat="server" OnClick="Button2_Click" Text="通过 CssClass 修改文本的样式">
        </f:Button>
        <f:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="清空 CssClass 设置的样式">
        </f:Button>
        <br />
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>分别用行内样式和 CSS 类改变两段文字，并清除各自设置。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>设置与清除两种样式</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="通过 CssStyle 修改文本的样式">通过 CssStyle 修改文本的样式</strong>。<br />结果：后台按本页配置修改对应文字的字体或颜色，可与另一组对照。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>'
                        title="清空 CssStyle 设置的样式">清空 CssStyle 设置的样式</strong>。<br />结果：移除对应文字通过该方式添加的样式，其它方式设置的样式不一起清除。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>'
                        title="通过 CssClass 修改文本的样式">通过 CssClass 修改文本的样式</strong>。<br />结果：后台按本页配置修改对应文字的字体或颜色，可与另一组对照。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button4").ClientID %>'
                        title="清空 CssClass 设置的样式">清空 CssClass 设置的样式</strong>。<br />结果：移除对应文字通过该方式添加的样式，其它方式设置的样式不一起清除。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CssClass</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="通过 CssStyle 修改文本的样式">通过 CssStyle
                        修改文本的样式</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="通过 CssClass 修改文本的样式">通过 CssClass
                        修改文本的样式</strong>）：初始为 <code>marginr</code>，使用本页定义的 CSS 类设置外观。</li>
                <li><code>CssClass / CssStyle</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Label1").ClientID %>'
                        title="文本一，注意观察文本的样式">文本一，注意观察文本的样式</strong>）：类名引用页面样式定义，行内样式直接给出 CSS 声明；设置和清除分别演示。</li>
            </ul>
        </section>
    </template>
</body>
</html>
