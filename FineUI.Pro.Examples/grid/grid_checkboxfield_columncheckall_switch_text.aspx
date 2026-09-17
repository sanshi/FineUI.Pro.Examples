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
        <f:Grid ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            runat="server" EnableCheckBoxSelect="true" CheckBoxSelectWidth="60px" CheckBoxSelectDisplayType="Switch"
            DataIdField="Id" DataTextField="Name" >
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
                <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" DataFormatString="{0}"
                    HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校1" />
                <f:RenderCheckField ColumnID="CheckBoxField1" RenderAsStaticField="false"
                    DataField="AtSchool" HeaderText="是否在校1" DisplayType="Switch" />
                <f:RenderCheckField ColumnID="CheckBoxField2" RenderAsStaticField="false"
                    DataField="AtSchool" HeaderText="是否在校2" DisplayType="Switch" SwitchTextVisible="true"  />
                <f:RenderCheckField ColumnID="CheckBoxField3" RenderAsStaticField="false"
                    DataField="AtSchool" HeaderText="是否在校3" DisplayType="Switch" SwitchTextVisible="true" SwitchOnText="是" SwitchOffText="否" />
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
    <script>

        var Grid1ClientID = '<%= Grid1.ClientID %>';

        function onQuickSetCheckChange(event) {
            var grid1 = F(Grid1ClientID);
            var checkboxFieldID = this.getAttr('data-tag'), checked = this.getValue();

            //var checkboxEls = grid1.el.find('.f-grid-cell-' + checkboxFieldID + ' .f-grid-checkbox');
            //checkboxEls.toggleClass('f-checked', checked);

            // 更新所有行中指定列复选框的值
            grid1.getRowEls().each(function () {
                grid1.updateCellValue($(this), checkboxFieldID, checked, true);
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
            rowEls.each(function () {
                var cnode = $(this);
                var rowData = grid1.getRowData(cnode);
                var isChecked2 = cnode.find('.f-grid-cell-CheckBoxField1 .f-grid-checkbox').hasClass('f-checked');
                var isChecked3 = cnode.find('.f-grid-cell-CheckBoxField2 .f-grid-checkbox').hasClass('f-checked');
                var isChecked4 = cnode.find('.f-grid-cell-CheckBoxField3 .f-grid-checkbox').hasClass('f-checked');

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
</body>
</html>
