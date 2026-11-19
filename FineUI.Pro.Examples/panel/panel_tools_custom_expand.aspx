<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_tools_custom_expand.aspx.cs" Inherits="FineUI.Pro.Examples.panel.panel_tools_custom_expand" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" Title="面板" Height="350px" BodyPadding="10px" EnableCollapse="false" IconUrl="~/res/images/16/8.png">
            <Items>
                <f:Label runat="server" Text="面板内容"></f:Label>
            </Items>
            <Tools>
                <f:Tool ID="Tool4" runat="server" IconFont="_Save" ToolTip="保存" Text="保存" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool18" runat="server" IconFont="_Plus" ToolTip="新增" Text="新增" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool10" runat="server" IconFont="_Edit" ToolTip="编辑" Text="编辑" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool5" runat="server" IconFont="_Minus" ToolTip="删除" Text="删除" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool1" runat="server" IconFont="_RoundMinus" ToolTip="折叠" Text="折叠" ClickHandler="onToolIconClick"></f:Tool>
            </Tools>
        </f:Panel>
        <br />
        <f:Button ID="Button2" CssClass="marginr" Text="检查面板的折叠状态" runat="server" OnClick="Button2_Click">
        </f:Button>
    </form>
    <script>
        var panel1ClientID = '<%= Panel1.ClientID %>';

        function onToolIconClick(event) {
            // 当前点击的图标字体
            var iconFont = this.iconFont;
            var text = this.text;

            F.notify({
                message: '你点击了标题栏工具图标：' + text,
                messageIconFont: iconFont,
                displayMilliseconds: 3000,
                positionX: 'center',
                positionY: 'center'
            });

            // 展开，折叠
            var panel1 = F(panel1ClientID);
            if (iconFont === 'f-iconfont-round-minus') {

                this.setIconFont('f-iconfont-round-plus');
                this.setText('展开');
                this.setTooltip('展开');
                panel1.collapse();

            } else if (iconFont === 'f-iconfont-round-plus') {

                this.setIconFont('f-iconfont-round-minus');
                this.setText('折叠');
                this.setTooltip('折叠');
                panel1.expand();

            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示用自定义工具控制面板折叠，并同步更换图标与文字。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>使用自定义展开折叠工具</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>'
                        title="面板">面板</strong>标题栏点击<strong>折叠</strong>工具。<br />结果：当前面板收起，工具文字改为展开；再次点击恢复内容，并把文字改回折叠。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Tools</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板">面板</strong>）：声明当前面板的自定义标题工具。</li>
            </ul>
        </section>
    </template>
</body>
</html>
