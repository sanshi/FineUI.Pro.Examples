<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_groupfield_sort.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_groupfield_sort" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            AllowSorting="true" SortField="HZData1"
            SortDirection="ASC" OnSort="Grid1_Sort">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Year" SortField="Year" HeaderText="统计年份" />
                <f:GroupField HeaderText="安徽省" TextAlign="Center">
                    <Columns>
                        <f:GroupField HeaderText="合肥市" TextAlign="Center">
                            <Columns>
                                <f:BoundField DataField="AHData1" SortField="AHData1" HeaderText="数据一"
                                    TextAlign="Center" />
                                <f:BoundField DataField="AHData2" SortField="AHData2" HeaderText="数据二"
                                    TextAlign="Center" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:GroupField HeaderText="河南省" TextAlign="Center">
                    <Columns>
                        <f:GroupField HeaderText="驻马店市" TextAlign="Center">
                            <Columns>
                                <f:BoundField DataField="HZData1" SortField="HZData1" ColumnID="HZData1"
                                    HeaderText="数据一" TextAlign="Center" />
                                <f:BoundField DataField="HZData2" SortField="HZData2" HeaderText="数据二"
                                    TextAlign="Center" />
                            </Columns>
                        </f:GroupField>
                        <f:GroupField HeaderText="漯河市" TextAlign="Center">
                            <Columns>
                                <f:BoundField DataField="HLData1" SortField="HLData1" HeaderText="数据一"
                                    TextAlign="Center" />
                                <f:BoundField DataField="HLData2" SortField="HLData2" HeaderText="数据二"
                                    TextAlign="Center" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:BoundField BoxFlex="1" DataField="LogTime" TextAlign="Center" DataFormatString="{0:yyyy/MM/dd}" HeaderText="记录时间" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
</body>
</html>
