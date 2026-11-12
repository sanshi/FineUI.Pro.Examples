<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_2000_rowheight.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridrowheight.grid_2000_rowheight" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Height="500px" ShowBorder="true" ShowHeader="true" Title="2000行（行高固定）" EnableCollapse="false"
            runat="server" FixedRowHeight="true">
            <Columns>
                <f:RowNumberField Width="100px" />
                <f:RenderField DataField="ID" HeaderText="标识" />
                <f:RenderField Width="150px" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" Width="150px" HeaderText="所学专业" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField Width="300px" DataField="GUID" HeaderText="GUID" />
                <f:RenderField ColumnID="Hobby" Width="200px" HeaderText="爱好" DataField="Hobby" RendererFunction="renderHobbies1" />
                <f:RenderField DataField="EntranceDate" HeaderText="入学时间" />
                <f:RenderField DataField="ChineseScore" HeaderText="语文成绩" />
                <f:RenderField DataField="MathScore" HeaderText="数学成绩" />
                <f:RenderField DataField="TotalScore" HeaderText="总成绩" />
                <f:RenderField DataField="ShenGao" HeaderText="身高" />
                <f:RenderField DataField="TiZhong" HeaderText="体重" />
                <f:RenderField DataField="XueYaDi" HeaderText="血压（低）" />
                <f:RenderField DataField="XueYaGao" HeaderText="血压（高）" />
                <f:RenderField DataField="ShiLiZuo" HeaderText="视力（左）" />
                <f:RenderField DataField="ShiLiYou" HeaderText="视力（右）" />
                <f:RenderField Width="150px" DataField="ShiLiZuoJiaoZhen" HeaderText="矫正视力（左）" />
                <f:RenderField Width="150px" DataField="ShiLiYouJiaoZhen" HeaderText="矫正视力（右）" />
            </Columns>
            <Listeners>
                <f:Listener Event="render" Handler="onGridRender" />
            </Listeners>
        </f:Grid>
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
            <p>一次性渲染 2000 行作为对照，使用固定行高。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看一次性渲染的对照页</h3>
            <ol>
                <li>打开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="2000行（行高固定）">2000行（行高固定）</strong>后滚动到靠后记录，再返回顶部。<br />结果：全部数据行初次就已创建，没有延迟渲染占位行；滚动只改变当前可见范围，不在滚动时追加数据请求。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>FixedRowHeight</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="2000行（行高固定）">2000行（行高固定）</strong>）：初始为
                    <code>true</code>，固定各行高度，便于计算可视位置。
                </li>
                <li><code>EnableDelayRender</code>（<strong>页面展示配置</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="2000行（行高固定）">2000行（行高固定）</strong>）：本页未开启，用于与延迟渲染页对照；全部行在首次加载时创建。</li>
            </ul>
        </section>
    </template>
</body>
</html>
