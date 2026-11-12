<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_scrollbar_sync.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_scrollbar_sync" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsViewPort="true" Margin="10px" ShowBorder="false" ShowHeader="false" runat="server" Layout="VBox">
            <Items>
                <f:Grid DataIDField="Id" ID="Grid1" BoxFlex="1" ShowBorder="true" ShowHeader="true" Title="表格一" EnableCollapse="false" runat="server">
                    <Columns>
                        <f:RowNumberField />
                        <f:RenderField DataField="ID" HeaderText="标识" />
                        <f:RenderField DataField="Name" HeaderText="姓名" />
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
                </f:Grid>
                <f:Grid DataIDField="Id" ID="Grid2" BoxFlex="1" ShowBorder="true" ShowHeader="true" Title="表格二" EnableCollapse="false" runat="server">
                    <Columns>
                        <f:RowNumberField />
                        <f:RenderField DataField="ID" HeaderText="标识" />
                        <f:RenderField DataField="Name" HeaderText="姓名" />
                        <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                        <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                        <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                        <f:RenderField ColumnID="Major" Width="150px" HeaderText="所学专业" DataField="Major" RendererFunction="renderMajor" />
                        <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                        <f:RenderField Width="300px" DataField="GUID" HeaderText="GUID" />
                        <f:RenderField ColumnID="Hobby" Width="200px" HeaderText="爱好" DataField="Hobby" RendererFunction="renderHobbies2" />
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
                </f:Grid>
            </Items>
        </f:Panel>
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

        function renderHobbies2(value, params) {
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
        var Grid1ClientID = '<%= Grid1.ClientID %>';
        var Grid2ClientID = '<%= Grid2.ClientID %>';

        function syncGridScrollbar(el1, el2) {
            el1.on('scroll', function() {
                el2.scrollLeft(el1.scrollLeft());
                el2.scrollTop(el1.scrollTop());
            });

            el2.on('scroll', function() {
                el1.scrollLeft(el2.scrollLeft());
                el1.scrollTop(el2.scrollTop());
            });
        }

        F.ready(function() {

            var grid1ScrollEl = F(Grid1ClientID).getScrollEl();
            var grid2ScrollEl = F(Grid2ClientID).getScrollEl();

            syncGridScrollbar(grid1ScrollEl, grid2ScrollEl);
            syncGridScrollbar(grid2ScrollEl, grid1ScrollEl);

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>同步两个表格的横向与纵向滚动位置，便于逐行对照不同列数据。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>从任一侧同步滚动</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格一">第一个表格</strong>内部左右或上下滚动，再从<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid2").ClientID %>' title="表格二">第二个表格</strong>滚动。<br />结果：另一表格跟随相同的
                    scrollLeft 和 scrollTop；这里只同步滚动位置，不改变行选择或重新查询数据。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>getScrollEl / scrollLeft / scrollTop</code>（<strong>两个表格的滚动脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格一">表格一</strong>）：绑定实际表格滚动元素的 scroll
                    事件，双向设置对应滚动偏移。</li>
            </ul>
        </section>
    </template>
</body>
</html>
