<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_edit_checkboxlist.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_edit_checkboxlist" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-tpl .hobby input {
            margin: 3px;
        }

        .f-grid-tpl .hobby label {
            margin-left: 5px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false"
            runat="server" DataKeyNames="Id,Name" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:TemplateField Width="60px" EnableColumnHide="false" EnableHeaderMenu="false">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" Width="60px" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:TemplateField ColumnID="Hobby" Width="350px" HeaderText="爱好">
                    <ItemTemplate>
                        <asp:CheckBoxList runat="server" CssClass="hobby" RepeatLayout="Flow" RepeatDirection="Horizontal"
                            ID="cblHobby">
                            <asp:ListItem Text="读书" Value="reading"></asp:ListItem>
                            <asp:ListItem Text="篮球" Value="basketball"></asp:ListItem>
                            <asp:ListItem Text="旅游" Value="travel"></asp:ListItem>
                            <asp:ListItem Text="电影" Value="movie"></asp:ListItem>
                            <asp:ListItem Text="音乐" Value="music"></asp:ListItem>
                        </asp:CheckBoxList>
                    </ItemTemplate>
                </f:TemplateField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button runat="server" ID="Button1" OnClick="Button1_Click" Text="获取用户输入的爱好">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
    </form>
</body>
</html>
