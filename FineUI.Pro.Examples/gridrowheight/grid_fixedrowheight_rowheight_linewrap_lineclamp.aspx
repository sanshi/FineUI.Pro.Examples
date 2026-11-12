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
        <f:Grid DataIDField="Id" ID="Grid1" Height="650px" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            EnableCheckBoxSelect="true" FixedRowHeight="true" RowHeight="60" RowHeightCompact="48" RowHeightSmall="48" RowHeightLargeSpace="72"
            RowHeightLarge="72">
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
        手工设置行高时：

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
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function renderInverseCheck1(value, params) {
            var checked = String(value).toLowerCase() === 'false';
            return $('<i>').addClass('f-icon f-iconfont f-grid-static-checkbox').toggleClass('f-checked', checked);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>用固定行高显示记录，长文字在统一高度内换行，超过三行的文字省略。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>核对行高一致性</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>比较不同描述长度的记录，再向下滚动。<br />结果：各行使用同一套固定高度，滚动后后续记录也保持等高；文字最多显示三行并省略其余部分。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>尽量将行高设置为默认行高的整数倍，防止文字换行时被部分遮挡的问题。</li>
                <li>需要为所有显示模式设置行高（RowHeight、RowHeightCompact、RowHeightSmall、RowHeightLargeSpace、RowHeightLarge）。</li>
                <li>推荐使用 RowHeightLines 属性快速为所有显示模式设置行高。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>FixedRowHeight</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 <code>true</code>，初始为
                    <code>true</code>，按统一行高显示记录。
                </li>
                <li><code>RowHeight / RowHeightSmall / RowHeightLarge</code>（<strong>表格行高配置</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：普通、小间距与大间距初始分别为
                    <code>60</code>、<code>48</code>、<code>72</code>，指定对应密度采用的行高。
                </li>
                <li><code>CSS</code>（<strong>单元格文字</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：单元格允许换行，并把文本最多显示行数限制为
                    <code>3</code>。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
