<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_simulate_tree_checkboxfield_clientscript.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_simulate_tree_checkboxfield_clientscript" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            runat="server" EnableCheckBoxSelect="true" DataKeyNames="Id,Name,TreeLevel"
            OnRowCommand="Grid1_RowCommand" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:RowNumberField />
                <f:BoundField ColumnID="Name" DataField="Name" DataSimulateTreeLevelField="TreeLevel" DataFormatString="{0}"
                    HeaderText="地区" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:GroupField HeaderTextAlign="Center" HeaderText="这是多表头">
                    <Columns>
                        <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                        <f:CheckBoxField ColumnID="CheckBoxField1" RenderAsStaticField="false" HeaderText="复选框列" />
                        <f:LinkButtonField ColumnID="Action1" CommandName="Action1" Text="按钮 1" />
                        <f:LinkButtonField ColumnID="Action2" ConfirmText="你确定要这么做么？" ConfirmTarget="Top"
                            CommandName="Action2" Text="按钮 2" />
                    </Columns>
                </f:GroupField>
            </Columns>
        </f:Grid>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：
        <ul>
            <li>初始选中 安徽省 合肥市 黄山市 的复选框列；</li>
            <li>选中（或取消）父级的复选框，会同时选中（或取消）所有的子级复选框（客户端脚本实现）。</li>
        </ul>
    </form>
    <script>

        var gridClientID = '<%= Grid1.ClientID %>';
        var checkboxSelector = '.f-grid-cell-CheckBoxField1 .f-grid-checkbox';

        F.ready(function () {

            var grid = F(gridClientID);

            function getRowLevel(rowEl) {
                var rowData = grid.getRowData(rowEl);
                // 当前行的层级
                return $(rowData.values.Name).filter('.f-smtree-icon').length;
            }

            grid.el.on('click', checkboxSelector, function (event) {
                var rowEl = $(this).parents('.f-grid-row');
                var rowLevel = getRowLevel(rowEl);
                var rowChecked = rowEl.find(checkboxSelector).hasClass('f-checked');
                
                var nextRowEl = rowEl;
                while ((nextRowEl = nextRowEl.next()).length) {
                    if (getRowLevel(nextRowEl) > rowLevel) {
                        var checkboxEl = nextRowEl.find(checkboxSelector);
                        rowChecked ? checkboxEl.addClass('f-checked') : checkboxEl.removeClass('f-checked');
                    } else {
                        break;
                    }
                }
            });

        });


    </script>
</body>
</html>
