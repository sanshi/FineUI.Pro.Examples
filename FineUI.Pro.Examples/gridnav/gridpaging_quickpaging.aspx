<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_quickpaging.aspx.cs" Inherits="FineUI.Pro.Examples.gridnav.gridpaging_quickpaging" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true" AllowPaging="true"
            IsDatabasePaging="false" runat="server" EnableCheckBoxSelect="true" Height="450px" QuickPaging="true" MouseWheelSelection="true">
            <Columns>
                <f:RowNumberField EnablePagingNumber="true" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />


    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在当前页边界继续导航时自动翻页，使用已加载的完整数据。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>从当前页末行继续向下</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>第一页最后一行，按向下箭头。<br />结果：表格切到第二页并选中该页第一行；记录已全部加载，普通翻页在浏览器完成。</li>
                <li>在第二页第一行按向上箭头。<br />结果：返回上一页并把选择移到上一页末行；鼠标滚轮同样可用于行导航。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li><strong>出于性能考虑，请在实际项目中使用数据库分页（不要使用内存分页）！</strong></li>
                <li>本示例启用了QuickPaging，可以通过上下按键和鼠标滚轮（需设置MouseWheelSelection="true"）快速切换分页，分页后自动选中第一项或者最后一项。
                    <ul>
                        <li>先选中一行，然后通过上下按键和鼠标滚轮来切换选中行。</li>
                        <li>选中最后一行，向下按键或者向下滚动鼠标滚轮，会自动切换到下一页，并选中第一行。</li>
                        <li>选中第一行，向上按键或者向上滚动鼠标滚轮，会自动切换到上一页，并选中最后一行。</li>
                    </ul>
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>QuickPaging</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，在行导航越过当前页边界时切换分页。
                </li>
                <li><code>MouseWheelSelection</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，让滚轮参与选择行的移动。
                </li>
                <li><code>IsDatabasePaging</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>false</code>，本页加载完整数据后在浏览器分页。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
