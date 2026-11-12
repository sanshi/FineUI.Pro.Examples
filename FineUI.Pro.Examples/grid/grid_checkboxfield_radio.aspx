<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkboxfield_radio.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkboxfield_radio" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-field-body-checkboxlabel {
            white-space: nowrap;
        }

    </style>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校1" />
                <f:RenderCheckField ColumnID="CheckBoxField1" RenderAsStaticField="false" HeaderText="是否在校1" />
                <f:RenderCheckField ColumnID="CheckBoxField2" RenderAsStaticField="false" HeaderText="是否在校2" DisplayType="Switch" />
                <f:RenderCheckField PreciseClick="true" ColumnID="CheckBoxField3" RenderAsStaticField="false" HeaderText="是否在校3" DisplayType="Radio" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行复选框的状态" ClickHandler="onReadCheckStatesClick">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        function onReadCheckStatesClick(event) {
            var grid = F('<%= Grid1.ClientID %>');
            F.customEvent('CheckSelectedRows', {
                rows: getGridCheckRows(grid, ["CheckBoxField1", "CheckBoxField2", "CheckBoxField3"], true)
            });
            return false;
        }

        var grid1ClientID = '<%= Grid1.ClientID %>';

        F.ready(function() {
            var grid = F(grid1ClientID);
            grid.el.on('click', '.f-grid-checkboxfield .f-grid-checkbox', function(event) {
                var checkboxEl = $(this);
                var columnId = checkboxEl.closest('.f-grid-cell').attr('data-columnid');
                var rowData = grid.getRowData(checkboxEl.closest('.f-grid-row'));
                if (!rowData.values[columnId]) {
                    return;
                }
                var currentRowId = rowData.id;
                var otherRowIDs = grid.getRowEls().map(function() {
                    return grid.getRowData($(this)).id;
                }).get().filter(function(rowId) {
                    return rowId !== currentRowId;
                });
                setGridCheckColumns(grid, otherRowIDs, [columnId], false);
            });
        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在同一表格对照复选框、开关和单选框三种正文选择外观。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>对照三种正文选择方式</h3>
            <ul>
                <li>分别切换<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>中是否在校2、<strong>是否在校3</strong>、是否在校4的控件。<br />结果：三列分别以普通复选框、开关和单选框显示；单选框列在选择另一行时替换原先选中项，其他类型按各自勾选状态切换。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DisplayType</code>（<strong>可修改的复选框列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：可编辑列分别使用
                    Default、Switch、Radio；外观及单选切换行为按各列配置区分。</li>
            </ul>
        </section>
    </template>
</body>
</html>
