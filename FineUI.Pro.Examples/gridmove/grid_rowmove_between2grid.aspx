<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowmove_between2grid.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowmove_between2grid" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window1" runat="server" Title="选择用户窗体" IsModal="false" EnableClose="false" IconFont="_Group"
            Width="500px" Height="350px" Layout="HBox" BodyPadding="10px">
            <Items>
                <f:GroupPanel BoxFlex="1" Title="数据源" Layout="Fit" BodyPadding="0" runat="server">
                    <Items>
                        <f:Grid ID="Grid1" ShowBorder="false" ShowHeader="false" runat="server" EnableCollapse="false"
                            DataIDField="Id" ShowGridHeader="false" EnableRowLines="false" EnableAlternateRowColor="false">
                            <Columns>
                                <f:BoundField ColumnID="Name" DataField="Name" DataFormatString="{0}" HeaderText="姓名" BoxFlex="1" />
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:GroupPanel>
                <f:Panel runat="server" ShowBorder="false" ShowHeader="false" Width="60px"
                    Layout="VBox" BoxConfigPosition="Center" BodyPadding="10px">
                    <Items>
                        <f:Button ID="Button3" IconFont="_DoubleRight" runat="server" MarginBottom="5px" ClickHandler="onMoveRightAllClick"></f:Button>
                        <f:Button ID="Button1" IconFont="_Right" runat="server" MarginBottom="5px" ClickHandler="onMoveRightClick"></f:Button>
                        <f:Button ID="Button2" IconFont="_Left" runat="server" MarginBottom="5px" ClickHandler="onMoveLeftClick"></f:Button>
                        <f:Button ID="Button4" IconFont="_DoubleLeft" runat="server" MarginBottom="5px" ClickHandler="onMoveLeftAllClick"></f:Button>
                    </Items>
                </f:Panel>
                <f:GroupPanel ID="GroupPanel1" BoxFlex="1" Title="已选择" Layout="Fit" BodyPadding="0" runat="server">
                    <Items>
                        <f:Grid ID="Grid2" BoxFlex="1" ShowBorder="false" ShowHeader="false" runat="server" EnableCollapse="false"
                            DataIDField="Id" ShowGridHeader="false" EnableRowLines="false" EnableAlternateRowColor="false">
                            <Columns>
                                <f:BoundField ColumnID="Name" DataField="Name" DataFormatString="{0}" HeaderText="姓名" BoxFlex="1" />
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:GroupPanel>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="btnCheckSelected" Text="选择了那些用户（自定义回发）" Type="Submit" runat="server" ClickHandler="onCheckSelectedClick"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>
    </form>
    <script>
        function onRefreshClick(event) {
            window.location.reload();
        }


        var gridLeftClientID = '<%= Grid1.ClientID %>';
        var gridRightClientID = '<%= Grid2.ClientID %>';

        // 向右移动
        function moveRight(rowIds) {
            if (!rowIds.length) {
                return;
            }

            var gridLeft = F(gridLeftClientID);
            var gridRight = F(gridRightClientID);

            // 添加到右侧
            var rowDatas = [];
            $.each(rowIds, function (index, item) {
                rowDatas.push(gridLeft.getRowData(item));
            });
            gridRight.addNewRecords(rowDatas, true);

            // 从左侧删除
            gridLeft.deleteRows(rowIds, true);
        }

        function onMoveRightAllClick(event) {
            var gridLeft = F(gridLeftClientID);
            
            var rowIds = $.map(gridLeft.data, function (item, index) {
                return item.id;
            });

            // 全部行
            moveRight(rowIds);
        }

        function onMoveRightClick(event) {
            var gridLeft = F(gridLeftClientID);

            // 选择的行
            moveRight(gridLeft.getSelectedRows());
        }

        // 向左移动
        function moveLeft(rowIds) {
            if (!rowIds.length) {
                return;
            }

            var gridLeft = F(gridLeftClientID);
            var gridRight = F(gridRightClientID);

            // 添加到左侧
            var rowDatas = [];
            $.each(rowIds, function (index, item) {
                rowDatas.push(gridRight.getRowData(item));
            });
            gridLeft.addNewRecords(rowDatas, true);

            // 从右侧删除
            gridRight.deleteRows(rowIds, true);
        }

        function onMoveLeftClick(event) {
            var gridRight = F(gridRightClientID);

            // 选择的行
            moveLeft(gridRight.getSelectedRows());
        }

        function onMoveLeftAllClick(event) {
            var gridRight = F(gridRightClientID);

            var rowIds = $.map(gridRight.data, function (item, index) {
                return item.id;
            });

            // 全部行
            moveLeft(rowIds);
        }

        function onCheckSelectedClick(event) {
            var gridRight = F(gridRightClientID);

            // 姓名列表
            var columnNames = $.map(gridRight.data, function (item, index) {
                return {
                    id: item.id,
                    name: item.values['Name']
                };
            });

            //F.alert('已选择用户：' + columnNames.join('、'));

            F.customEvent('CheckSelected_Click', {
                columnNames: columnNames
            });
        }


    </script>
</body>
</html>
