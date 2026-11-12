<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_radio.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_radio" %>

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
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderCheckField Width="150px" ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderCheckField Width="150px" ColumnID="TestColumn1" HeaderText="测试列（单选）" />
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="afteredit" Handler="onGrid1AfterEdit"></f:Listener>
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button2" CssClass="marginr" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
    </form>
    <script>
        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        function onGrid1AfterEdit(event, value, params) {
            var grid1 = F('<%= Grid1.ClientID %>');

            // 如果取消复选框选中，则不做处理
            if (value && params.columnId === 'TestColumn1') {
                // 遍历所有的行
                grid1.getRowEls().each(function() {
                    var row = grid1.getRowData($(this));
                    if (row.id !== params.rowId) {
                        // 如果不是当前操作的行，则取消单元格选中
                        // 对象中的键是列 ID，可用同一种写法更新一个或多个单元格。
                        // API：https://fineui.com/js/api/FineUI.Grid.html#updateCellValue
                        grid1.updateCellValue(row.id, {
                            [params.columnId]: false
                        });
                    }
                });

            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在可编辑表格中对照普通布尔列与只允许选中一条记录的单选列。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>切换测试列中的单选项</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>的测试列先选择一行，再选择另一行。<br />结果：第二行的测试项选中时取消第一行；普通<strong>是否在校</strong>列仍按各行自己的布尔值切换，两种列不混为同一选择集合。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DisplayType</code>（<strong>测试列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（单击编辑）">表格（单击编辑）</strong>）：测试列使用
                    Radio，正文选择在该列内互斥；它区别于表格整行的单选配置。</li>
            </ul>
        </section>
    </template>
</body>
</html>
