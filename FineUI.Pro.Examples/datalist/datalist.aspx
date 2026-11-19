<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datalist.aspx.cs" Inherits="FineUI.Pro.Examples.datalist.datalist" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>基础数据列表</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" runat="server" IsFluid="true" MaxWidth="700" Title="城市列表" BodyPadding="10">
            <Items>
                <f:DataList ID="DataList1" runat="server">
                    <Items>
                        <f:DataListItem Text="北京" Value="beijing" />
                        <f:DataListItem Text="上海" Value="shanghai" />
                        <f:DataListItem Text="广州" Value="guangzhou" />
                        <f:DataListItem Text="合肥" Value="hefei" NavigateUrl="https://fineui.com/" Target="_blank" />
                    </Items>
                </f:DataList>
            </Items>
        </f:Panel>
        <p>普通页面可以直接声明列表项，展示图片、文字和超链接；点击合肥在新页面打开官网。</p>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示在基础数据列表中组合普通文字、固定 HTML 图片内容和超链接项目。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>阅读并打开链接项</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>'
                        title="数据列表">数据列表</strong>对照北京、上海、广州和合肥项目，再点击<code>合肥</code>。<br />结果：北京项目包含图片，其它项目按各自内容显示；合肥按链接配置在新页面打开官网。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Items</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：按声明顺序显示当前列表项。</li>
                <li><code>Value</code>（<strong>列表项目</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>' title="数据列表">数据列表</strong>）：使用城市编号作为稳定的非空项值。</li>
                <li><code>NavigateUrl</code>（<strong>列表项目</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataList1").ClientID %>'
                        title="数据列表">数据列表</strong>）：本页合肥项配置了超链接，其它项不因此自动变为链接。</li>
            </ul>
        </section>
    </template>
</body>
</html>
