<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkboxfield_disablesome.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkboxfield_disablesome" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            runat="server"
            OnRowCommand="Grid1_RowCommand" OnPreRowDataBound="Grid1_PreRowDataBound">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:CheckBoxField ColumnID="AtSchool2" RenderAsStaticField="false"
                    DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:LinkButtonField ColumnID="Action1" Width="60px" CommandName="Action1" Text="按钮 1" />
                <f:LinkButtonField ColumnID="Action2" Width="60px" CommandName="Action2" Text="按钮 2" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行复选框的状态" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：这里使用的是行预绑定事件（PreRowDataBound），而不是行绑定事件（RowDataBound）！
    </form>
</body>
</html>
