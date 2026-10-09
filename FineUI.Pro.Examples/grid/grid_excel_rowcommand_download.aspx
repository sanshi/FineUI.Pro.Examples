<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_excel_rowcommand_download.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_excel_rowcommand_download" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" DataKeyNames="Id,Name" OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="Action1">
                    <Commands>
                        <f:Command CommandName="Action1" Text="按钮" />
                    </Commands>
                </f:RenderField>
                <f:RenderField ColumnID="Action2">
                    <Commands>
                        <f:Command CssClass="download-command" RendererFunction="renderClientAction" CommandName="Action2" Text="下载" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-pro.js") %>"></script>
    <script>
        F.ready(function() {
            var grid = F('<%= Grid1.ClientID %>');
            grid.el.on('click', '.download-command', function(event) {
                event.preventDefault();
                var row = grid.getRowData($(this).closest('.f-grid-row'));
                // 下载使用普通表单回发，把文件交给浏览器；其它按钮仍使用 AJAX。
                F.doPostBack({
                    eventName: 'DownloadRow',
                    eventArgument: row.id,
                    enableAjax: false
                });
            });
        });

    </script>
</body>
</html>
