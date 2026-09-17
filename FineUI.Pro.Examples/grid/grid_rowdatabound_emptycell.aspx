<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowdatabound_emptycell.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowdatabound_emptycell" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .colorred {
            font-weight: bold;
            color: red;
        }

        .colorgreen {
            font-weight: bold;
            color: green;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="3" ShowBorder="true" ShowHeader="true"
            runat="server" EnableCheckBoxSelect="true"
            OnRowCommand="Grid1_RowCommand" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField ColumnID="bfEntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField ColumnID="cbfAtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:LinkButtonField TextAlign="Center" ConfirmText="你确定要这么做么？" ConfirmTarget="Top"
                    ColumnID="lbfAction1" Width="60px" CommandName="Action1" Text="按钮" />
                <f:LinkButtonField TextAlign="Center" ConfirmText="删除选中行？" Icon="Delete" ConfirmTarget="Top"
                    ColumnID="lbfAction2" Width="60px" CommandName="Action2" />
            </Columns>
        </f:Grid>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        注：当[入学年份]为2008年时，清空[是否在校]和[删除]两列的单元格。
    </form>
</body>
</html>
