<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkboxfield_hidesome.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkboxfield_hidesome" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-cell.hidethis .f-grid-checkbox {
            display: none;
        }

    </style>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            OnRowCommand="Grid1_RowCommand" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderCheckField ColumnID="AtSchool2" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Action1" Width="60px">
                    <Commands>
                        <f:Command CommandName="Action1" Text="按钮 1" />
                    </Commands>
                </f:RenderField>
                <f:RenderField ColumnID="Action2" Width="60px">
                    <Commands>
                        <f:Command CommandName="Action2" Text="按钮 2" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行复选框的状态" ClickHandler="onReadCheckStatesClick">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        function onReadCheckStatesClick(event) {
            var grid = F('<%= Grid1.ClientID %>');
            F.customEvent('CheckSelectedRows', {
                rows: getGridCheckRows(grid, ["AtSchool2"], true)
            });
            return false;
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>按入学年份隐藏部分行的可编辑复选框，保留其他记录的切换能力。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>对照受限行与普通行</h3>
            <ul>
                <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>中入学年份不大于 2004 的记录与其他记录，尝试点击第二个是否在校列的复选框。<br />结果：命中条件的复选框不显示，其他行仍可勾选；数据单元格本身和同一行的其他列仍保留。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：复选框仅仅是通过CSS样式隐藏（display:none;）。</p>
            <p>注：复选框仅仅是通过CSS样式隐藏（display:none;）。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RendererFunction</code>（<strong>可修改的复选框列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：渲染时读取 EntranceYear；本页只对不大于
                    2004 的记录附加隐藏或禁用样式。</li>
                <li><code>CSS</code>（<strong>页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：隐藏命中条件单元格内的选择图标，保留单元格布局。</li>
            </ul>
        </section>
    </template>
</body>
</html>
