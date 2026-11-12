<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkall_rowselectable_disabled.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkall_rowselectable_disabled" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" DataKeyNames="Id,Name" OnRowDataBound="Grid1_RowDataBound" DisableUnselectableRows="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField HeaderText="所学专业" ColumnID="Major" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="Button3" runat="server" Text="选中了哪些行（没选择的话不会回发页面）" OnClick="Button1_Click" ClickHandler="onButton3Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />

        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';

        function onButton3Click(event) {
            if (!F(Grid1ClientID).hasSelection()) {
                F.alert({
                    message: '没有选中项！',
                    messageIcon: 'information',
                    target: '_top'
                });
                return false;
            };
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在客户端行绑定时禁止指定记录被选择，并把不可选行显示为禁用外观。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>限制指定记录的选择</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>中入学年份大于等于 2008 的行复选框，再选择一条允许选择的记录。<br />结果：受限制的记录不会因点击新增选择，允许选择的记录正常勾选；不可选行同时呈现灰色禁用外观。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RowDataBoundFunction / unselectable</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：行绑定函数按入学年份设置不可选标记，不影响其他记录。
                </li>
                <li><code>DisableUnselectableRows</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，给不可选记录增加禁用外观，选择限制由逐行可选状态决定。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
