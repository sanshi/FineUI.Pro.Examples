<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_excel_groupfield.aspx.cs" Inherits="FineUI.Pro.Examples.data.grid_excel_groupfield" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/Code/GridExportUtil.cs" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server">
            <Columns>
                <f:RowNumberField ColumnID="tfNumber" Width="60px" />
                <f:GroupField HeaderText="分组一" TextAlign="Center">
                    <Columns>
                        <f:RenderField DataField="Name" HeaderText="姓名" />
                        <f:RenderField ColumnID="tfGender" HeaderText="性别" TextAlign="Center" DataField="Gender" RendererFunction="renderGender" />
                        <f:GroupField HeaderText="考试成绩" TextAlign="Center">
                            <Columns>
                                <f:RenderField DataField="ChineseScore" HeaderText="语文成绩" TextAlign="Center" />
                                <f:RenderField DataField="MathScore" HeaderText="数学成绩" TextAlign="Center" />
                                <f:RenderField DataField="TotalScore" HeaderText="总成绩" TextAlign="Center" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" HeaderText="所学专业" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button2" CssClass="marginr" runat="server" Text="重新绑定表格" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button1" EnableAjax="false" DisableControlBeforePostBack="false" runat="server" Text="导出为Excel文件" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
