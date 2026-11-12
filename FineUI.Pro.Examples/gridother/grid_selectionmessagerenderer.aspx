<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_selectionmessagerenderer.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_selectionmessagerenderer" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .bold {
            font-weight: bold;
            color: red;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" Height="350px" PageSize="5" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged"
            SelectionMessageRendererFunction="selectionMessageRenderer">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField HeaderText="所学专业" ColumnID="Major" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField DataField="Fee" FieldType="Int" ColumnID="Fee" HeaderText="学费" />
                <f:RenderField DataField="ExtraFee" FieldType="Int" ColumnID="ExtraFee" HeaderText="学杂费" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>

    <script>
        var grid1ClientID = '<%= Grid1.ClientID %>';

        function selectionMessageRenderer(selectedCount) {
            var grid1 = F(grid1ClientID);

            // https://fineui.com/js/api/F.Grid.html#getSelectedRows
            // 参数为true: 返回包含行对象的数组
            var selectedRows = grid1.getSelectedRows(true);
            if (!selectedRows.length) {
                return '无选中行';
            }

            var feeSum = 0,
                donateSum = 0;
            $.each(selectedRows, function(index, data) {
                feeSum += data.values['Fee'];
                donateSum += data.values['ExtraFee'];
            });

            return F.rawHtml('已选择 <strong class="bold">{0}</strong> 行&nbsp;（学费合计：{1} &nbsp;学杂费合计：{2}）',
                selectedRows.length,
                F.addCommas(feeSum.toFixed(2)),
                F.addCommas(donateSum.toFixed(2)));
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>替换表格内置的选择统计文字，用自定义函数呈现当前已选记录数量。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看自定义选择提示</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>勾选两行，再取消其中一行。<br />结果：选择统计区域随当前选择数量重新渲染，显示本页自定义的统计文字。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SelectionMessageRendererFunction</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>selectionMessageRenderer</code>，用选择信息生成自定义统计文字，不改变实际选择的记录。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
