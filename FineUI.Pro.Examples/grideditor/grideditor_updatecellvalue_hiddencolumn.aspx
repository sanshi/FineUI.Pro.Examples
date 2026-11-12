<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_updatecellvalue_hiddencolumn.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_updatecellvalue_hiddencolumn" %>

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
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                    <Editor>
                        <f:DropDownList ID="ddlGender" Required="true" runat="server">
                            <f:ListItem Text="男" Value="1" />
                            <f:ListItem Text="女" Value="0" />
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" Hidden="true" HeaderText="入学年份">
                    <Editor>
                        <f:NumberBox ID="tbxEditorEntranceYear" NoDecimal="true" NoNegative="true" MinValue="2000" MaxValue="2025" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd"
                    HeaderText="入学日期">
                    <Editor>
                        <f:DatePicker ID="DatePicker1" Required="true" runat="server">
                        </f:DatePicker>
                    </Editor>
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button CssClass="marginr" ID="Button1" runat="server" Text="将全部[入学年份]加一" ClickHandler="onButtonClick"></f:Button>
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
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

        var gridClientID = '<%= Grid1.ClientID %>';
        var labResultClientID = '<%= labResult.ClientID %>';

        function onButtonClick(event) {
            var grid = F(gridClientID);

            var msg = [];
            grid.getRowEls().each(function() {
                var rowEl = $(this);
                var entranceYear = grid.getCellValue(rowEl, 'EntranceYear');
                var userName = grid.getCellValue(rowEl, 'Name');

                // 对象中的键是列 ID，可用同一种写法更新一个或多个单元格。
                // API：https://fineui.com/js/api/FineUI.Grid.html#updateCellValue
                grid.updateCellValue(rowEl, {
                    EntranceYear: entranceYear + 1
                });

                msg.push('[' + userName + ']的入学年份：' + entranceYear + ' -> ' + (entranceYear + 1));
            });


            F(labResultClientID).setValue(msg.join('<br>'));
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>不显示入学年份列时仍更新其数据，并用提示核对隐藏列更新前后的值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>更新没有显示出来的列</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="将全部[入学年份]加一">将全部[入学年份]加一</strong>。<br />结果：浏览器遍历记录，把隐藏的<strong>入学年份</strong>逐行加 1；提示列出更新前后的年份，表头仍不出现这列。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>页面加载时[<strong>入学年份</strong>]列处于隐藏状态</li>
                <li>保持[<strong>入学年份</strong>]列的隐藏状态，点击第一个更新按钮，然后点击[保存数据]按钮</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>updateCellValue</code>（<strong>入学年份列</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>）：按列标识更新数据，与该列当前是否可见无关。</li>
                <li><code>Hidden</code>（<strong>入学年份列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（单击编辑）">表格（单击编辑）</strong>）：初始为
                    <code>true</code>，隐藏列头与单元格，不删除行中的年份字段。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
