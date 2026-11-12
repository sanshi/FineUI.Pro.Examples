<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_updatesummary.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_updatesummary" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-row-summary .f-grid-cell-text {
            font-weight: bold;
            color: red;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="false" runat="server"
            AllowCellEditing="true" ClicksToEdit="1" EnableSummary="true" SummaryPosition="Flow">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnNew" Text="新增数据" Icon="Add" runat="server" ClickHandler="onAddClick"></f:Button>
                        <f:Button ID="btnDelete" Text="删除选中行" Icon="Delete" runat="server" ClickHandler="onDeleteClick"></f:Button>
                        <f:ToolbarFill runat="server">
                        </f:ToolbarFill>
                        <f:Button ID="btnReset" Text="重置表格数据" runat="server" ClickHandler="onResetClick"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                    <Editor>
                        <f:DropDownList Required="true" runat="server">
                            <f:ListItem Text="男" Value="1" />
                            <f:ListItem Text="女" Value="0" />
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="ChineseScore" DataField="ChineseScore" FieldType="Int" HeaderText="语文成绩">
                    <Editor>
                        <f:NumberBox ID="TextBox1" NoDecimal="true" NoNegative="true" Required="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="MathScore" DataField="MathScore" FieldType="Int" HeaderText="数学成绩">
                    <Editor>
                        <f:NumberBox ID="NumberBox1" NoDecimal="true" NoNegative="true" Required="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Delete" RendererFunction="renderDelete"></f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="afteredit" Handler="onGridAfterEdit" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
    </form>
    <script>
        var grid1ClientID = '<%= Grid1.ClientID %>';

        function renderDelete() {
            return '<a href="#" class="action-btn delete"><img class="f-grid-imagefield" src="<%= PageContext.ResolveUrl("~/res/icon/delete.png") %>"></a>';
        }

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }


        function updateSummary() {
            var me = F(grid1ClientID),
                chineseTotal = 0,
                mathTotal = 0,
                allTotal = 0;
            me.getRowEls().each(function(index, tr) {
                chineseTotal += me.getCellValue(tr, 'ChineseScore');
                mathTotal += me.getCellValue(tr, 'MathScore');
            });

            // 第三个参数 true，强制更新，不显示左上角的更改标识
            me.updateSummaryCellValue('ChineseScore', chineseTotal, true);
            me.updateSummaryCellValue('MathScore', mathTotal, true);
        }

        function onGridAfterEdit(event, value, params) {
            updateSummary();
        }

        // 点击新增按钮
        function onAddClick(event) {
            F(grid1ClientID).addNewRecord({
                "Name": "新用户",
                "Gender": "1",
                "Major": "化学系",
                "ChineseScore": 0,
                "MathScore": 0
            }, true);
        }

        // 点击重置按钮
        function onResetClick(event) {
            F.confirm({
                message: '确定要重置表格数据？',
                ok: function() {
                    F(grid1ClientID).rejectChanges();

                    // 重置表格后，要记得更新合计行
                    updateSummary();
                }
            });
        }

        // 点击删除按钮
        function onDeleteClick(event) {
            var grid1 = F(grid1ClientID);
            if (!grid1.hasSelection()) {
                F.alert('请至少选择一项！');
                return false;
            }

            F.confirm({
                message: '删除选中行？',
                ok: function() {
                    grid1.deleteSelectedRows();

                    // 删除行后，要记得更新合计行
                    updateSummary();
                }
            });

        }

        // 页面渲染完毕
        F.ready(function() {

            // 注册表格行内删除事件
            var grid1 = F(grid1ClientID);
            grid1.el.on('click', '.action-btn.delete', function(event) {
                // 删除链接是按钮型占位地址，先取消默认导航，避免改写页面 hash。
                event.preventDefault();

                var targetEl = $(this);
                var rowEl = targetEl.parents('.f-grid-row');
                var rowData = grid1.getRowData(rowEl);

                F.confirm({
                    message: '删除选中行？',
                    ok: function() {
                        grid1.deleteRow(rowData.id);

                        // 删除行后，要记得更新合计行
                        updateSummary();
                    }
                });

            });

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在浏览器中重算成绩合计，使编辑与增删行后的合计反映当前记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>让合计跟随成绩变化</h3>
            <ul>
                <li>修改<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>一行的语文或<strong>数学成绩</strong>并结束编辑。<br />结果：afteredit 回调遍历当前记录求和，底部相应成绩合计立即变化，不必先点击保存。</li>
                <li>选中一行并删除，或新增一行后填写成绩。<br />结果：数据重新加载时也会重算合计，新增值计入总分，已删除行不再计入。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableSummary</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（单击编辑）">表格（单击编辑）</strong>）：初始为
                    <code>true</code>，在底部显示用于承载总分的合计行。
                </li>
                <li><code>afteredit / dataload / updateSummaryCellValue</code>（<strong>页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>）：在编辑与数据加载后重新求和，再把总分写入合计行；强制更新避免出现修改角标。</li>
            </ul>
        </section>
    </template>
</body>
</html>
