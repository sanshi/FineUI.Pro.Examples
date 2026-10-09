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
                <f:Grid DataIDField="Id" ID="Grid1" EnableCollapse="false" ShowBorder="false" ShowHeader="false" runat="server" EnableCheckBoxSelect="true"
                    AttributeDataTag="0" PagingToolbarVisible="false">
                    <Columns>
                        <f:RowNumberField />
                        <f:RenderField DataField="Name" HeaderText="姓名" />
                        <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                        <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                        <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                        <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
                            RendererFunction="renderMajor" />
                        <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                    </Columns>
                </f:Grid>
                <f:LinkButton runat="server" CssClass="morebutton" Text="加载更多..." ID="btnMore" OnClick="btnMore_Click"></f:LinkButton>
            </Items>
        </f:Panel>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onShowSelectedRowsClick">
        </f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>

    <script>
        //:: 表格嵌在面板里，客户端 id 是渲染后的 ClientID（不等于声明的 Grid1），所以包一层把它传进去
        var grid1ClientID = '<%= Grid1.ClientID %>';

        function onShowSelectedRowsClick(event) {
            notifySelectedRows(grid1ClientID);
        }

    </script>
</body>
</html>
