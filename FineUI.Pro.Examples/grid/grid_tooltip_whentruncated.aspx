<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_tooltip_whentruncated.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_tooltip_whentruncated" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>提示信息（仅截断时显示 ShowTooltipWhenTruncated）</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:RenderField HeaderText="所学专业（仅截断时显示）" DataField="Major" Width="140" ShowToolTip="true" ShowTooltipWhenTruncated="true" />
                <f:RenderField HeaderText="所学专业（永远显示）" DataField="Major" Width="140" ShowToolTip="true" />
            </Columns>
        </f:Grid>
        <div>
            <b>两列的区别（把鼠标依次移到两列的各行上对比）：</b>
            <ul>
                <li><b>所学专业（仅截断时显示）</b>：<code>ShowToolTip="true" ShowTooltipWhenTruncated="true"</code>。只有当专业名过长、被列宽截断出现省略号时才弹出提示；短名鼠标悬停<b>不弹</b>提示。</li>
                <li><b>所学专业（永远显示）</b>：<code>ShowToolTip="true"</code>。无论内容长短，鼠标悬停<b>都会</b>弹出完整内容的提示——这是默认行为。</li>
            </ul>
        </div>
    </form>
</body>
</html>
