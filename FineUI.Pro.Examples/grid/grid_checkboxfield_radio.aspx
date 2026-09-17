<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkboxfield_radio.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkboxfield_radio" %>

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
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            runat="server">
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
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校1" />
                <f:CheckBoxField ColumnID="CheckBoxField1" RenderAsStaticField="false" HeaderText="是否在校1" />
                <f:CheckBoxField ColumnID="CheckBoxField2" RenderAsStaticField="false" HeaderText="是否在校2" DisplayType="Switch" />
                <f:CheckBoxField PreciseClick="true" ColumnID="CheckBoxField3" RenderAsStaticField="false" HeaderText="是否在校3" DisplayType="Radio" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行复选框的状态" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
    <script>

        var grid1ClientID = '<%= Grid1.ClientID %>';

        F.ready(function () {

            var grid1 = F(grid1ClientID);
            var checkboxSelector = '.f-grid-cell .f-grid-checkbox';

            // 注册复选框的点击事件
            grid1.el.on('click', checkboxSelector, function (event) {
                var targetEl = $(this), checked = targetEl.hasClass('f-checked');

                // 如果取消复选框选中，则不做处理
                if (checked) {
                    var cellEl = targetEl.closest('.f-grid-cell');
                    var rowEl = cellEl.closest('.f-grid-row');

                    var columnId = cellEl.attr('data-columnid');

                    // 当前列的复选框的CSS选择器
                    var columnCheckboxSelector = '.f-grid-cell-' + columnId + checkboxSelector;

                    rowEl.siblings().find(columnCheckboxSelector).removeClass('f-checked');
                }
            });
        });



    </script>
</body>
</html>
