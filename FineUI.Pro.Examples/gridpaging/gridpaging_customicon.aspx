<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_customicon.aspx.cs" Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_customicon" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-pager .f-btn-icon.f-icon {
            font-family: FontAwesome;
        }

        .f-grid-pager.f-grid-pager-firstpage .f-icon:before {
            content: "\f048";
        }

        .f-grid-pager.f-grid-pager-prevpage .f-icon:before {
            content: "\f0d9";
        }

        .f-grid-pager.f-grid-pager-nextpage .f-icon:before {
            content: "\f0da";
        }

        .f-grid-pager.f-grid-pager-lastpage .f-icon:before {
            content: "\f051";
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true" AllowPaging="true"
            IsDatabasePaging="false" runat="server" EnableCheckBoxSelect="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
        <strong>出于性能考虑，请在实际项目中使用数据库分页（不要使用内存分页）！</strong>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>替换分页栏四个方向按钮的图标，同时保留原有的翻页行为。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>使用替换后的分页图标</h3>
            <ul>
                <li>依次使用<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>分页栏的下一页、上一页、末页和首页图标。<br />结果：记录与当前页码按按钮含义变化；自定义图标只改变外观，不改变分页功能。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CSS</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：本页通过分页按钮对应的样式选择器替换图标；图标位置与翻页功能保持对应。</li>
            </ul>
        </section>
    </template>
</body>
</html>
