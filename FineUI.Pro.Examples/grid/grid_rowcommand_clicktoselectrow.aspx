<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_clicktoselectrow.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_clicktoselectrow" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-cell-Deleteit .f-icon {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            runat="server" EnableCheckBoxSelect="true"
            OnRowCommand="Grid1_RowCommand"
            EnableRowClickEvent="true" OnRowClick="Grid1_RowClick">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField Hidden="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}" UrlEncode="true"
                    Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" Hidden="true" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:LinkButtonField ColumnID="Action1" Width="60px" TextAlign="Center" CommandName="Action1" Text="按钮1" />
                <f:LinkButtonField ColumnID="Action2" Width="60px" TextAlign="Center" CommandName="Action2" Text="按钮2" ClickToSelectRow="false" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        注：
        <ul>
            <li>
                [按钮1]：点击时会同时触发RowCommand和RowClick事件，同时选中行。
            </li>
            <li>
                [按钮2]：点击时只会触发RowCommand事件，不会选中行。
            </li>
        </ul>
    </form>

    <script src="../res/js/grid.js"></script>
</body>
</html>
