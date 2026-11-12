<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="right_rowexpander.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridlockcolumn.right_rowexpander" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" Width="1000px" EnableCollapse="false" Height="350px"
            runat="server" AllowColumnLocking="true" ColumnLockingRight="true" EnableCheckBoxSelect="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField EnableLock="true" Locked="true" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" EnableLock="true" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField EnableLock="true" Locked="true" LockedPosition="Right" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField EnableLock="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" Width="400px" EnableLock="true" HeaderText="所学专业" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField EnableLock="true" DataField="ShenGao" ColumnID="ShenGao" HeaderText="身高" />
                <f:RenderField EnableLock="true" DataField="TiZhong" ColumnID="TiZhong" HeaderText="体重" />
                <f:RenderField EnableLock="true" DataField="XueYaDi" ColumnID="XueYaDi" HeaderText="血压（低）" />
                <f:RenderField EnableLock="true" DataField="XueYaGao" ColumnID="XueYaGao" HeaderText="血压（高）" />
                <f:RenderField EnableLock="true" DataField="ShiLiZuo" ColumnID="ShiLiZuo" HeaderText="视力（左）" />
                <f:RenderField EnableLock="true" DataField="ShiLiYou" ColumnID="ShiLiYou" HeaderText="视力（右）" />
                <f:RenderField ColumnID="Group" EnableLock="true" Locked="true" LockedPosition="Right" HeaderText="分组" DataField="Group"
                    RendererFunction="renderGroup" />
                <f:RenderField EnableLock="true" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
                <f:RenderField ColumnID="expander" RenderAsRowExpander="true" DataField="Desc" RendererFunction="renderExpander" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="btnExpandRowExpanders" runat="server" CssClass="marginr" Text="展开全部的行扩展列" OnClick="btnExpandRowExpanders_Click">
        </f:Button>
        <f:Button ID="btnCollapseRowExpanders" runat="server" Text="折叠全部的行扩展列" OnClick="btnCollapseRowExpanders_Click">
        </f:Button>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在右侧列锁定表格中展开行详情，滚动时保持主行与扩展内容对应。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>展开后滚动查看记录</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>首行的展开图标，再横向滚动。<br />结果：该行下方出现扩展内容，锁定列留在原侧；再次点击图标只收起这一行的扩展内容。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RowExpanderField / Locked</code>（<strong>列锁定配置</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：行扩展入口与锁定布局共同使用，扩展内容不代替主行的数据列。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
