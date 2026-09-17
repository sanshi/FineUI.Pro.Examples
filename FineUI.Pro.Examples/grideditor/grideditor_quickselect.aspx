<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_quickselect.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_quickselect" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（进入编辑状态后，从下拉表格中选择用户）"
            EnableCollapse="false" Height="350px"
            runat="server" AllowCellEditing="true" ClicksToEdit="1">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnNew" Text="新增数据" Icon="Add" runat="server" ClickHandler="onNewClick"></f:Button>
                        <f:Button ID="btnDelete" Text="删除选中行" Icon="Delete" runat="server" ClickHandler="onDeleteClick"></f:Button>
                        <f:ToolbarFill runat="server">
                        </f:ToolbarFill>
                        <f:Button ID="btnReset" Text="重置表格数据" runat="server" ClickHandler="onResetClick"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:LinkButtonField ColumnID="QuickSelect" Width="50px" Icon="Zoom" />
                <f:RenderField ColumnID="Code" DataField="Code" HeaderText="编码">
                </f:RenderField>
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int"
                    RendererFunction="renderGender" HeaderText="性别">
                    <Editor>
                        <f:DropDownList Required="true" runat="server">
                            <f:ListItem Text="男" Value="1" />
                            <f:ListItem Text="女" Value="0" />
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                    <Editor>
                        <f:NumberBox ID="tbxEditorEntranceYear" NoDecimal="true" NoNegative="true" MinValue="2000"
                            MaxValue="2025" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date"
                    Renderer="Date" RendererArgument="yyyy/MM/dd" HeaderText="入学日期">
                    <Editor>
                        <f:DatePicker ID="DatePicker1" Required="true" runat="server">
                        </f:DatePicker>
                    </Editor>
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:LinkButtonField ColumnID="Delete"
                    Icon="Delete" />
            </Columns>
        </f:Grid>
        <f:Grid ID="Grid2" ShowBorder="true" ShowHeader="false" runat="server" DataIDField="Id" DataTextField="Name"
            Hidden="true" Width="650px" Height="300px" EnableMultiSelect="false" CssClass="f-shadow">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int"
                    RendererFunction="renderGender" HeaderText="性别">
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderField ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date" 
                    Renderer="Date" RendererArgument="yyyy/MM/dd" HeaderText="入学日期" />
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" />
            </Columns>
            <Listeners>
                <f:Listener Event="rowclick" Handler="onGrid2RowClick" />
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
        <br />
    </form>
    <script>

        var grid1ClientID = '<%= Grid1.ClientID %>';
        var grid2ClientID = '<%= Grid2.ClientID %>';

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        // 当前快速选择对应的表格行ID
        var currentQuickSelectRowId;

        function onGrid2RowClick(event, grid2RowId) {
            var grid1 = F(grid1ClientID);
            var rowValue = this.getRowValue(grid2RowId);

            grid1.updateCellValue(currentQuickSelectRowId, {
                'Code': grid2RowId,
                'Name': rowValue.Name,
                'Gender': rowValue.Gender,
                'EntranceYear': rowValue.EntranceYear,
                'EntranceDate': rowValue.EntranceDate,
                'AtSchool': rowValue.AtSchool,
                'Major': rowValue.Major
            });

            // 隐藏表格
            F(grid2ClientID).hide();
        }


        function onNewClick(event) {
            var grid1 = F(grid1ClientID);
            var newAddedRowId = grid1.addNewRecord({
                'Name': '',
                'Gender': 1,
                'EntranceYear': '2015',
                'EntranceDate': '2015-09-01',
                'AtSchool': false,
                'Major': '化学系',
                'Delete': '<a href="javascript:;"><img src="../res/icon/delete.png"/></a>',
                'QuickSelect': '<a href="javascript:;"><img src="../res/icon/zoom.png"/></a>'
            }, true, false);

            // 选中新增的行
            grid1.selectRow(newAddedRowId);

            // 显示弹出表格
            showPopGrid(newAddedRowId);
        }

        function onDeleteClick(event) {
            var grid = F(grid1ClientID);

            // 如果没有选中项，弹出提示信息
            if (!grid.hasSelection()) {
                F.alert('请至少选择一项！');
                return;
            }

            // 删除选中行之前先弹出确认对话框
            F.confirm({
                message: '删除选中行？',
                ok: function () {
                    // 删除选中行
                    grid.deleteSelectedRows();
                }
            });
        }


        function onResetClick(event) {
            F.confirm({
                message: '确定要重置表格数据？',
                ok: function () {
                    F(grid1ClientID).rejectChanges();
                }
            });
        }

        // 显示弹出表格
        function showPopGrid(grid1RowId) {
            var grid1 = F(grid1ClientID);
            var grid2 = F(grid2ClientID);

            // 设置快速选择对应的表格行ID
            currentQuickSelectRowId = grid1RowId;

            var rowEl = grid1.getRowEl(grid1RowId);
            var quickselectEl = rowEl.find('.f-grid-cell-QuickSelect a');
            var offset = quickselectEl.offset();

            // 清空表格的选中项
            grid2.clearSelection();

            // 先显示表格
            grid2.show();

            // 再调整表格位置
            grid2.el.css({
                position: 'absolute',
                top: offset.top + quickselectEl.outerHeight(true) + 5,
                left: offset.left,
                'z-index': 1000
            });
        }


        F.ready(function () {

            var grid1 = F(grid1ClientID);

            // 点击行中删除图片
            grid1.el.on('click', '.f-grid-cell-Delete a', function (event) {
                // 删除选中行之前先弹出确认对话框
                F.confirm({
                    message: '删除选中行？',
                    ok: function () {
                        // 删除选中行
                        grid1.deleteSelectedRows();
                    }
                });
            });

            // 点击行中的快速选择图片
            grid1.el.on('click', '.f-grid-cell-QuickSelect a', function (event) {
                var cnode = $(this);

                // 设置快速选择对应的表格行ID
                var rowEl = cnode.closest('.f-grid-row');
                currentQuickSelectRowId = grid1.getRowId(rowEl);

                showPopGrid(currentQuickSelectRowId);
            });


            // 关闭弹出表格
            $(document).mousedown(function (event) {
                var target = $(event.target);

                var closestTable = target.closest('.f-grid');
                if (closestTable.length && closestTable.attr('id') === grid2ClientID) {
                    // 点击在Grid2表格内部，不做处理
                } else {
                    // 隐藏表格
                    F(grid2ClientID).hide();
                }
            });

        });




    </script>
</body>
</html>
