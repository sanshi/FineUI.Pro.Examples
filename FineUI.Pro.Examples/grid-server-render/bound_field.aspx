<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bound_field.aspx.cs" Inherits="FineUI.Pro.Examples.grid_server_render.bound_field" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>绑定列：格式化与空值</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" DataIDField="Id" DataKeyNames="Id,Name" IsFluid="true" ShowHeader="true" Title="绑定列：格式化与空值"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField ColumnID="Number" />
                <f:BoundField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:BoundField ColumnID="LogTime" DataField="LogTime" HeaderText="日期格式化" DataFormatString="{0:yyyy-MM-dd}" />
                <f:BoundField ColumnID="Major" DataField="Major" HeaderText="空值提示" NullDisplayText="未填写" />
            </Columns>
        </f:Grid>

        <f:Label ID="labResult" runat="server" />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>使用服务器绑定列显示格式化日期，并为缺失专业提供替代文字。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看日期格式与空值替代</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="绑定列：格式化与空值">绑定列：格式化与空值</strong>日期列及未填写专业的记录。<br />结果：日期按 yyyy-MM-dd 输出；专业空值显示未填写，不把它误认为真实专业数据。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>BoundField 在服务端格式化字段，并生成显示文本；新项目优先使用 RenderField 的字段类型和渲染函数。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataField / DataFormatString</code>（<strong>日期绑定列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="绑定列：格式化与空值">绑定列：格式化与空值</strong>）：绑定源字段；日期格式初始为
                    <code>{0:yyyy-MM-dd}</code>。
                </li>
                <li><code>NullDisplayText</code>（<strong>专业绑定列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="绑定列：格式化与空值">绑定列：格式化与空值</strong>）：专业缺失时显示未填写。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
