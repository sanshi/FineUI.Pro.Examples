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
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="false"
            runat="server"
            AllowCellEditing="true" ClicksToEdit="1">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ColumnID="Name" DataField="Name" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="姓名">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int"
                    RendererFunction="renderGender" HeaderText="性别">
                    <Editor>
                        <f:DropDownList ID="ddlGender" Required="true" runat="server">
                            <f:ListItem Text="男" Value="1" />
                            <f:ListItem Text="女" Value="0" />
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="Sheng" DataField="Sheng"
                    HeaderText="所在省">
                    <Editor>
                        <f:DropDownList ID="ddlSheng" Required="true" runat="server">
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="Shi" DataField="Shi"
                    HeaderText="所在市">
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
        注：
        <ul>
            <li>
                如果未设置省份，则所在市下拉列表禁用，并且显示提示信息 - 请先选择省！
            </li>
            <li>
                选择省份后，所在市下拉列表数据动态加载
            </li>
            <li>
                更改省份后，如果所在所在市不属于当前省份，则清空所在市
            </li>
        </ul>
    </form>
    <script>

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
                
                var shidata = window._SHI[sheng];
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
                var shidata = window._SHI[value];
                if (shidata) {
                    var shi = grid.getCellValue(params.rowId, 'Shi');
                    // 如果结束编辑时，市 不属于 当前 省，则清空 市
                    if ($.inArray(shi, shidata) < 0) {
                        grid.updateCellValue(params.rowId, 'Shi', '');
                    }
                }
            }
        }

    </script>
</body>
</html>
