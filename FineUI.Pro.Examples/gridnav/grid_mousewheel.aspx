<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_mousewheel.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridnav.grid_mousewheel" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server" EnableCheckBoxSelect="true"
            DataKeyNames="Id,Name" DataIDField="Id" ShowSelectedCell="true" MouseWheelSelection="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" CssClass="marginr" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br /><br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>用鼠标滚轮移动当前选中行，保持相应单元格位置。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>用滚轮移动选择</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>第一行<strong>姓名</strong>单元格，把鼠标留在表格内向下、向上滚动。<br />结果：选择沿行方向前后移动，超出可见范围时表格跟随滚动；可通过本页读取选择的入口核对当前记录。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：选中表格的某一行，滚动鼠标滚轮，观察选中行的改变。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ShowSelectedCell</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，开启当前单元格的可见选择边框。
                </li>
                <li><code>MouseWheelSelection</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 <code>true</code>，初始为
                    <code>true</code>，滚轮用于移动当前行选择。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
