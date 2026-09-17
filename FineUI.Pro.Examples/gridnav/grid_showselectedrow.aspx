<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_showselectedrow.aspx.cs" Inherits="FineUI.Pro.Examples.gridnav.grid_showselectedrow" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            ShowSelectedCell="true" ShowSelectedRow="false" EnableRowHoverState="false">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <%--<f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />--%>
                <f:BoundField DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="注册日期" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        注：
        <ul>
            <li>方向键改变选中的单元格</li>
            <li>Tab键转到当前行的下一个单元格（如果当前位于某一行的最后一个单元格，则会跳转到下一行的第一个单元格）</li>
            <li>Shift+Tab键回退到当前行的上一个单元格（如果当前位于某一行的第一个单元格，则会跳转到上一行的最后一个单元格）</li>
            <li>ShowSelectedRow=false：禁用表格行的选中样式</li>
            <li>EnableRowHoverState=false：禁用表格行的鼠标焦点样式</li>
        </ul>
    </form>
</body>
</html>
