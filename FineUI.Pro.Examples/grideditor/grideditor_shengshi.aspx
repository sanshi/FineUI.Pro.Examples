<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_shengshi.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_shengshi" %>

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
                <f:RenderField ColumnID="Name" DataField="Name" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="姓名">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                    <Editor>
                        <f:DropDownList ID="ddlGender" Required="true" runat="server">
                            <f:ListItem Text="男" Value="1" />
                            <f:ListItem Text="女" Value="0" />
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="Sheng" DataField="Sheng" HeaderText="所在省" RendererFunction="renderSheng">
                    <Editor>
                        <f:DropDownList ID="ddlSheng" Required="true" runat="server">
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="Shi" DataField="Shi" HeaderText="所在市" RendererFunction="renderShi">
                    <Editor>
                        <f:DropDownList ID="ddlShi" Required="true" runat="server">
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="beforeedit" Handler="onGridBeforeEdit" />
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
    <script type="application/json" id="provinceCityData">
        <%= FineUI.Pro.Examples.ProvinceCityCountyData.ProvinceCityJson %>

    </script>
    <script>
        // 省市数据作为 JSON 放在页面中，列表保存编码，渲染时再查显示名称。
        var provinceCityData = JSON.parse(document.getElementById('provinceCityData').textContent);

        // 单元格保存固定编码，渲染时从统一数据查找名称。
        function findPlaceName(items, code) {
            if (!items) {
                return '';
            }
            for (var i = 0; i < items.length; i++) {
                if (items[i][0] === code) {
                    return items[i][1];
                }
            }
            return '';
        }

        function renderSheng(value) {
            return findPlaceName(provinceCityData.provinces, value);
        }

        function renderShi(value, params) {
            var provinceCode = params.rowValue['Sheng'];
            return findPlaceName(provinceCityData.cities[provinceCode], value);
        }

        var gridClientID = '<%= Grid1.ClientID %>';
        var ddlShiClientID = '<%= ddlShi.ClientID %>';

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }


        function onGridBeforeEdit(event, value, params) {
            var grid = F(gridClientID);

            if (params.columnId === 'Shi') {
                var ddlShi = F(ddlShiClientID);

                var sheng = grid.getCellValue(params.rowId, 'Sheng');

                var shidata = provinceCityData.cities[sheng];
                if (shidata) {
                    ddlShi.enable();
                    ddlShi.setEmptyText('');
                    ddlShi.loadData(shidata);
                } else {
                    ddlShi.setEmptyText('请先选择省！');
                    ddlShi.disable();
                }
            }
        }


        function onGridAfterEdit(event, value, params) {
            var grid = F(gridClientID);

            if (params.columnId === 'Sheng') {
                var shidata = provinceCityData.cities[value];
                if (shidata) {
                    var shi = grid.getCellValue(params.rowId, 'Shi');
                    // 如果结束编辑时，市 不属于 当前 省，则清空 市
                    if ($.inArray(shi, shidata) < 0) {
                        // 对象中的键是列 ID，可用同一种写法更新一个或多个单元格。
                        // API：https://fineui.com/js/api/FineUI.Grid.html#updateCellValue
                        grid.updateCellValue(params.rowId, {
                            Shi: ''
                        });
                    }
                }
            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在表格单元格中联动省与市，没有省份时限制城市编辑，换省后校验已有城市。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>按省份约束城市选择</h3>
            <ol>
                <li>找到尚未选择省份的行，单击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>的<strong>所在市</strong>单元格。<br />结果：城市编辑器禁用，并显示先选择省份的提示，不提供无所属省的城市选项。</li>
                <li>先选择<strong><strong>所在省</strong></strong>，再打开<strong><strong>所在市</strong></strong>；随后把省份改为另一个省。<br />结果：城市选项按当前省重新加载；原城市不属于新省时被清空，需要重新选择合法城市。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>
                    如果未设置省份，则<strong>所在市</strong>下拉列表禁用，并且显示提示信息 - 请先选择省！
                </li>
                <li>
                    选择省份后，<strong>所在市</strong>下拉列表数据动态加载
                </li>
                <li>
                    更改省份后，如果所在<strong>所在市</strong>不属于当前省份，则清空<strong>所在市</strong>
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>beforeedit / afteredit</code>（<strong>页面脚本</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>）：进入市编辑器前按当前省加载选项，省份结束编辑后检查并清空不再有效的城市。</li>
            </ul>
        </section>
    </template>
</body>
</html>
