<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_lockcolumn_linewrap_lineclamp.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridlockcolumn.grid_lockcolumn_linewrap_lineclamp" %>

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
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" Width="1000px" EnableCollapse="false" Height="400px"
            AllowColumnLocking="true" runat="server">
            <Columns>
                <f:RowNumberField />
                <f:RenderField EnableLock="true" Locked="true" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" EnableLock="true" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField EnableLock="true" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField EnableLock="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" Width="150px" EnableLock="true" HeaderText="所学专业" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField Width="400px" EnableLock="true" DataField="Desc" HeaderText="个人简介" />
                <f:RenderField EnableLock="true" DataField="ShenGao" ColumnID="ShenGao" HeaderText="身高" />
                <f:RenderField EnableLock="true" DataField="TiZhong" ColumnID="TiZhong" HeaderText="体重" />
                <f:RenderField EnableLock="true" DataField="XueYaDi" ColumnID="XueYaDi" HeaderText="血压（低）" />
                <f:RenderField EnableLock="true" DataField="XueYaGao" ColumnID="XueYaGao" HeaderText="血压（高）" />
                <f:RenderField EnableLock="true" DataField="ShiLiZuo" ColumnID="ShiLiZuo" HeaderText="视力（左）" />
                <f:RenderField EnableLock="true" DataField="ShiLiYou" ColumnID="ShiLiYou" HeaderText="视力（右）" />
                <f:RenderField ColumnID="Group" EnableLock="true" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField EnableLock="true" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在列锁定表格中显示多行长文本，最多保留三行并省略超出部分。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看三行省略与锁定对齐</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的<strong>个人简介</strong>等长文本，横向与纵向滚动。<br />结果：长文字在单元格内换行，最多显示三行，超出部分省略；左侧锁定内容仍与当前行对应。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CSS / white-space / -webkit-line-clamp</code>（<strong>单元格文字元素</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：页面把文字设为可换行，并用
                    -webkit-line-clamp: 3 限定三行；省略只影响显示，不截断源数据。</li>
            </ul>
        </section>
    </template>
</body>
</html>
