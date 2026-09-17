<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_groupfield_hidden.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_groupfield_hidden" %>

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
            SortDirection="ASC" OnSort="Grid1_Sort" EnableHeaderMenu="true">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Year" HeaderText="统计年份" />
                <f:BoundField BoxFlex="1" DataField="LogTime" TextAlign="Center" DataFormatString="{0:yyyy/MM/dd}" HeaderText="记录时间" />
                <f:GroupField ColumnID="anhui" HeaderText="安徽省" TextAlign="Center">
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
                <f:GroupField HeaderText="河南省" BoxFlex="1" TextAlign="Center">
                    <Columns>
                        <f:GroupField ColumnID="zhumadian" HeaderText="驻马店市" TextAlign="Center" Hidden="true">
                            <Columns>
                                <f:BoundField DataField="HZData1" SortField="HZData1" HeaderText="数据一"
                                    TextAlign="Center" />
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
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="Button3" runat="server" Text="显示/隐藏[安徽省]列" CssClass="marginr" OnClick="Button3_Click">
        </f:Button>
        <f:Button ID="Button1" runat="server" Text="显示/隐藏[河南省/驻马店市]列" CssClass="marginr" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <br />
        注：初始隐藏[河南省]下面的[驻马店市]。
    </form>
</body>
</html>
