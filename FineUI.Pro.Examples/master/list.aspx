<%@ Page Title="" Language="C#" MasterPageFile="~/master/SingleGrid.Master" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="FineUI.Pro.Examples.master.list" %>

<%@ MasterType VirtualPath="~/master/SingleGrid.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainCPH" runat="server">
    <f:Grid DataIDField="Id" ID="Grid1" EnableCollapse="false" PageSize="5" ShowBorder="false" ShowHeader="false"
        BoxFlex="1"
        AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true"
        DataKeyNames="Id,Name" 
        AllowSorting="true" SortField="Name" SortDirection="ASC">
        <Columns>
            <f:RowNumberField />
            <f:BoundField DataField="Name" SortField="Name" DataFormatString="{0}"
                HeaderText="姓名" />
            <f:TemplateField ColumnID="Gender" SortField="Gender" HeaderText="性别">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                </ItemTemplate>
            </f:TemplateField>
            <f:BoundField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
            <f:CheckBoxField SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
            <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
            <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
        </Columns>
        <Toolbars>
            <f:Toolbar ID="Toolbar1" runat="server">
                <Items>
                    <f:Button ID="btnImport" runat="server" Text="导入数据" OnClick="btnImport_Click"></f:Button>
                    <f:Button ID="btnExport" runat="server" Text="导出数据" OnClick="btnExport_Click"></f:Button>
                </Items>
            </f:Toolbar>
        </Toolbars>
    </f:Grid>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="headCPH">
    <meta name="sourcefiles" content="~/master/SingleGrid.Master;~/master/ISingleGridPage.cs" />
</asp:Content>
