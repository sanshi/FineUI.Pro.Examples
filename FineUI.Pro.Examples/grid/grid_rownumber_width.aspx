<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rownumber_width.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rownumber_width" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="10" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged">
            <Columns>
                <f:RowNumberField EnablePagingNumber="true" Width="60px" />
                <f:RenderField Width="150px" DataField="Id" HeaderText="ID" />
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="EntranceTime" HeaderText="时间" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>单独设置序号列宽度，使行号与数据列宽度分别控制。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看序号列的独立设置</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>最左侧的序号列。<br />结果：序号列初始宽度为 60，姓名等数据列不会因为设置序号宽度而一起改变。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Width</code>（<strong>序号列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 <code>60</code>，只分配序号列宽度。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
