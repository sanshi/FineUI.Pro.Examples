<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_excel_selectcolumns.aspx.cs" Inherits="FineUI.Pro.Examples.data.grid_excel_selectcolumns" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_excel_selectcolumns_iframe_window.aspx,~/Code/GridExportUtil.cs" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server">
            <Columns>
                <f:RowNumberField Width="60px" ColumnID="Number" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="btnSelectColumns" runat="server" Text="选择需要导出的列（注意Window控件的EnableAjax属性）" ClickHandler="onSelectColumnsClick">
        </f:Button>
        <f:Window ID="Window1" Title="选择需要导出的列" Hidden="true" EnableIFrame="true" EnableMaximize="true" Target="Top" EnableResize="true" runat="server"
            OnClose="Window1_Close" IsModal="true" Width="450px" Height="250px" EnableAjax="false">
        </f:Window>
        <br />
        <br />
        <br />

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var Window1ClientID = '<%= Window1.ClientID %>';

        function onSelectColumnsClick(event) {
            F(Window1ClientID).show('<%= ResolveUrl("~/grid/grid_excel_selectcolumns_iframe_window.aspx") %>');
        }

    </script>
</body>
</html>
