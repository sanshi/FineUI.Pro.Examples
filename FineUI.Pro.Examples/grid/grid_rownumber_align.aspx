<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rownumber_align.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rownumber_align" %>

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
                <f:RowNumberField EnablePagingNumber="true" Width="60px" TextAlign="Left" />
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
            <p>把序号列的文字明确设为靠左对齐。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看序号列的独立设置</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>最左侧的序号列。<br />结果：序号文字靠左侧排列，数据列仍采用各自的对齐配置。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>TextAlign</code>（<strong>序号列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>Left</code>，只决定序号文字对齐方向。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
