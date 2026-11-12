<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_paging_database.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_paging_database" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" AllowPaging="true"
            IsDatabasePaging="true" PageSize="5" runat="server" DataKeyNames="Id,Name" Height="300px" OnRowCommand="Grid1_RowCommand"
            EnableCheckBoxSelect="false" OnPageIndexChanged="Grid1_PageIndexChanged">
            <Columns>
                <f:RowNumberField EnablePagingNumber="true"></f:RowNumberField>
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="Action1">
                    <Commands>
                        <f:Command CommandName="Action1" Text="按钮 1" />
                    </Commands>
                </f:RenderField>
                <f:RenderField ColumnID="Action2">
                    <Commands>
                        <f:Command ConfirmText="你确定要这么做么？" ConfirmTarget="Top" CommandName="Action2" Text="按钮 2" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在数据库分页后使用当前页的行命令，避免用旧行位置识别记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>换页后点击行命令</h3>
            <ol>
                <li>将<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>切到第二页，再点击其中一行的<strong>按钮 1</strong>或<strong>按钮 2</strong>。<br />结果：命令回发后，后台按当前页的行数据处理，<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("labResult").ClientID %>'
                        title="命令结果">命令结果</strong>显示当前记录的信息，不把相同页内行号当成第一页记录。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>PageSize</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>5</code>，决定当前页的记录数；换页后命令处理必须仍以本次行标识识别数据。
                </li>
                <li><code>OnRowCommand</code>（<strong>行命令</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：当前命令读取本轮行数据或事件参数，不缓存上一页的行位置。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
