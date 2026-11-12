<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_renderfunction_params.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_renderfunction_params" %>

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
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
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
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" ColumnID="Major" DataField="Major" HeaderText="所学专业" RendererFunction="renderMajor">
                    <Editor>
                        <f:DropDownList ID="ddlMajor" Required="true" runat="server">
                            <f:ListItem Text="材料科学与工程系" Value="材料科学与工程系"></f:ListItem>
                            <f:ListItem Text="化学系" Value="化学系"></f:ListItem>
                            <f:ListItem Text="数学系" Value="数学系"></f:ListItem>
                            <f:ListItem Text="物理系" Value="物理系"></f:ListItem>
                            <f:ListItem Text="自动化系" Value="自动化系"></f:ListItem>
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="Salary" DataField="Salary" FieldType="Int" RendererFunction="renderSalary(0)" HeaderText="工资（整数）"
                    TextAlign="Right">
                    <Editor>
                        <f:NumberBox runat="server" EnableCommas="true" NoDecimal="true" Required="true" />
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="Salary2" DataField="Salary" FieldType="Float" RendererFunction="renderSalary(2)" HeaderText="工资（两位小数）"
                    TextAlign="Right">
                    <Editor>
                        <f:NumberBox runat="server" EnableCommas="true" DecimalPrecision="2" TrimEndZero="false" Required="true" />
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
        var ddlGenderID = '<%= ddlGender.ClientID %>';

        function renderGender(value) {
            return F(ddlGenderID).getTextByValue(value);
        }


        var ddlMajorID = '<%= ddlMajor.ClientID %>';

        function renderMajor(value) {
            return F(ddlMajorID).getTextByValue(value);
        }

        function renderSalary(decimalNumber) {
            // 返回函数体，创建一个闭包，在函数体内部可以调用外部变量 - decimalNumber
            return function(value) {
                if (decimalNumber === 0) {
                    value = parseInt(value, 10);
                } else {
                    value = value.toFixed(decimalNumber);
                }
                return F.addCommas(value);
            };
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>用同一个渲染函数工厂传入不同参数，分别显示整数工资和两位小数工资。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>对照两种工资显示精度</h3>
            <ul>
                <li>比较<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>的工资整数列与两位小数列，也可分别进入编辑后修改数值。<br />结果：整数列按 0 位小数处理，另一列保留两位小数，两列都使用千分位；显示格式由各自传入的精度参数决定。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RendererFunction</code>（<strong>两种工资列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（单击编辑）">表格（单击编辑）</strong>）：两列分别使用
                    renderSalary(0) 与 renderSalary(2)；函数先接收精度，再返回真正处理单元格值的函数。</li>
            </ul>
        </section>
    </template>
</body>
</html>
