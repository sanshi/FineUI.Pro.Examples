<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="selectprovince1.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.selectprovince1" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/selectprovince1_child.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" Title="表单" BodyPadding="10px" runat="server" EnableCollapse="false">
            <Items>
                <f:DropDownList ID="ddlSheng" Label="请选择省份" runat="server">
                </f:DropDownList>
                <f:Button ID="Button1" runat="server" Text="从弹出窗体中选择" ClickHandler="onOpenWindow1Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <f:Window ID="Window1" Title="选择省份" Hidden="true" EnableIFrame="true" runat="server" EnableMaximize="true" EnableResize="true" Target="Parent"
            IsModal="true" Width="562px" Height="470px">
        </f:Window>
        <f:Label ID="labResult" CssStyle="font-weight:bold;" runat="server">
        </f:Label>
        <br />
    </form>
    <script>
        var Window1ClientID = '<%= Window1.ClientID %>';

        function onOpenWindow1Click(event) {
            F(Window1ClientID).show('<%= ResolveUrl("~/iframe/selectprovince1_child.aspx") %>');
        }

        var shengClientID = '<%= ddlSheng.ClientID %>';

        function selectProvince(name) {
            F(shengClientID).setValue(name);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示子页面直接通过 JavaScript 回填父页面字段，无需后台回发。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>选择后回填父页面</h3>
            <ol>
                <li>在子页面选择北京并按该页面的确定入口提交。<br />结果：浏览器把父页面省份字段改为北京，并隐藏选择窗体；回填过程不需要保存数据库。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableIFrame</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>'
                        title="选择省份">选择省份</strong>）：初始为<code>true</code>，在窗体内加载省份选择页。</li>
                <li><code>Target</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>'
                        title="选择省份">选择省份</strong>）：初始为<code>Parent</code>，指定选择窗体在哪一层页面显示。</li>
                <li><code>F.getActiveWindow()</code>（<strong>省份选择子页面</strong>）：子页面找到当前选择窗体及其调用页面，向本页目标字段回填选择。</li>
            </ul>
        </section>
    </template>
</body>
</html>
