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
                <f:BoundField ColumnID="Name" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <%--<f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />--%>
                <f:BoundField ColumnID="LogTime" DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="注册日期" />
            </Columns>
            <Toolbars>
                <f:Toolbar runat="server" ToolbarAlign="Right" Position="Top">
                    <Items>
                        <f:Button runat="server" ID="btnColumnConfig" Text="列配置" IconFont="_Gear" ClickHandler="onColumnConfigClick"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Grid>
        <f:Window ID="Window1" runat="server" Title="列配置（双击行显示隐藏）" IsModal="true" EnableClose="true" IconFont="_Group"
            Width="500px" Height="350px" Layout="HBox" BodyPadding="10px" Hidden="true">
            <Items>
                <f:Grid ID="Grid2" BoxFlex="1" ShowBorder="true" ShowHeader="false" runat="server" EnableCollapse="false"
                    DataIDField="ColumnID" EnableHeaderMenu="false" MarginRight="5px">
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
                <f:Panel ID="Panel1" runat="server" ShowBorder="false" ShowHeader="false" Width="120px"
                    Layout="VBox" BoxConfigPosition="Start">
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
    <script>

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
            var configedColumns = $.map(gridConfig.data, function (item, index) {
                return {
                    ColumnID: item.id,
                    Hidden: !item.values['Hidden'],
                    HeaderText: item.values['HeaderText']
                };
            });

            
            // 更新主表格
            var newcolumns = [];
            $.each(configedColumns, function (index, item) {
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
            var records = $.map(grid.columns, function (item, index) {
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
            gridConfig.updateCellValue(rowData, 'Hidden', toggledShow, true);


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
                    ok: function (userInputValue) {
                        gridConfig.updateCellValue(rowData, 'HeaderText', userInputValue, true);

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
            var records = $.map(defaultValue, function (item, index) {
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
</body>
</html>
