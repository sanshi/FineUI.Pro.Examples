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
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            AllowCellEditing="true" ClicksToEdit="1">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
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


        F.ready(function() {

            var grid1 = F(grid1ClientID);

            // 注册评分事件
            F.rateEvents(grid1.el, function(event, value) {
                var target = $(event.target);
                var cellEl = target.closest('.f-grid-cell');

                var rowId = grid1.getRowId(cellEl);
                var columnId = grid1.getColumnId(cellEl);

                // 更新单元格的值
                // 对象中的键是列 ID，可用同一种写法更新一个或多个单元格。
                // API：https://fineui.com/js/api/FineUI.Grid.html#updateCellValue
                grid1.updateCellValue(rowId, {
                    [columnId]: value
                });
            });

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在表格正文中显示只读、五星与自定义半分评分，用户操作直接写回评分列数值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>对照三种评分列</h3>
            <ul>
                <li>尝试点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的<strong>只读评分</strong>，再在<strong>五星评分</strong>或<strong>自定义评分</strong>列点击一个分值。<br />结果：<strong>只读评分</strong>不因点击改变；可修改评分按点击位置更新，五星列显示对应说明文字，自定义列使用奖杯图标并允许半分。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>F.rateHtml</code>（<strong>评分列的渲染函数</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：分别配置只读、评分文字、自定义图标和半分能力，以当前单元格值生成评分显示。</li>
                <li><code>F.rateEvents</code>（<strong>页面脚本</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：通过表格容器接收评分动作，再定位到本次行和列，更新相应单元格值。</li>
            </ul>
        </section>
    </template>
</body>
</html>
