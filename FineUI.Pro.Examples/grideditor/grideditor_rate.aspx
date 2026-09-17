<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_rate.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_rate" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false"
            runat="server" AllowCellEditing="true" ClicksToEdit="1">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
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
                <f:RenderField Width="150px" ColumnID="Rate1" DataField="Rate1" FieldType="Int" HeaderText="只读评分" RendererFunction="renderRate1" />
                <f:RenderField Width="200px" ColumnID="Rate2" DataField="Rate2" FieldType="Int" HeaderText="五星评分" RendererFunction="renderRate2" />
                <f:RenderField Width="200px" ColumnID="Rate3" DataField="Rate3" FieldType="Float" HeaderText="自定义评分" RendererFunction="renderRate3" />
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        
    </form>
    <script>

        var grid1ClientID = '<%= Grid1.ClientID %>';

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        var desc = ['terrible', 'bad', 'normal', 'good', 'wonderful'];
        function renderRate2Text(val) {
            var rateText = '-';
            if (val > 0) {
                rateText = desc[val - 1];
            }
            return rateText;
        }


        function renderRate1(value) {
            return F.rateHtml(value, {
                readonly: true
            });
        }

        function renderRate2(value) {
            return F.rateHtml(value, {
                textVisible: true,
                textRenderer: renderRate2Text
            });
        }

        function renderRate3(value) {
            return F.rateHtml(value, {
                allowHalf: true,
                iconFont: 'f-iconfont-trophy',
                textVisible: true
            });
        }


        F.ready(function () {

            var grid1 = F(grid1ClientID);

            // 注册评分事件
            F.rateEvents(grid1.el, function (event, value) {
                var target = $(event.target);
                var cellEl = target.closest('.f-grid-cell');

                var rowId = grid1.getRowId(cellEl);
                var columnId = grid1.getColumnId(cellEl);

                // 更新单元格的值
                grid1.updateCellValue(rowId, columnId, value);
            });

        });

    </script>
</body>
</html>
