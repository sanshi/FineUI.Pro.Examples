<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_fixedrowheight.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_fixedrowheight" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            EnableCheckBoxSelect="true" FixedRowHeight="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderField DataField="AtSchool" HeaderText="是否在校" RendererFunction="renderInverseCheck1" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Desc" Width="400px" DataField="Desc" HeaderText="个人简介" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        注：如果设置FixedRowHeight=true，但是未设置RowHeight，则使用默认行高（不包含单元格的内边距）。
        <br />
        <br />
        <table class="result">
            <tbody>
                <tr>
                    <th></th>
                    <th>默认行高（px）</th>
                </tr>
                <tr>
                    <td>紧凑模式</td>
                    <td>16</td>
                </tr>
                <tr>
                    <td>小字体模式</td>
                    <td>16</td>
                </tr>
                <tr>
                    <td>普通模式</td>
                    <td>20</td>
                </tr>
                <tr>
                    <td>大间距模式</td>
                    <td>24</td>
                </tr>
                <tr>
                    <td>大字体模式</td>
                    <td>24</td>
                </tr>
            </tbody>
        </table>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function renderInverseCheck1(value, params) {
            var checked = String(value).toLowerCase() === 'false';
            return $('<i>').addClass('f-icon f-iconfont f-grid-static-checkbox').toggleClass('f-checked', checked);
        }

    </script>
</body>
</html>
