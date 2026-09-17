<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bigdata_dataurl_10000_rowtip.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridbigdata.bigdata_dataurl_10000_rowtip" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/gridbigdata/data.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（网址数据源，10000行）" EnableCollapse="false" Height="500px" EnableCheckBoxSelect="true"
            runat="server" DataIDField="Id" DataUrl="~/gridbigdata/data.ashx?total=10000&type=simple"
            EnableBigData="true" FixedRowHeight="true"
            EnableBigDataRowTip="false" PagingToolbarVisible="false">
            <Columns>
                <f:RowNumberField Width="50px"></f:RowNumberField>
                <f:RenderField Width="150px" ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int"
                    RendererFunction="renderGender" HeaderText="性别">
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor"
                    ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                </f:RenderField>
                <f:RenderField ColumnID="Group" DataField="Group" RendererFunction="renderGroup" HeaderText="分组">
                </f:RenderField>
            </Columns>
            <Toolbars>
                <f:Toolbar runat="server" Position="Bottom">
                    <Items>
                        <f:Label runat="server" Text="转到行："></f:Label>
                        <f:NumberBox ID="nbRowNumber" runat="server" MinValue="1" MaxValue="10000"
                            Text="1000" Increment="100" EnableCommas="true">
                        </f:NumberBox>
                        <f:Button runat="server" Text="Go" ClickHandler="onGotoRow"></f:Button>
                        <f:ToolbarFill runat="server"></f:ToolbarFill>
                        <f:Label ID="labRowTip" runat="server"></f:Label>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Listeners>
                <f:Listener Event="bigdatarowtip" Handler="onBigDataRowTip" />
            </Listeners>
        </f:Grid>
        <br />

    </form>
	<script src="../res/js/grid.js"></script>
    <script>

        var grid1ClientID = '<%= Grid1.ClientID %>';
        var nbRowNumberClientID = '<%= nbRowNumber.ClientID %>';
        var labRowTipClientID = '<%= labRowTip.ClientID %>';

        // 转到行
        function onGotoRow(event) {
            // scrollToRow 的参数是行索引，而 nbRowNumber 取得的是行序号
            F(grid1ClientID).scrollToRow(F(nbRowNumberClientID).getValue() - 1);
        }


        // 大数据模式下的行数提示
        function onBigDataRowTip(event, startRowNumber, endRowNumber, rowCount) {
            F(labRowTipClientID).setValue(F.formatString('显示 {0} - {1} 条，共 {2} 条', startRowNumber, endRowNumber, rowCount));
        }


        

    </script>
</body>
</html>
