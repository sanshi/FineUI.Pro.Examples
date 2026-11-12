<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_500_lockcolumn_rowheight.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridrowheight.grid_500_lockcolumn_rowheight" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Height="500px" Title="500行（行高固定，列锁定）" EnableCollapse="false"
            AllowColumnLocking="true" runat="server" FixedRowHeight="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField EnableLock="true" Locked="true" DataField="ID" HeaderText="标识" />
                <f:RenderField Width="150px" EnableLock="true" Locked="true" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" EnableLock="true" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField EnableLock="true" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField EnableLock="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" Width="150px" EnableLock="true" HeaderText="所学专业" DataField="Major" RendererFunction="renderMajor" />
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
            <p>一次性渲染 500 行作为对照，使用固定行高与列锁定。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看一次性渲染的对照页</h3>
            <ol>
                <li>打开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="500行（行高固定，列锁定）">500行（行高固定，列锁定）</strong>后滚动到靠后记录，再返回顶部。<br />结果：全部数据行初次就已创建，没有延迟渲染占位行；滚动只改变当前可见范围，不在滚动时追加数据请求。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>FixedRowHeight</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="500行（行高固定，列锁定）">500行（行高固定，列锁定）</strong>）：初始为
                    <code>true</code>，固定各行高度，便于计算可视位置。
                </li>
                <li><code>EnableDelayRender</code>（<strong>页面展示配置</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="500行（行高固定，列锁定）">500行（行高固定，列锁定）</strong>）：本页未开启，用于与延迟渲染页对照；全部行在首次加载时创建。</li>
                <li><code>AllowColumnLocking</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="500行（行高固定，列锁定）">500行（行高固定，列锁定）</strong>）：初始为
                    <code>true</code>，滚动时固定本页指定列，锁定区与普通区保持对应行高。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
