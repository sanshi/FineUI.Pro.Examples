<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_database_aspnet.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_database_aspnet" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="Grid1" Title="表格" Width="800px" ShowBorder="true"
            runat="server" EnableCheckBoxSelect="true" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <asp:TemplateField HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <asp:CheckBoxField DataField="AtSchool" HeaderText="是否在校" />
                <asp:HyperLinkField HeaderText="所学专业" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    Target="_blank" />
                <asp:ImageField DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组">
                </asp:ImageField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="btnPrevious" CommandName="Previous" runat="server" OnCommand="OnPageButtonClick" UseSubmitBehavior="false" Text="Previous" />
        <asp:Button ID="btnNext" runat="server" CommandName="Next" OnCommand="OnPageButtonClick" UseSubmitBehavior="false" Text="Next" />
        Page
        <asp:Label runat="server" ID="lblCurrentPage"></asp:Label>
        of
        <asp:Label runat="server" ID="lblTotalPages"></asp:Label>
    </form>
</body>
</html>
