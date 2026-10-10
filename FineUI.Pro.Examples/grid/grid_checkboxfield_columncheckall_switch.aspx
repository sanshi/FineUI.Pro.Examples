<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkboxfield_columncheckall_switch.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkboxfield_columncheckall_switch" %>

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
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" CheckBoxSelectWidth="60px" CheckBoxSelectDisplayType="Switch">
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
                <f:RenderCheckField ColumnID="CheckBoxField2" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校2" DisplayType="Switch" />
                <f:RenderCheckField ColumnID="CheckBoxField3" RenderAsStaticField="false" DataField="AtSchool" HeaderText="是否在校3" DisplayType="Switch" />
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

            // 更新接口同时切换开关显示和当前行值，不新增编辑修改记录。
            grid1.getRowEls().each(function() {
                // 对象中的键是列 ID，可用同一种写法更新一个或多个单元格。
                // API：https://fineui.com/js/api/FineUI.Grid.html#updateCellValue
                grid1.updateCellValue($(this), {
                    [checkboxFieldID]: checked
                }, true);
            });
        }

    </script>
</body>
</html>
