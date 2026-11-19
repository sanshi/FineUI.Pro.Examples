<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_collapse.aspx.cs" Inherits="FineUI.Pro.Examples.panel.panel_collapse" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" Title="面板一" BodyPadding="10px" EnableCollapse="true" IconUrl="~/res/images/16/8.png"
            EnableCollapseEvent="true" OnCollapse="Panel1_CollapseExpand" EnableExpandEvent="true" OnExpand="Panel1_CollapseExpand">
            <Items>
                <f:ContentPanel ID="ContentPanel1" Title="面板二" ShowBorder="true" Height="200px" BodyPadding="10px" EnableCollapse="true" ShowHeader="true"
                    EnableCollapseEvent="true" OnCollapse="ContentPanel1_CollapseExpand" EnableExpandEvent="true" OnExpand="ContentPanel1_CollapseExpand"
                    runat="server">
                    展开折叠这两个面板。
                </f:ContentPanel>
            </Items>
        </f:Panel>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示分别监听嵌套面板的展开和折叠事件，并读取事件发生后的状态。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>核对两个面板的状态</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>'
                        title="面板一">面板一</strong>及其内部面板中点击折叠图标，再分别展开。<br />结果：每次状态变化触发对应面板事件并回发，后台提示面板名称与展开或折叠状态。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>OnCollapse</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板一">面板一</strong>）：对应面板折叠后处理当前状态。</li>
                <li><code>OnExpand</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板一">面板一</strong>）：对应面板展开后处理当前状态。</li>
            </ul>
        </section>
    </template>
</body>
</html>
