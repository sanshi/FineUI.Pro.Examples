<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowmove_columnconfig.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowmove_columnconfig" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            EnableHeaderMenu="false">
            <Columns>
                <f:RowNumberField ColumnID="RowNumber" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <%--<f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />--%>
                <f:RenderField ColumnID="LogTime" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
            <Toolbars>
                <f:Toolbar runat="server" ToolbarAlign="Right" Position="Top">
                    <Items>
                        <f:Button runat="server" ID="btnColumnConfig" Text="列配置" IconFont="_Gear" ClickHandler="onColumnConfigClick"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Grid>
        <f:Window ID="Window1" runat="server" Title="列配置（双击行显示隐藏）" IsModal="true" EnableClose="true" IconFont="_Group" Width="500px" Height="350px"
            Layout="HBox" BodyPadding="10px" Hidden="true">
            <Items>
                <f:Grid ID="Grid2" BoxFlex="1" ShowBorder="true" ShowHeader="false" runat="server" EnableCollapse="false" DataIDField="ColumnID"
                    EnableHeaderMenu="false" MarginRight="5px">
                    <Columns>
                        <f:RowNumberField ColumnID="RowNumber"></f:RowNumberField>
                        <f:RenderField ColumnID="ColumnID" HeaderText="ID" />
                        <f:RenderField ColumnID="HeaderText" HeaderText="标题" BoxFlex="1" />
                        <f:RenderCheckField ColumnID="Hidden" HeaderText="显示" RenderAsStaticField="true" />
                    </Columns>
                    <Listeners>
                        <f:Listener Event="rowdblclick" Handler="onGridConfigDblClick" />
                    </Listeners>
                </f:Grid>
                <f:Panel ID="Panel1" runat="server" ShowBorder="false" ShowHeader="false" Width="120px" Layout="VBox" BoxConfigPosition="Start">
                    <Items>
                        <f:Button ID="btnMoveUp" runat="server" Text="上移" MarginBottom="5px" ClickHandler="onMoveUpClick"></f:Button>
                        <f:Button ID="btnMoveDown" runat="server" Text="下移" MarginBottom="20px" ClickHandler="onMoveDownClick"></f:Button>
                        <f:Button ID="btnShowHide" runat="server" Text="显示隐藏" MarginBottom="5px" ClickHandler="onShowHideClick"></f:Button>
                        <f:Button ID="btnChangeHeaderText" Text="修改标题" runat="server" MarginBottom="20px" ClickHandler="onChangeHeaderTextClick"></f:Button>
                        <f:Button ID="btnResetColumnConfig" Text="还原默认值" runat="server" MarginBottom="20px" ClickHandler="onResetColumnConfigClick"></f:Button>
                        <f:Button ID="btnCloseWindow" Text="关闭" runat="server" MarginBottom="5px" ClickHandler="onCloseWindowClick"></f:Button>
                    </Items>
                </f:Panel>
            </Items>
        </f:Window>
        <br />
        <br />
        <f:Button runat="server" ID="btnRefresh" Text="刷新本页面（保持列顺序）" ClickHandler="onRefreshClick"></f:Button>
    </form>
    <script type="application/json" id="defaultColumnConfig">
        <%= DefaultColumnConfigJson %>

    </script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        window.GRID_COLUMNCONFIG_DEFAULT = JSON.parse(document.getElementById('defaultColumnConfig').textContent);

        function onRefreshClick(event) {
            window.location.reload();
        }

        var gridClientID = '<%= Grid1.ClientID %>';
        var wndClientID = '<%= Window1.ClientID %>';
        var gridConfigClientID = '<%= Grid2.ClientID %>';

        // 更新主表格的列配置
        function updateMainGridColumnConfig() {
            var grid = F(gridClientID);
            var gridConfig = F(gridConfigClientID);

            // 从配置表格读取配置数据
            var configedColumns = $.map(gridConfig.data, function(item, index) {
                return {
                    ColumnID: item.id,
                    Hidden: !item.values['Hidden'],
                    HeaderText: item.values['HeaderText']
                };
            });


            // 更新主表格
            var newcolumns = [];
            $.each(configedColumns, function(index, item) {
                var originalColumn = grid.getColumn(item.ColumnID);
                originalColumn.hidden = item.Hidden;
                originalColumn.text = item.HeaderText;

                newcolumns.push(originalColumn);
            });
            grid.columns = newcolumns;
            grid.loadData();


            // 保存到数据库
            F.customEvent('GridConfig_Change', {
                configedColumns: configedColumns
            });
        }


        // 点击[列配置]按钮
        function onColumnConfigClick(event) {
            var grid = F(gridClientID);
            var gridConfig = F(gridConfigClientID);

            // 初始化列配置表格
            var records = $.map(grid.columns, function(item, index) {
                return {
                    id: item.columnId,
                    values: {
                        'ColumnID': item.columnId,
                        'HeaderText': item.text,
                        'Hidden': !item.hidden
                    }
                };
            });
            gridConfig.loadData(records);

            gridConfig.selectRow(0);

            // 显示列配置窗体
            F(wndClientID).show();
        }


        // 切换列配置[显示]列
        function toggleGridConfigHidden(rowId) {
            var gridConfig = F(gridConfigClientID);
            var grid = F(gridClientID);

            var rowData = gridConfig.getRowData(rowId);
            var rowId = rowData.id;

            var toggledShow = !rowData.values['Hidden'];
            // 对象中的键是列 ID，可用同一种写法更新一个或多个单元格。
            // API：https://fineui.com/js/api/FineUI.Grid.html#updateCellValue
            gridConfig.updateCellValue(rowData, {
                Hidden: toggledShow
            }, true);


            updateMainGridColumnConfig();
        }

        // 列配置表格 - 行双击事件
        function onGridConfigDblClick(event, rowId) {
            toggleGridConfigHidden(rowId);
        }

        // 列配置表格 - 点击[显示隐藏]按钮
        function onShowHideClick(event) {
            var rowId = F(gridConfigClientID).getSelectedRow();
            if (rowId) {
                toggleGridConfigHidden(rowId);
            }
        }

        // 列配置表格 - 点击[上移]按钮
        function onMoveUpClick(event) {
            var gridConfig = F(gridConfigClientID);
            var rowId = gridConfig.getSelectedRow();
            if (rowId) {
                gridConfig.moveRowUp(rowId);
            }

            updateMainGridColumnConfig();
        }

        // 列配置表格 - 点击[下移]按钮
        function onMoveDownClick(event) {
            var gridConfig = F(gridConfigClientID);
            var rowId = gridConfig.getSelectedRow();
            if (rowId) {
                gridConfig.moveRowDown(rowId);
            }

            updateMainGridColumnConfig();
        }

        // 列配置表格 - 点击[修改标题]按钮
        function onChangeHeaderTextClick(event) {
            var gridConfig = F(gridConfigClientID);

            var rowId = gridConfig.getSelectedRow();
            if (rowId) {
                var rowData = gridConfig.getRowData(rowId);
                F.prompt({
                    message: '请输入新的列标题',
                    defaultValue: rowData.values['HeaderText'],
                    ok: function(userInputValue) {
                        gridConfig.updateCellValue(rowData, {
                            HeaderText: userInputValue
                        }, true);

                        updateMainGridColumnConfig();
                    }
                });
            }

        }

        // 列配置表格 - 点击[还原默认值]按钮
        function onResetColumnConfigClick(event) {
            var gridConfig = F(gridConfigClientID);
            var defaultValue = window.GRID_COLUMNCONFIG_DEFAULT;

            // 初始化列配置表格
            var records = $.map(defaultValue, function(item, index) {
                return {
                    id: item.ColumnID,
                    values: {
                        'ColumnID': item.ColumnID,
                        'HeaderText': item.HeaderText,
                        'Hidden': !item.Hidden
                    }
                };
            });
            gridConfig.loadData(records);

            updateMainGridColumnConfig();
        }

        function onCloseWindowClick(event) {
            F(wndClientID).hide();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在配置窗体中调整列顺序、显隐与标题，立即更新主表并保存配置。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>通过列清单调整主表</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnColumnConfig").ClientID %>'
                        title="列配置">列配置</strong>，在配置表格选中一个列项，点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnMoveUp").ClientID %>' title="上移">上移</strong>或<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnMoveDown").ClientID %>'
                        title="下移">下移</strong>。<br />结果：列清单顺序改变，主表采用同一顺序；配置项以列标识对应主表列，不移动学生记录。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnShowHide").ClientID %>'
                        title="显示隐藏">显示隐藏</strong>，再点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnChangeHeaderText").ClientID %>'
                        title="修改标题">修改标题</strong>输入<code>自定义标题</code>并确认。<br />结果：主表对应列立即隐藏或<strong>显示</strong>，<strong>标题</strong>按输入更新；本页保存这些配置，刷新后按保存结果恢复。
                </li>
                <li>点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnResetColumnConfig").ClientID %>'
                        title="还原默认值">还原默认值</strong>。<br />结果：列顺序、<strong>标题</strong>与<strong>显示</strong>状态恢复本页预设，学生记录本身不因配置恢复而改写。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ColumnID / Hidden / HeaderText</code>（<strong>列配置与主表列集合</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：配置表格按列标识保存顺序、显隐及文字，更新主表完整列集合后重新布局。</li>
            </ul>
        </section>
    </template>
</body>
</html>
