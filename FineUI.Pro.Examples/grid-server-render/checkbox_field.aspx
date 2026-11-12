<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkbox_field.aspx.cs" Inherits="FineUI.Pro.Examples.grid_server_render.checkbox_field" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>复选框列：状态与回发</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" DataIDField="Id" DataKeyNames="Id,Name" IsFluid="true" ShowHeader="true" Title="复选框列：状态与回发"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField ColumnID="Number" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:CheckBoxField ColumnID="StaticCheck" DataField="AtSchool" HeaderText="静态状态" RenderAsStaticField="true" />
                <f:CheckBoxField ColumnID="EditableCheck" DataField="AtSchool" HeaderText="点击后回发" RenderAsStaticField="false" CommandName="Check" />
            </Columns>
        </f:Grid>

        <f:Label ID="labResult" runat="server" />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对照只读复选框与可触发行命令的复选框列。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>切换可交互的复选框</h3>
            <ul>
                <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="复选框列：状态与回发">复选框列：状态与回发</strong>的是否在校复选框列，再点击可交互的一列。<br />结果：静态列只显示状态；可交互列改变勾选并回发 Check 行命令，结果区显示所操作行及当前状态。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>CheckBoxField 保存每行复选框的服务端状态，点击后触发行命令；新项目优先使用 RenderCheckField。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RenderAsStaticField</code>（<strong>复选框对照列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="复选框列：状态与回发">复选框列：状态与回发</strong>）：静态列初始为
                    <code>true</code>，交互列初始为 <code>false</code>。
                </li>
                <li><code>CommandName</code>（<strong>可交互复选框列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="复选框列：状态与回发">复选框列：状态与回发</strong>）：交互列初始为
                    <code>Check</code>，由行命令事件识别本次操作。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
