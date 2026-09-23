<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_selectfromwindow_emptyrows.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_selectfromwindow_emptyrows" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grideditor/grideditor_selectfromwindow_emptyrows_iframe.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格"
            EnableCollapse="false" Height="500px" EnableColumnLines="true" IncludeMergedData="true"
            runat="server" AllowCellEditing="true" ClicksToEdit="1">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnNew" Text="新增数据" Icon="Add" runat="server" ClickHandler="onAddClick"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                    <Editor>
                        <f:TriggerBox ID="tbxEditorName" TriggerIcon="Search" runat="server">
                            <Listeners>
                                <f:Listener Event="triggerclick" Handler="onNameSearchTriggerClick" />
                            </Listeners>
                        </f:TriggerBox>
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
                <f:RenderField ColumnID="AtSchool" DataField="AtSchool" FieldType="Boolean"
                    RendererFunction="renderAtSchool" HeaderText="是否在校">
                    <Editor>
                        <f:DropDownList Required="true" runat="server">
                            <f:ListItem Text="在校" Value="true" />
                            <f:ListItem Text="离校" Value="false" />
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:LinkButtonField ColumnID="Delete" TextAlign="Center" Width="50px" Icon="Delete" />
            </Columns>
            <Listeners>
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button1" runat="server" Text="重新初始化数据" OnClick="Button1_Click">
        </f:Button>
        <f:Button ID="Button3" runat="server" Text="清空数据" OnClick="Button3_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <f:Window ID="Window1" Hidden="true" EnableIFrame="true" EnableMaximize="true"
            EnableResize="true" Target="Top" runat="server" Height="500px" Width="700px"
            Title="选择用户">
        </f:Window>
        <br />
        <br />

    </form>
    <script>

        var grid1ClientID = '<%= Grid1.ClientID %>';
        var window1ClientID = '<%= Window1.ClientID %>';

        var EMPTY_DATA = {
            'Name': '',
            'Gender': '',  // Gender的列类型是整型，这里的空字符串表示未定义（对应于服务器断的DBNull.Value）
            'EntranceYear': '',
            'EntranceDate': '',
            'AtSchool': '',  // AtSchool的列类型是布尔型，这里的空字符串表示未定义（对应于服务器断的DBNull.Value）
            'Major': '',
            'Delete': '<a href="#"><img src="../res/icon/delete.png"/></a>'
        };

        function renderGender(value) {
            // value === '', 表示空数据
            if (value === '') {
                return '';
            } else {
                return value == 1 ? '男' : '女';
            }
        }

        function renderAtSchool(value) {
            // value === '', 表示空数据
            if (value === '') {
                return '';
            } else {
                return value ? '在校' : '离校';
            }
        }


        function updateGridRow(values) {
            var grid = F(grid1ClientID);

            var selectedRow = grid.getSelectedRow();

            // cancelEdit用来取消编辑
            grid.cancelEdit();
            grid.updateCellValue(selectedRow, values);
        }

        function moveToNextRow() {
            var grid = F(grid1ClientID);

            function selectNextRow() {
                // 当前选中行
                var selectedRowEl = grid.getSelectedRowEl();
                var nextSelectedRowEl = selectedRowEl.next();

                if (nextSelectedRowEl.length) {
                    // 如果下一行存在
                    grid.selectRow(nextSelectedRowEl);
                    grid.startEdit(nextSelectedRowEl, "Name");

                    return true;
                }

                return false;
            }

            // 如果下一行不存在，需要新增一行
            if (!selectNextRow()) {
                // 此过程禁止触发事件 - dataload
                F.noEvent(function () {
                    grid.addNewRecord(EMPTY_DATA, true, false);
                });

                selectNextRow();
            }
        }



        function onNameSearchTriggerClick(event) {
            var grid = F(grid1ClientID);
            var selectedCell = grid.getSelectedCell();
            if (selectedCell) {
                var wnd = F(window1ClientID);
                // 由于需要在顶层页面中弹出，所以不能设置 ./grideditor_selectfromwindow_clientscript_iframe.aspx，必须通过 baseUrl 来绝对定位
                wnd.show(F.resolveUrl('/grideditor/grideditor_selectfromwindow_emptyrows_iframe.aspx'));
            }
        }

        function onAddClick(event) {
            var grid = F(grid1ClientID);
            // 此过程禁止触发事件，防止 dataload 事件死循环
            F.noEvent(function () {
                var addedRowId = F(grid1ClientID).addNewRecord(EMPTY_DATA, true);
                // 选中新增的那一行
                grid.selectRow(addedRowId);
            });
        }

        function onGridDataLoad(event) {
            var grid = F(grid1ClientID);

            var rowEls = grid.getRowEls();
            var rowElsCount = rowEls.length;

            // 最少 1 个空白行，最多 10 个空白行
            var emptyRowCount = 10 - rowElsCount;
            if (emptyRowCount === 0) {
                // 不作处理
            } else if (emptyRowCount > 0) {
                // 新增空白行
                var records = [];
                for (var i = 0; i < emptyRowCount; i++) {
                    records.push(EMPTY_DATA);
                }
                // 此过程禁止触发事件，防止 dataload 事件死循环
                F.noEvent(function () {
                    grid.addNewRecords(records, true);
                });
            } else {
                // 删除多余的空白行
                var rowIdsToRemove = [];
                var rowsCountToRemove = -emptyRowCount;
                for (var i = 0; i < rowsCountToRemove; i++) {
                    var lastRowData = grid.getRowData(rowEls.eq(rowElsCount - i - 1));
                    // 如果本行的姓名为空，则删除
                    if (!lastRowData.values['Name']) {
                        rowIdsToRemove.push(lastRowData.id);
                    } else {
                        // 从后面向前查找，第一个不为空的行就终止删除
                        break;
                    }
                }
                if (rowIdsToRemove.length) {
                    // 此过程禁止触发事件，防止 dataload 事件死循环
                    F.noEvent(function () {
                        grid.deleteRows(rowIdsToRemove);
                    });
                }
            }
        }


        function insertNewRecords(records) {
            var grid = F(grid1ClientID);

            // 未定义属性用初始值替代
            for (var i = 0, length = records.length; i < length; i++) {
                records[i] = $.extend({}, EMPTY_DATA, records[i]);
            }

            grid.addNewRecords(records, false);
        }


        F.ready(function () {

            var grid = F(grid1ClientID);
            // 注册点击行中删除图片的事件处理函数
            grid.el.on('click', '.f-grid-cell-Delete a', function (event) {
                event.preventDefault();
                // 删除选中行之前先弹出确认对话框
                F.confirm({
                    message: '删除选中行？',
                    ok: function () {
                        // 删除选中行
                        grid.deleteSelectedRows();
                    }
                });
            });


        });

    </script>
</body>
</html>
