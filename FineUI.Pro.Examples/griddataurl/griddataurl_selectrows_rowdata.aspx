<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_selectrows_rowdata.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_selectrows_rowdata" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/griddataurl/griddataurl.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" EnableCheckBoxSelect="true" runat="server"
            DataIDField="Id" DataUrl="~/griddataurl/griddataurl.ashx">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                </f:RenderField>
                <f:RenderField ColumnID="Group" DataField="Group" RendererFunction="renderGroup" HeaderText="分组">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" CssClass="marginr" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="选中[陈飞]，[彭博]，[唐超]所在的行" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br /><br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var grid1ClientID = '<%= Grid1.ClientID %>';

        // 发起 Ajax 回发之前触发
        F.beforeAjax(function() {

            // 网址数据源模式下，服务器端表格不保存数据，因此需要自行附加选中的行数据
            F.setHidden('DataUrl_Grid_SelectedRowData', JSON.stringify(F(grid1ClientID).getSelectedRows(true)));

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在异步加载的表格中取得选中记录的完整行值，直接显示姓名、性别与专业。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>读取实际加载行中的字段</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>'
                        title="选中[陈飞]，[彭博]，[唐超]所在的行">选中[陈飞]，[彭博]，[唐超]所在的行</strong>。<br />结果：选择切换到陈飞、彭博、唐超对应的行，按主键 102、106、108 定位，不把它们解释为当前行序号。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="选中了哪些行">选中了哪些行</strong>。<br />结果：浏览器通过 getSelectedRows(true)
                    取得行对象，在提示中列出各行<strong>姓名</strong>、<strong>性别</strong>和专业；异步数据不需要先在后台绑定成静态 Rows。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：表格默认选中了[康颖颖]，[徐鹏]所在的行。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>getSelectedRows(true)</code>（<strong>网址数据加载与页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：返回包含 id、text 与 values
                    的实际已加载行对象。</li>
            </ul>
        </section>
    </template>
</body>
</html>
