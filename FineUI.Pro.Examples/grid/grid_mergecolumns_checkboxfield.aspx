<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_mergecolumns_checkboxfield.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_mergecolumns_checkboxfield" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            EnableColumnLines="true">
            <Columns>
                <f:RowNumberField />
                <f:BoundField ColumnID="Name" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" ColumnID="Major" DataField="Major" HeaderText="所学专业" />
                <f:ImageField ColumnID="GroupB" DataImageUrlField="GroupB" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:CheckBoxField ColumnID="CheckBoxField1" RenderAsStaticField="false" HeaderText="是否激活" />
            </Columns>
            <Listeners>
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行复选框的状态" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        注：同一分组的复选框只能选中一个。
    </form>
    <script>
        function onGridDataLoad(event) {
            this.mergeColumns(['GroupB']);
        }

        var gridClientID = '<%= Grid1.ClientID %>';

        F.ready(function () {

            var grid = F(gridClientID);
            var checkboxSelector = '.f-grid-cell-CheckBoxField1 .f-grid-checkbox';

            // 注册复选框的点击事件
            grid.el.on('click', checkboxSelector, function (event) {
                var targetEl = $(this), checked = targetEl.hasClass('f-checked');

                // 如果取消复选框选中，则不做处理
                if (checked) {
                    var rowEl = targetEl.parents('.f-grid-row');
                    var rowData = grid.getRowData(rowEl);

                    // 参考行的 GroupB 的值
                    var rowGroupB = rowData.values['GroupB'];

                    // 下一个要检查的行元素
                    var nextRowEl;

                    // 取消选中行中的复选框，返回 false 表明本行和参考行不属于同一个分组
                    function uncheckRow() {
                        var nextRowData = grid.getRowData(nextRowEl);
                        var nextRowGroupB = nextRowData.values['GroupB'];

                        if (nextRowGroupB == rowGroupB) {
                            nextRowEl.find(checkboxSelector).removeClass('f-checked');
                            return true;
                        } else {
                            // 不属于同一个分组
                            return false;
                        }
                    }
                    

                    // 向上查找相同 GroupB 的行，并取消选中复选框
                    nextRowEl = rowEl;
                    while ((nextRowEl = nextRowEl.prev()).length) {
                        if (!uncheckRow()) {
                            break;
                        }
                    }

                    // 向下查找相同 GroupB 的行，并取消选中复选框
                    nextRowEl = rowEl;
                    while ((nextRowEl = nextRowEl.next()).length) {
                        if (!uncheckRow()) {
                            break;
                        }
                    }
                    
                }
                
            });
        });

    </script>
</body>
</html>
