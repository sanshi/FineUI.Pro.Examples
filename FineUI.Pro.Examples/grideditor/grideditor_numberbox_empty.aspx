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
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="false" runat="server"
            AllowCellEditing="true" ClicksToEdit="1">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ColumnID="Year" DataField="Year" FieldType="Int" HeaderText="年份" ExpandUnusedSpace="true" MinWidth="150px">
                    <Editor>
                        <f:NumberBox NoDecimal="true" NoNegative="true" MinValue="2000" Required="true" MaxValue="2025" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="XueFei" DataField="XueFei" FieldType="Int" HeaderText="学费">
                    <Editor>
                        <f:NumberBox ID="NumberBoxExample2" NoDecimal="true" NoNegative="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="ZhusuFei" DataField="ZhusuFei" FieldType="Int" HeaderText="住宿费">
                    <Editor>
                        <f:NumberBox NoDecimal="true" NoNegative="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="HuoshiFei" DataField="HuoshiFei" FieldType="Int" HeaderText="伙食费">
                    <Editor>
                        <f:NumberBox NoDecimal="true" NoNegative="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="ShubenFei" DataField="ShubenFei" FieldType="Int" HeaderText="书本费">
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

    </form>
    <script>
        function calculateHejiValue(rowValue) {
            var total = 0;

            function addColumnValue(columnName) {
                var columnValue = rowValue[columnName];
                if (typeof(columnValue) === 'number') {
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
            // 对象中的键是列 ID，可用同一种写法更新一个或多个单元格。
            // API：https://fineui.com/js/api/FineUI.Grid.html#updateCellValue
            this.updateCellValue(params.rowId, {
                Heji: calculateHejiValue(params.rowValue)
            });
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>让空费用用空白显示，编辑数值后动态重算同一行的合计。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>填写与清空费用</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>找到费用为空的记录，单击<strong>学费</strong>并输入<code>500</code>，再离开单元格。<br />结果：<strong>学费</strong>显示
                    500，该行<strong>合计</strong>立即按各项费用重算；空项按本页的计算规则参与<strong>合计</strong>。</li>
                <li>清空刚才的费用并结束编辑。<br />结果：费用单元格恢复空白，<strong>合计</strong>重新计算，不把空费用强制显示为 0。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>
                    <strong>年份</strong>[2017]和[2018]的初始费用都为空（DBNull.Value）。
                </li>
                <li>
                    也可以将某个现有数字更新为空。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>NoDecimal</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("NumberBoxExample2").ClientID %>' title="学费列的数字输入框">学费列的数字输入框</strong>）：初始为
                    <code>true</code>，费用编辑器只接收整数金额。
                </li>
                <li><code>NoNegative</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("NumberBoxExample2").ClientID %>' title="学费列的数字输入框">学费列的数字输入框</strong>）：初始为
                    <code>true</code>，费用编辑器不接收负数。
                </li>
                <li><code>RendererFunction</code>（<strong>合计列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>）：<strong>合计</strong>列从当前行各项费用计算结果，修改后重新渲染该行的<strong>合计</strong>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
