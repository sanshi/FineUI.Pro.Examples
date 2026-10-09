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
        <p>TemplateField 在服务端执行数据绑定表达式，可调用 C# 函数；新项目优先使用 RenderField 的客户端渲染函数。</p>
        <f:Label ID="labResult" runat="server" />
    </form>
</body>
</html>
