<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_header_wrap.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_header_wrap" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-colheader-Major .f-grid-colheader-text {
            white-space: normal;
            word-break: break-all;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" Height="300px" runat="server"
            AllowSorting="true" SortField="Gender" SortDirection="ASC" OnSort="Grid1_Sort">
            <Columns>
                <f:RowNumberField />
                <f:RenderField SortField="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" SortField="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" SortField="Major" HeaderText="所学专业（这是很长很长很长很长很长很长很长很长很长的标题文本，可以自动换行）" Width="150px" DataField="Major"
                    RendererFunction="renderMajor" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>让过长列标题自动换行，显示超过单行宽度的文字。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看长标题的换行方式</h3>
            <ol>
                <li>缩窄<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的专业列或所在区域。<br />结果：专业列长标题按宽度折行，标题行高随实际文字调整。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CSS</code>（<strong>专业列标题文字</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：标题文字使用允许换行的样式，作用范围限定在长标题列。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
