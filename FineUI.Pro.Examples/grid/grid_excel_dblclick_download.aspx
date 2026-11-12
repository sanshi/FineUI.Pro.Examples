<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_excel_dblclick_download.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_excel_dblclick_download" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" DataKeyNames="Id,Name" OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="Action1">
                    <Commands>
                        <f:Command CommandName="Action1" Text="按钮" />
                    </Commands>
                </f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="rowdblclick" Handler="onGridRowDblclick" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onGridRowDblclick(event, rowId) {
            F.doPostBack({
                eventName: 'GridRowDblclick',
                eventArgument: rowId,
                enableAjax: false
            });
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>双击一行时通过普通回发下载该行资料，避免把文件响应交给 AJAX 处理。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>下载指定行资料</h3>
            <ul>
                <li>双击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>第一行。<br />结果：请求携带当前行标识，后台读取这条记录并返回文本附件；首行对应标识 101，下载内容应与该行<strong>姓名</strong>、<strong>性别</strong>等资料一致。</li>
                <li>对另一行执行相同操作。<br />结果：下载改用新行标识与资料；不把整行选择中的其他记录一起导出。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>F.doPostBack / enableAjax</code>（<strong>页面导出处理</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：本页显式使用 enableAjax:
                    false，把附件响应交给浏览器；普通行命令仍可保留 AJAX。</li>
            </ul>
        </section>
    </template>
</body>
</html>
