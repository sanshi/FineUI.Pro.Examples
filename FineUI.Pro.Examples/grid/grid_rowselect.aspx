<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowselect.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowselect" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格（单选）" EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            runat="server" EnableCheckBoxSelect="true" DataKeyNames="Id,Name"
            EnableRowSelectEvent="true" OnRowSelect="Grid1_RowSelect"
            EnableRowDeselectEvent="true" OnRowDeselect="Grid1_RowDeselect"
            EnableMultiSelect="false">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
            </Columns>
        </f:Grid>
        <br />
        注：
        <ul>
            <li>观察行选中事件与行单击事件的区别；</li>
            <li>点击复选框取消选中行时，也会触发相应事件。</li>
        </ul>
    </form>
</body>
</html>
