<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkboxfield_columncheckall_switch_text.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkboxfield_columncheckall_switch_text" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-field-body-checkboxlabel {
            white-space: nowrap;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server" EnableCheckBoxSelect="true"
            CheckBoxSelectWidth="60px" CheckBoxSelectDisplayType="Switch" DataIdField="Id" DataTextField="Name">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Label runat="server" Text="快速设定："></f:Label>
                        <f:CheckBox runat="server" Text="是否在校1" DisplayType="Switch" MarginRight="10px" AttributeDataTag="CheckBoxField1">
                            <Listeners>
                                <f:Listener Event="change" Handler="onQuickSetCheckChange" />
                            </Listeners>
                        </f:CheckBox>
                        <f:CheckBox runat="server" Text="是否在校2" DisplayType="Switch" MarginRight="10px" AttributeDataTag="CheckBoxField2">
                            <Listeners>
                                <f:Listener Event="change" Handler="onQuickSetCheckChange" />
                            </Listeners>
                        </f:CheckBox>
                        <f:CheckBox runat="server" Text="是否在校3" DisplayType="Switch" MarginRight="10px" AttributeDataTag="CheckBoxField3">
                            <Listeners>
                                <f:Listener Event="change" Handler="onQuickSetCheckChange" />
                            </Listeners>
                        </f:CheckBox>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校1" />
                <f:RenderCheckField ColumnID="CheckBoxField1" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校1" DisplayType="Switch" />
                <f:RenderCheckField ColumnID="CheckBoxField2" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校2" DisplayType="Switch"
                    SwitchTextVisible="true" />
                <f:RenderCheckField ColumnID="CheckBoxField3" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校3" DisplayType="Switch"
                    SwitchTextVisible="true" SwitchOnText="是" SwitchOffText="否" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行复选框的状态" ClickHandler="onNotifyCheckFieldStatusClick">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';

        function onQuickSetCheckChange(event) {
            var grid1 = F(Grid1ClientID);
            var checkboxFieldID = this.getAttr('data-tag'),
                checked = this.getValue();

            // 更新所有行中指定列复选框的值
            grid1.getRowEls().each(function() {
                // 对象中的键是列 ID，可用同一种写法更新一个或多个单元格。
                // API：https://fineui.com/js/api/FineUI.Grid.html#updateCellValue
                grid1.updateCellValue($(this), {
                    [checkboxFieldID]: checked
                }, true);
            });
        }


        function onNotifyCheckFieldStatusClick(event) {
            var grid1 = F(Grid1ClientID);

            var rowEls = grid1.getSelectedRowEls();
            if (!rowEls.length) {
                F.alert('没有选中项！');
                return;
            }

            var result = ['<table class="result">'];
            result.push('<tr>');
            result.push('<th>ID</th>');
            result.push('<th>姓名</th>');
            result.push('<th>是否在校2</th>');
            result.push('<th>是否在校3</th>');
            result.push('<th>是否在校4</th>');
            result.push('</tr>');
            rowEls.each(function() {
                var cnode = $(this);
                var rowData = grid1.getRowData(cnode);
                var isChecked2 = rowData.values.CheckBoxField1;
                var isChecked3 = rowData.values.CheckBoxField2;
                var isChecked4 = rowData.values.CheckBoxField3;

                result.push('<tr>');
                result.push('<td>' + rowData.id + '</td>');
                result.push('<td>' + rowData.text + '</td>');
                result.push('<td>' + (isChecked2 ? '在校' : '不在校') + '</td>');
                result.push('<td>' + (isChecked3 ? '在校' : '不在校') + '</td>');
                result.push('<td>' + (isChecked4 ? '在校' : '不在校') + '</td>');
                result.push('</tr>');
            });
            result.push('</table>');

            F.notify({
                message: F.rawHtml(result.join('')),
                target: '_top',
                header: false,
                messageIcon: '',
                positionX: 'center',
                positionY: 'top'
            });
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>为开关样式的复选框列显示状态文字，并比较默认文字与自定义是、否。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>对照开关中的状态文字</h3>
            <ul>
                <li>分别切换<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>中的是否在校2、是否在校3和是否在校4。<br />结果：未开启文字的开关只显示图形；开启文字的列显示状态文本，最后一列显示自定义的是或否，文字随当前值切换。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DisplayType</code>（<strong>可修改的复选框列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 Switch，正文列以开关外观显示布尔值。
                </li>
                <li><code>CheckBoxSelectDisplayType</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>Switch</code>，让整行选择入口也使用开关外观；它控制行选择，区别于正文列的布尔值。
                </li>
                <li><code>SwitchTextVisible / SwitchOnText / SwitchOffText</code>（<strong>可修改的复选框列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：分别控制是否显示文字及开关两种状态的文案；本页最后一列使用是与否。</li>
            </ul>
        </section>
    </template>
</body>
</html>
