<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowselect.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowselect" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格（单选）" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" DataKeyNames="Id,Name" EnableRowSelectEvent="true" OnRowSelect="Grid1_RowSelect" EnableRowDeselectEvent="true"
            OnRowDeselect="Grid1_RowDeselect" EnableMultiSelect="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在行选中和取消选中时通过服务器事件显示对应记录的信息。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>对照选择事件</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单选）">表格（单选）</strong>选中一行，再选择另一行。<br />结果：选择动作回发，后台读取对应行的信息后提示所选记录；单选切换时原行取消、新行选中分别处理。</li>
                <li>取消已选记录或切换到另一条记录。<br />结果：触发取消选中处理，对应行信息出现在提示或日志中；没有改变选择时不凭普通单元格点击重复生成取消事件。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>观察行选中事件与行单击事件的区别；</li>
                <li>点击复选框取消选中行时，也会触发相应事件。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RowSelect / RowDeselect</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单选）">表格（单选）</strong>）：后台分别接收选中与取消选中事件，读取本次事件对应的行。</li>
            </ul>
        </section>
    </template>
</body>
</html>
