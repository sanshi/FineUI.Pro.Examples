<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_style_columnclass.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_style_columnclass" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        .f-grid-colheader-bfEntranceYear .f-grid-colheader-text,
        .f-grid-row .f-grid-cell-bfEntranceYear {
            color: red;
            font-weight: bold;
        }

        .f-grid-colheader-hlfMajor .f-grid-colheader-text,
        .f-grid-row .f-grid-cell-hlfMajor {
            color: green;
            font-weight: bold;
        }

        .f-grid-row .f-grid-cell-hlfMajor a,
        .f-grid-row .f-grid-cell-hlfMajor a:hover {
            color: green;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="bfEntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField HeaderText="所学专业" ColumnID="hlfMajor" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
                    RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="Button2" runat="server" CssClass="marginr" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <f:Button ID="Button1" runat="server" Text="重新绑定表格" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>为整列指定样式类，让该列各行采用一致外观。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>对照本页样式规则</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>中的已设置样式列，并与相邻普通列比较。<br />结果：样式由列配置统一应用到该列，不需要逐条记录判断后再赋值；同列不同记录保持一致的样式规则。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>换一组记录后重新应用规则</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="重新绑定表格">重新绑定表格</strong>。<br />结果：按钮回发后后台换入另一组记录；列配置或按数据判断的样式规则继续应用，不是仅给最初几行写死颜色。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CssClass</code>（<strong>本页列与样式</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：在指定列上声明样式类，本页 CSS
                    决定相应单元格的文字和背景外观。</li>
            </ul>
        </section>
    </template>
</body>
</html>
