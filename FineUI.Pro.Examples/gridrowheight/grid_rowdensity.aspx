<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowdensity.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowdensity" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            EnableCheckBoxSelect="true" RowDensity="Default">
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
            <Tools>
                <f:Tool ID="toolRowDensity" runat="server" IconFont="_List" Text="行密度">
                    <Menu runat="server">
                        <f:MenuCheckBox Text="小间距" AttributeDataTag="small" GroupName="RowDensity" runat="server" ClickHandler="onRowDensityChange">
                        </f:MenuCheckBox>
                        <f:MenuCheckBox Text="标准间距" AttributeDataTag="normal" Checked="true" GroupName="RowDensity" runat="server"
                            ClickHandler="onRowDensityChange"></f:MenuCheckBox>
                        <f:MenuCheckBox Text="大间距" AttributeDataTag="large" GroupName="RowDensity" runat="server" ClickHandler="onRowDensityChange">
                        </f:MenuCheckBox>
                        <f:MenuCheckBox Text="超大间距" AttributeDataTag="xlarge" GroupName="RowDensity" runat="server" ClickHandler="onRowDensityChange">
                        </f:MenuCheckBox>
                    </Menu>
                </f:Tool>
            </Tools>
        </f:Grid>
        <br />
        <br />
        注：不同显示模式下，表格的行间距参数如下所示（行高不包含内边距）。
        <br />
        <br />
        <table class="result" style="width: 850px;">
            <tbody>
                <tr>
                    <th></th>
                    <th>行高（px）</th>
                    <th>内边距（px）<br />行密度（Small）</th>
                    <th>内边距（px）<br />行密度（Normal）</th>
                    <th>内边距（px）<br />行密度（Large）</th>
                    <th>内边距（px）<br />行密度（XLarge）</th>
                </tr>
                <tr>
                    <td>紧凑模式</td>
                    <td>16</td>
                    <td>2</td>
                    <td>6</td>
                    <td>10</td>
                    <td>14</td>
                </tr>
                <tr>
                    <td>小字体模式</td>
                    <td>16</td>
                    <td>4</td>
                    <td>8</td>
                    <td>12</td>
                    <td>16</td>
                </tr>
                <tr>
                    <td>普通模式</td>
                    <td>20</td>
                    <td>4</td>
                    <td>8</td>
                    <td>12</td>
                    <td>16</td>
                </tr>
                <tr>
                    <td>大间距模式</td>
                    <td>24</td>
                    <td>6</td>
                    <td>10</td>
                    <td>14</td>
                    <td>18</td>
                </tr>
                <tr>
                    <td>大字体模式</td>
                    <td>24</td>
                    <td>8</td>
                    <td>12</td>
                    <td>16</td>
                    <td>20</td>
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
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';
        var toolRowDensityClientID = '<%= toolRowDensity.ClientID %>';

        function onRowDensityChange(event) {
            var menuCheckBoxCmp = this;
            var selectedRowDensity = menuCheckBoxCmp.el.attr('data-tag');

            F(Grid1ClientID).setRowDensity(selectedRowDensity);
        }

    </script>
</body>
</html>
