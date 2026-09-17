<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_groupfield_complex.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_groupfield_complex" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格"
            EnableCollapse="false" runat="server"
            >
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:BoundField DataField="Year" HeaderText="统计年份" />
                <f:GroupField HeaderText="安徽省" TextAlign="Center">
                    <Columns>
                        <f:BoundField DataField="HSData" HeaderText="黄山市" />
                        <f:GroupField HeaderText="合肥市" TextAlign="Center">
                            <Columns>
                                <f:BoundField DataField="HFData" HeaderText="总数据" />
                                <f:GroupField HeaderText="其中" TextAlign="Center">
                                    <Columns>
                                        <f:BoundField DataField="HF_SHData" HeaderText="蜀山区" />
                                        <f:BoundField DataField="HF_BHData" HeaderText="滨湖区" />
                                    </Columns>
                                </f:GroupField>
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:GroupField HeaderText="河南省" TextAlign="Center">
                    <Columns>
                        <f:BoundField DataField="LHData" HeaderText="漯河市" />
                        <f:GroupField HeaderText="驻马店市" TextAlign="Center">
                            <Columns>
                                <f:BoundField DataField="ZMDData" HeaderText="总数据" />
                                <f:GroupField HeaderText="其中" TextAlign="Center">
                                    <Columns>
                                        <f:BoundField DataField="ZMD_SPData" HeaderText="遂平县" />
                                        <f:BoundField DataField="ZMD_XPData" HeaderText="西平县" />
                                    </Columns>
                                </f:GroupField>
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:BoundField ExpandUnusedSpace="true" MinWidth="150px"
                    TextAlign="Center" DataField="LogTime"
                    DataFormatString="{0:yyyy/MM/dd}" HeaderText="记录时间" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
</body>
</html>
