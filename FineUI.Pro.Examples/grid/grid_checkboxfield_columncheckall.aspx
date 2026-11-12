<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkboxfield_columncheckall.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkboxfield_columncheckall" %>

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
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Label runat="server" Text="快速设定："></f:Label>
                        <f:CheckBox runat="server" Text="是否在校1" MarginRight="10px" AttributeDataTag="CheckBoxField1">
                            <Listeners>
                                <f:Listener Event="change" Handler="onQuickSetCheckChange" />
                            </Listeners>
                        </f:CheckBox>
                        <f:CheckBox runat="server" Text="是否在校2" MarginRight="10px" AttributeDataTag="CheckBoxField2">
                            <Listeners>
                                <f:Listener Event="change" Handler="onQuickSetCheckChange" />
                            </Listeners>
                        </f:CheckBox>
                        <f:CheckBox runat="server" Text="是否在校3" MarginRight="10px" AttributeDataTag="CheckBoxField3">
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
                <f:RenderCheckField ColumnID="CheckBoxField1" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校1" />
                <f:RenderCheckField ColumnID="CheckBoxField2" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校2" />
                <f:RenderCheckField ColumnID="CheckBoxField3" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校3" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行复选框的状态" ClickHandler="onReadCheckStatesClick">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        function onReadCheckStatesClick(event) {
            var grid = F('<%= Grid1.ClientID %>');
            F.customEvent('CheckSelectedRows', {
                rows: getGridCheckRows(grid, ["CheckBoxField1", "CheckBoxField2", "CheckBoxField3"], true)
            });
            return false;
        }

        var grid1ClientID = '<%= Grid1.ClientID %>';

        function onQuickSetCheckChange(event) {
            var grid1 = F(grid1ClientID);
            var checkboxFieldID = this.getAttr('data-tag'),
                checked = this.getValue();

            // 同步每行的当前值，后续读取和重新绘制都保留全选结果。
            grid1.getRowEls().each(function() {
                // 对象中的键是列 ID，可用同一种写法更新一个或多个单元格。
                // API：https://fineui.com/js/api/FineUI.Grid.html#updateCellValue
                grid1.updateCellValue($(this), {
                    [checkboxFieldID]: checked
                }, true);
            });
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>用快速设定入口一次勾选或清空某个正文复选框列。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>按列统一切换</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的快速设定区域切换某一列的选项。<br />结果：该列所有正文复选框统一勾选或取消，其他列不改变；可直接点击单个正文选择框继续调整。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>updateCellValue</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：快速设定按列标识批量更新正文单元格；不是选择或取消整行。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
