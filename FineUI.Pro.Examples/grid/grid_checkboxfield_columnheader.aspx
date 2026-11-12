<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkboxfield_columnheader.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkboxfield_columnheader" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


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
                <f:RenderCheckField ColumnID="CheckBoxField1" Width="150px" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校1" />
                <f:RenderCheckField ColumnID="CheckBoxField2" Width="150px" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校2" />
                <f:RenderCheckField ColumnID="CheckBoxField3" Width="150px" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校3" />
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

            var grid1 = F(grid1ClientID);


            grid1.el.on('click', '.f-grid-colheader.myheadercheckbox .f-grid-checkbox', function(event) {
                var cnode = $(this);

                // 普通表格已先由框架切换表头图标，这里读取切换后的状态，避免重复切换。
                var checked = cnode.hasClass('f-checked');
                // 同步本列的图标和开关文字，查询时提交界面上的当前状态。
                var columnId = cnode.closest('.f-grid-colheader').attr('data-columnid');
                var rowIDs = grid1.getRowEls().map(function() {
                    return grid1.getRowData($(this)).id;
                }).get();
                setGridCheckColumns(grid1, rowIDs, [columnId], checked);

            });

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在可编辑复选框列的标题中放入自定义复选框，用它设置整列记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>使用表头复选框设置整列</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>可编辑是否在校列标题中的复选框，再次点击。<br />结果：对应列正文复选框统一勾选或取消；其他可编辑列与只读对照列保持各自的值。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>HeaderTextRawHtml</code>（<strong>可修改的复选框列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：在列标题输出自定义复选框；本页脚本将表头动作与对应的列标识关联。</li>
            </ul>
        </section>
    </template>
</body>
</html>
