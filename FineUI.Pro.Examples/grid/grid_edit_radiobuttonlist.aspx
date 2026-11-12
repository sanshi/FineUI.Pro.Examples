<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_edit_radiobuttonlist.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_edit_radiobuttonlist" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-cell .gender input {
            margin: 3px;
        }

        .f-grid-cell .gender label {
            margin-left: 3px;
            margin-right: 10px;
        }

    </style>



</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            DataKeyNames="Id,Name" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:RowNumberField EnableColumnHide="false" EnableHeaderMenu="false" ColumnID="Number" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField Width="150px" HeaderText="性别" DataField="Gender" RendererFunction="renderChoice1" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button runat="server" ID="Button1" OnClick="Button1_Click" Text="获取用户输入的性别">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        function renderChoice1(value, params) {
            params.grid = this;
            return createGridChoiceInput(value, params, {
                id: 'rblGender',
                cssClass: 'gender',
                type: 'RadioButtonList'
            });
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在表格各行直接显示性别单选项，提交时按行读取当前选择。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>修改行内选择并读取</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>首行把<strong>性别</strong>改为男。<br />结果：这一行显示新<strong>性别</strong>，同行选项保持单选，其他行的选择保留。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="获取用户输入的性别">获取用户输入的性别</strong>。<br />结果：客户端按行标识、<strong>姓名</strong>及当前输入收集数据并提交，后台显示各行读取结果；没有保存数据源的处理。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RendererFunction</code>（<strong>行内输入与页面脚本</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：按每行数据生成常驻输入或选择元素，页面脚本从实际行元素读取用户输入。</li>
                <li><code>OnClick / GridInputUtil.GetValue</code>（<strong>行内输入与页面脚本</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：将各行输入交给后台读取；输入不会因为仅修改 DOM
                    就自动写回源数据。</li>
            </ul>
        </section>
    </template>
</body>
</html>
