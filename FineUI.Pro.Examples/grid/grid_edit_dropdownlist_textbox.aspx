<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_edit_dropdownlist_textbox.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_edit_dropdownlist_textbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>



</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            DataKeyNames="Id,Name" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:RowNumberField EnableColumnHide="false" EnableHeaderMenu="false" ColumnID="Number" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField Width="160px" HeaderText="性别" ColumnID="Gender" DataField="Gender" RendererFunction="renderInput1" />
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
        function renderInput1(value, params) {
            params.grid = this;
            var gender = String(value) === '1' ? '男' : '女';
            return $('<span>').append(
                createGridChoiceInput(gender, params, {
                    id: 'ddlGender',
                    cssClass: 'gender',
                    type: 'DropDownList'
                }),
                createGridTextInput(gender, params, {
                    id: 'tbxGender',
                    cssClass: 'gender',
                    width: '60px'
                })
            );
        }

    </script>
    <script type="text/javascript">
        var gridClientID = '<%= Grid1.ClientID %>';
        var genderselector = '.f-grid-cell select.gender';

        function registerSyncEvent() {
            var grid = F(gridClientID);

            grid.el.on('change', genderselector, function(event) {
                var $this = $(this);
                var row = $this.parents('.f-grid-row');
                row.find('input.gender').val($this.val());
            });

        }

        F.ready(function() {
            registerSyncEvent();
        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>改变行内性别下拉选择时，同步更新同一行的文本框。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>让同行输入保持一致</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>某行的<strong>性别</strong>下拉列表切换男或女。<br />结果：同一行文本框立即显示对应<strong>性别</strong>，其他行保留原值。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="获取用户输入的性别">获取用户输入的性别</strong>。<br />结果：后台读取各行当前输入并显示结果；本页演示读取，不把它描述为保存学生资料。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>change</code>（<strong>行内输入与页面脚本</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：从事件源找到所属行，再同步该行文本框，避免修改到其他行。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
