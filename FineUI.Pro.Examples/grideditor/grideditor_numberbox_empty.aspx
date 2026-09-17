<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_numberbox_empty.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_numberbox_empty" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="false"
            runat="server"
            AllowCellEditing="true" ClicksToEdit="1">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ColumnID="Year" DataField="Year" FieldType="Int"
                    HeaderText="年份" ExpandUnusedSpace="true" MinWidth="150px">
                    <Editor>
                        <f:NumberBox NoDecimal="true" NoNegative="true" MinValue="2000" Required="true"
                            MaxValue="2025" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="XueFei" DataField="XueFei" FieldType="Int"
                    HeaderText="学费">
                    <Editor>
                        <f:NumberBox NoDecimal="true" NoNegative="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="ZhusuFei" DataField="ZhusuFei" FieldType="Int"
                    HeaderText="住宿费">
                    <Editor>
                        <f:NumberBox NoDecimal="true" NoNegative="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="HuoshiFei" DataField="HuoshiFei" FieldType="Int"
                    HeaderText="伙食费">
                    <Editor>
                        <f:NumberBox NoDecimal="true" NoNegative="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="ShubenFei" DataField="ShubenFei" FieldType="Int"
                    HeaderText="书本费">
                    <Editor>
                        <f:NumberBox NoDecimal="true" NoNegative="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Heji" FieldType="Int" RendererFunction="renderHeji" HeaderText="合计">
                </f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="afteredit" Handler="onGridAfterEdit" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：
        <ul>
            <li>
                年份[2017]和[2018]的初始费用都为空（DBNull.Value）。
            </li>
            <li>
                也可以将某个现有数字更新为空。
            </li>
        </ul>
    </form>
    <script>

        function calculateHejiValue(rowValue) {
            var total = 0;

            function addColumnValue(columnName) {
                var columnValue = rowValue[columnName];
                if (typeof (columnValue) === 'number') {
                    total += columnValue;
                }
            }

            addColumnValue('XueFei');
            addColumnValue('HuoshiFei');
            addColumnValue('ShubenFei');
            addColumnValue('ZhusuFei');

            return total;
        }

        // 渲染合计列
        function renderHeji(value, params) {
            return calculateHejiValue(params.rowValue);
        }

        function onGridAfterEdit(event, value, params) {
            this.updateCellValue(params.rowId, 'Heji', calculateHejiValue(params.rowValue));
        }

    </script>
</body>
</html>
