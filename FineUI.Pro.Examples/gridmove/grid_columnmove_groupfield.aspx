<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_columnmove_groupfield.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_columnmove_groupfield" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            EnableColumnMove="true" EnableSameGroupColumnMove="true">
            <Columns>
                <f:BoundField ColumnID="Year" DataField="Year" HeaderText="统计年份" />
                <f:GroupField ColumnID="anhui" HeaderText="安徽省" TextAlign="Center">
                    <Columns>
                        <f:GroupField ColumnID="hefei" HeaderText="合肥市" TextAlign="Center">
                            <Columns>
                                <f:BoundField ColumnID="AHData1" DataField="AHData1" HeaderText="数据一" />
                                <f:BoundField ColumnID="AHData2" DataField="AHData2" HeaderText="数据二" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:GroupField ColumnID="henan" HeaderText="河南省" TextAlign="Center">
                    <Columns>
                        <f:GroupField ColumnID="zhumadian" HeaderText="驻马店市" TextAlign="Center">
                            <Columns>
                                <f:BoundField ColumnID="HZData1" DataField="HZData1" HeaderText="数据一" />
                                <f:BoundField ColumnID="HZData2" DataField="HZData2" HeaderText="数据二" />
                            </Columns>
                        </f:GroupField>
                        <f:GroupField ColumnID="luohe" HeaderText="漯河市" TextAlign="Center">
                            <Columns>
                                <f:BoundField ColumnID="HLData1" DataField="HLData1" HeaderText="数据一" />
                                <f:BoundField ColumnID="HLData2" DataField="HLData2" HeaderText="数据二" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:BoundField ColumnID="LogTime" BoxFlex="1" TextAlign="Center" DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="记录时间" />
            </Columns>
            <Listeners>
                <f:Listener Event="columnmove" Handler="onGridColumnMove" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        <f:Button runat="server" ID="btnRefresh" Text="刷新本页面（保持列顺序）" ClickHandler="onRefreshClick"></f:Button>
        <br />
        <br />
        注：表格启用 EnableColumnMove 和 EnableSameGroupColumnMove，确保列只能在同一分组内移动（比如驻马店下面的数据一不能移动到合肥市的下面）！
    </form>

    <script>

        function onRefreshClick(event) {
            window.location.reload();
        }


        function onGridColumnMove(event, targetColumnId, sourceColumnId, operation) {
            var grid = this;

            function getColumnIds(columns) {
                return $.map(columns, function (item, index) {
                    var itemObj = {
                        columnId: item.columnId
                    };
                    if (item.columns) {
                        itemObj['columns'] = getColumnIds(item.columns);
                    }
                    return itemObj;
                });
            }

            // 列拖拽排序后的列顺序数组
            var columnIds = getColumnIds(grid.columns);

            // 回发，将新的列顺序数组保存到数据库
            F.customEvent('Grid1_ColumnMove', {
                columnIds: columnIds
            });
        }


    </script>
</body>
</html>
