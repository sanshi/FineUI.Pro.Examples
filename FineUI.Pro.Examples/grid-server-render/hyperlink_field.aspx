<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hyperlink_field.aspx.cs" Inherits="FineUI.Pro.Examples.grid_server_render.hyperlink_field" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>超链接列：绑定与参数编码</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" DataIDField="Id" DataKeyNames="Id,Name" IsFluid="true" ShowHeader="true" Title="超链接列：绑定与参数编码"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField ColumnID="Number" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataTextField="Major" DataToolTipField="Major" DataNavigateUrlFields="Major"
                    DataNavigateUrlFormatString="https://gsa.ustc.edu.cn/search?q={0}" UrlEncode="true" Target="_blank" Width="300px" />
            </Columns>
        </f:Grid>

        <f:Label ID="labResult" runat="server" />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>由当前行字段生成超链接的文字、悬停提示与跳转参数。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>比较不同行的专业链接</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="超链接列：绑定与参数编码">超链接列：绑定与参数编码</strong>不同记录的专业链接上悬停，再点击其中一个链接。<br />结果：文字和提示来自本行专业，目标地址带入本行字段并在新窗口打开；字段值按链接格式组合，不把所有行都指向固定资料。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>HyperLinkField 在服务端生成链接，UrlEncode 将专业名称编码为地址参数；新项目优先使用 RenderField 的渲染函数。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataTextField / DataToolTipField</code>（<strong>超链接列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="超链接列：绑定与参数编码">超链接列：绑定与参数编码</strong>）：均从本行的
                    <code>Major</code> 字段取得专业名称。
                </li>
                <li><code>DataNavigateUrlFields / DataNavigateUrlFormatString</code>（<strong>超链接列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="超链接列：绑定与参数编码">超链接列：绑定与参数编码</strong>）：把本行字段代入地址格式，地址参数需要按 URL 规则编码。</li>
            </ul>
        </section>
    </template>
</body>
</html>
