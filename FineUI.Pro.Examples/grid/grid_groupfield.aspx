<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_groupfield.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_groupfield" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            >
            <Columns>
                <f:BoundField DataField="Year" HeaderText="统计年份" />
                <f:GroupField ColumnID="Anhui" HeaderText="安徽省" TextAlign="Center">
                    <Columns>
                        <f:GroupField ColumnID="Hefei" HeaderText="合肥市" TextAlign="Center">
                            <Columns>
                                <f:BoundField DataField="AHData1" HeaderText="数据一" />
                                <f:BoundField DataField="AHData2" HeaderText="数据二" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:GroupField ColumnID="Henan" HeaderText="河南省" TextAlign="Center">
                    <Columns>
                        <f:GroupField ColumnID="Zhumadian" HeaderText="驻马店市" TextAlign="Center">
                            <Columns>
                                <f:BoundField DataField="HZData1" HeaderText="数据一" />
                                <f:BoundField DataField="HZData2" HeaderText="数据二" />
                            </Columns>
                        </f:GroupField>
                        <f:GroupField ColumnID="Luohe" HeaderText="漯河市" TextAlign="Center">
                            <Columns>
                                <f:BoundField DataField="HLData1" HeaderText="数据一" />
                                <f:BoundField DataField="HLData2" HeaderText="数据二" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:BoundField BoxFlex="1" TextAlign="Center" DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="记录时间" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
</body>
</html>
