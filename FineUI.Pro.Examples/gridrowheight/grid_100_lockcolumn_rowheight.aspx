<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_100_lockcolumn_rowheight.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridrowheight.grid_100_lockcolumn_rowheight" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-row .f-grid-cell-text {
            white-space: normal;
            word-break: break-all;
        }

    </style>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Height="500px" Title="100行（行高固定，列锁定）" EnableCollapse="false"
            AllowColumnLocking="true" runat="server" FixedRowHeight="true" RowHeightLines="3">
            <Columns>
                <f:RowNumberField />
                <f:RenderField EnableLock="true" Locked="true" DataField="ID" HeaderText="标识" />
                <f:RenderField Width="150px" EnableLock="true" Locked="true" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" EnableLock="true" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField EnableLock="true" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField EnableLock="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" Width="150px" EnableLock="true" HeaderText="所学专业" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField Width="500px" EnableLock="true" DataField="Desc" HeaderText="个人简介" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField Width="300px" DataField="GUID" HeaderText="GUID" />
                <f:RenderField ColumnID="Hobby" Width="200px" EnableLock="true" HeaderText="爱好" DataField="Hobby" RendererFunction="renderHobbies1" />
                <f:RenderField EnableLock="true" DataField="EntranceDate" HeaderText="入学时间" />
                <f:RenderField EnableLock="true" DataField="ChineseScore" HeaderText="语文成绩" />
                <f:RenderField EnableLock="true" DataField="MathScore" HeaderText="数学成绩" />
                <f:RenderField EnableLock="true" DataField="TotalScore" HeaderText="总成绩" />
                <f:RenderField EnableLock="true" DataField="ShenGao" HeaderText="身高" />
                <f:RenderField EnableLock="true" DataField="TiZhong" HeaderText="体重" />
                <f:RenderField EnableLock="true" DataField="XueYaDi" HeaderText="血压（低）" />
                <f:RenderField EnableLock="true" DataField="XueYaGao" HeaderText="血压（高）" />
                <f:RenderField EnableLock="true" DataField="ShiLiZuo" HeaderText="视力（左）" />
                <f:RenderField EnableLock="true" DataField="ShiLiYou" HeaderText="视力（右）" />
                <f:RenderField Width="150px" EnableLock="true" DataField="ShiLiZuoJiaoZhen" HeaderText="矫正视力（左）" />
                <f:RenderField Width="150px" EnableLock="true" DataField="ShiLiYouJiaoZhen" HeaderText="矫正视力（右）" />
            </Columns>
            <Listeners>
                <f:Listener Event="render" Handler="onGridRender" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function renderHobbies1(value, params) {
            var labels = {
                reading: '读书',
                basketball: '篮球',
                travel: '旅游',
                movie: '电影',
                music: '音乐'
            };
            return String(value || '').toLowerCase().split(',').map(function(item) {
                return labels[item] || '';
            }).filter(Boolean).join(', ');
        }

    </script>
    <script>
        // 等所有JS资源下载完毕后开始
        var __STARTTIME = new Date();

        // 表格渲染完毕后结束
        function onGridRender(event) {
            this.setTitle(this.getTitle() + ' - 渲染时间：' + ((new Date() - __STARTTIME) / 1000).toFixed(2));
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>用固定行高显示记录，长文字在统一高度内换行。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>核对行高一致性</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="100行（行高固定，列锁定）">100行（行高固定，列锁定）</strong>比较不同描述长度的记录，再向下滚动。<br />结果：各行使用同一套固定高度，滚动后后续记录也保持等高；长文字不会无限撑大单独一行，超出范围的内容受可用高度限制。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>FixedRowHeight</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="100行（行高固定，列锁定）">100行（行高固定，列锁定）</strong>）：初始为
                    <code>true</code>，初始为 <code>true</code>，按统一行高显示记录。
                </li>
                <li><code>RowHeightLines</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="100行（行高固定，列锁定）">100行（行高固定，列锁定）</strong>）：初始为
                    <code>3</code>，初始为 <code>3</code>，为行内容预留三行文字对应的高度，再结合当前行密度计算。
                </li>
                <li><code>CSS</code>（<strong>单元格文字</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="100行（行高固定，列锁定）">100行（行高固定，列锁定）</strong>）：单元格长文字允许按列宽换行；换行样式与固定行高分别配置。</li>
                <li><code>AllowColumnLocking</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="100行（行高固定，列锁定）">100行（行高固定，列锁定）</strong>）：初始为
                    <code>true</code>，锁定列与普通区使用同一行高度，纵向滚动后仍保持对齐。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
