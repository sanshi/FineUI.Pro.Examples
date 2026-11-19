<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aspnet_literal.aspx.cs"
    Inherits="FineUI.Pro.Examples.aspnet.aspnet_literal" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AjaxAspnetControls="Label1,Literal1,Literal2_Container" runat="server" />
        <asp:Label ID="Label1" Text="Label1" runat="server"></asp:Label>
        <br />
        <asp:Literal ID="Literal1" Text="Literal1" runat="server"></asp:Literal>
        <br />
        <div id="Literal2_Container">
            <asp:Literal ID="Literal2" Text="Literal2" runat="server"></asp:Literal>
        </div>
        <br />
        <f:Button ID="Button1" runat="server" Text="更新上面几个文本值" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        注意：只有Label1和Literal2的值更新了。
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对照 ASP.NET Label 与 Literal 的 HTML 容器差异，以及 AJAX 更新所需的可定位元素。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>更新有容器和无容器的文字</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="更新上面几个文本值">更新上面几个文本值</strong>。<br />结果：Label1 和包在 Literal2_Container 中的 Literal2 更新为带时间的文字；没有外层可定位元素的 Literal1 保持原值。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AjaxAspnetControls</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="更新上面几个文本值">更新上面几个文本值</strong>）：登记可由 AJAX
                    替换的原生控件或外层容器；Literal 自身不输出可定位 HTML 元素。</li>
                <li><code>Literal2_Container</code>（<strong class="example-control-reference" data-example-control="Literal2_Container"
                        title="Literal2 外层容器">Literal2 外层容器</strong>）：为 Literal2 提供实际 DOM 容器，更新时替换其中内容。</li>
            </ul>
        </section>
    </template>
</body>
</html>
