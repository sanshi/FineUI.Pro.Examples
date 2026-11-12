<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="template_field.aspx.cs" Inherits="FineUI.Pro.Examples.grid_server_render.template_field" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>模板列：数据绑定与服务端函数</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" DataIDField="Id" DataKeyNames="Id,Name" IsFluid="true" ShowHeader="true" Title="模板列：数据绑定与服务端函数"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField ColumnID="Number" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# GetGender(Eval("Gender")) %>' />
                    </ItemTemplate>
                </f:TemplateField>
            </Columns>
        </f:Grid>

        <f:Label ID="labResult" runat="server" />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在服务器模板列中使用 ASP.NET 控件和绑定表达式输出每行内容。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看模板中的性别文字</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="模板列：数据绑定与服务端函数">模板列：数据绑定与服务端函数</strong>的<strong>性别</strong>模板列，并与当前行记录对应。<br />结果：模板内 Label 通过 GetGender
                    处理本行<strong>性别</strong>字段，显示男或女；该内容由服务器模板输出，不是浏览器列渲染函数。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>TemplateField 在服务端执行数据绑定表达式，可调用 C# 函数；新项目优先使用 RenderField 的客户端渲染函数。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ItemTemplate / Eval</code>（<strong>性别模板列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="模板列：数据绑定与服务端函数">模板列：数据绑定与服务端函数</strong>）：模板对每条记录执行字段绑定，ASP.NET 子控件负责输出最终内容。</li>
            </ul>
        </section>
    </template>
</body>
</html>
