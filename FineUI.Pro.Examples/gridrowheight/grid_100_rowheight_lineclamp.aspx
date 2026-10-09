<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_100_rowheight_lineclamp.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridrowheight.grid_100_rowheight_lineclamp" %>

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
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Height="500px" ShowBorder="true" ShowHeader="true" Title="100行（行高固定）" EnableCollapse="false"
            runat="server" EnableCheckBoxSelect="true" KeepCurrentSelection="true" FixedRowHeight="true" RowHeightLines="3">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="ID" HeaderText="标识" />
                <f:RenderField Width="150px" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" Width="150px" HeaderText="所学专业" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField Width="500px" DataField="Desc" HeaderText="个人简介" />
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
</body>
</html>
