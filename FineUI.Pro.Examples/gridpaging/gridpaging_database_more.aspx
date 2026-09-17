<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_database_more.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_database_more" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .morebutton {
            width: 100%;
            text-align: center;
            margin: 8px 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel IsFluid="true" Title="面板" runat="server" Height="350px" AutoScroll="true">
            <Items>
                <f:Grid DataIDField="Id" ID="Grid1" EnableCollapse="false" ShowBorder="false" ShowHeader="false"
                    runat="server" EnableCheckBoxSelect="true" AttributeDataTag="0" PagingToolbarVisible="false">
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
                            DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}" UrlEncode="true"
                            Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                        <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                    </Columns>
                </f:Grid>
                <f:LinkButton runat="server" CssClass="morebutton" Text="加载更多..." ID="btnMore" OnClick="btnMore_Click"></f:LinkButton>
            </Items>
        </f:Panel>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onShowSelectedRowsClick">
        </f:Button>
    </form>

    <script src="../res/js/grid.js"></script>

    <script>
        //:: 表格嵌在面板里，客户端 id 是渲染后的 ClientID（不等于声明的 Grid1），所以包一层把它传进去
        var grid1ClientID = '<%= Grid1.ClientID %>';

        function onShowSelectedRowsClick(event) {
            notifySelectedRows(grid1ClientID);
        }
    </script>
</body>
</html>
