<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_fixedrowheight_rowheight_linewrap_lineclamp.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_fixedrowheight_rowheight_linewrap_lineclamp" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        /* 最多显示 3 行文字，超出则显示省略号 */
        .f-grid-row .f-grid-cell-text {
            white-space: normal;
            word-break: break-all;
            overflow: hidden;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            display: -webkit-box;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" Height="650px" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" EnableCheckBoxSelect="true"
            FixedRowHeight="true" RowHeight="60" RowHeightCompact="48" RowHeightSmall="48" RowHeightLargeSpace="72" RowHeightLarge="72">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField TrueStrings="false,False" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:BoundField ColumnID="Desc" Width="400px" DataField="Desc" HeaderText="个人简介" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:BoundField DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="注册日期" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        手工设置行高时：
        <ul>
            <li>尽量将行高设置为默认行高的整数倍，防止文字换行时被部分遮挡的问题。</li>
            <li>需要为所有显示模式设置行高（RowHeight、RowHeightCompact、RowHeightSmall、RowHeightLargeSpace、RowHeightLarge）。</li>
            <li>推荐使用 RowHeightLines 属性快速为所有显示模式设置行高。</li>
        </ul>
        <br />
        <br />
        <table class="result" style="width: 850px;">
            <tbody>
                <tr>
                    <th></th>
                    <th>默认行高（px）</th>
                    <th>设置的行高（px）</th>
                </tr>
                <tr>
                    <td>紧凑模式</td>
                    <td>16</td>
                    <td>16 * 3 = 48</td>
                </tr>
                <tr>
                    <td>小字体模式</td>
                    <td>16</td>
                    <td>16 * 3 = 48</td>
                </tr>
                <tr>
                    <td>普通模式</td>
                    <td>20</td>
                    <td>20 * 3 = 60</td>
                </tr>
                <tr>
                    <td>大间距模式</td>
                    <td>24</td>
                    <td>24 * 3 = 72</td>
                </tr>
                <tr>
                    <td>大字体模式</td>
                    <td>24</td>
                    <td>24 * 3 = 72</td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
