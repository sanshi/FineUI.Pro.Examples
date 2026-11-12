<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_edit.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_edit" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>



</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            DataKeyNames="Id,Name">
            <Columns>
                <f:RowNumberField Width="60px" EnableColumnHide="false" EnableHeaderMenu="false" ColumnID="Number" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderInput1" />
            </Columns>
        </f:Grid>
        <br />

        <br />
        <f:Button runat="server" ID="Button1" OnClick="Button1_Click" CssClass="marginr" Text="获取用户输入的分组值">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="重新绑定表格" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        function renderInput1(value, params) {
            params.grid = this;
            return createGridTextInput(value, params, {
                id: 'tbxGroupName',
                cssClass: '',
                width: '60px'
            });
        }

    </script>
    <script type="text/javascript">
        var gridClientID = '<%= Grid1.ClientID %>';
        var inputselector = '.f-grid-cell input';


        function registerEnterEvent() {
            var grid = F(gridClientID);

            grid.el.on('keydown', inputselector, function(event) {
                if (event.keyCode === F.KEY.ENTER) {
                    var nextRow = $(this).parents('.f-grid-row').next();
                    if (nextRow.length) {
                        nextRow.find(inputselector).select();
                    }
                }
            });

            grid.el.on('click', inputselector, function(event) {
                $(this).select();
            });
        }

        F.ready(function() {
            registerEnterEvent();
        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在表格分组列直接放置文本输入框，批量读取各行当前输入。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>输入多行分组值</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>前两行<strong>分组</strong>输入框分别填写<code>999</code>和<code>888</code>。<br />结果：每行保留自己的文字；这是常驻的行内输入，不必先进入单元格编辑。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="获取用户输入的分组值">获取用户输入的分组值</strong>。<br />结果：客户端按行标识、<strong>姓名</strong>及当前输入收集数据并提交，后台显示各行读取结果；没有保存数据源的处理。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>逐行移动输入框</h3>
            <ul>
                <li>点击一个<strong>分组</strong>输入框后按 Enter 或 Tab。<br />结果：输入位置移到下一行，原文字自动选中；基础页只移动输入框，不同步改变选中行。Enter 由页面事件处理，Tab 使用输入框的 tabIndex 顺序。</li>
            </ul>
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
